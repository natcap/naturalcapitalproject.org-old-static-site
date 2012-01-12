#!/bin/sh -e
# inject-google-analytics

TRACKER_ID="UA-24933546-1"

TRACKER_CODE="<script type=\"text/javascript\">
var gaJsHost = ((\"https:\" == document.location.protocol) ? \"https://ssl.\" : \"http://www.\");
document.write(unescape(\"%3Cscript src='\" + gaJsHost + \"google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E\"));
</script>
<script type=\"text/javascript\">
var pageTracker = _gat._getTracker('$TRACKER_ID');
pageTracker._trackPageview();
</script>"

cd `dirname $0`
find -name '*.html.new' -delete
find -name '*.html' | egrep -v -- '-frame.html$' | while read -r TARGET; do
  if grep -qi "<frameset" "$TARGET"; then
    continue;
  fi
  if grep -qi "$TRACKER_ID" "$TARGET"; then
    continue;
  fi

  echo "Injecting: $TARGET"

  case `grep -i '</body>' "$TARGET" | wc -l` in
  1)
    cat "$TARGET" | sed "s:\\(<\\/BODY>\\|<\\/body>\\):`echo $TRACKER_CODE | sed 's:;:\\\\;:g' | sed 's/:/\\\\:/g'`\\1:gi" > "$TARGET.new"
    mv -f "$TARGET.new" "$TARGET"
    ;;
  *)
    {
      cat "$TARGET"
      echo "$TRACKER_CODE"
    } > "$TARGET.new"
    mv -f "$TARGET.new" "$TARGET"
    ;;
  esac
done
