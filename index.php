<?php
session_start();
if (isset($_SESSION['rotator'])) {
	$_SESSION['rotator']++;
} else {
	$_SESSION['rotator'] = rand(0,3);
}
switch ($_SESSION['rotator'] % 4) {
case 0:
   header( 'Location: home04.html' ) ;
   break;
case 1:
   header( 'Location: home04.html' ) ;
   break;
case 2:
   header( 'Location: home04.html' ) ;
   break;
case 3:
   header( 'Location: home04.html' ) ;
   break;
default:
   header( 'Location: home04.html' ) ;
}
?>
