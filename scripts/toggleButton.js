/**
 * @author James Douglass
 */

function changeClass() {
	var classname = document.getElementById("dl_button").className;
	//alert(classname);
	
	if (classname == "inactive"){
		document.getElementById("dl_button").className = document.getElementById("dl_button").className.replace(/\binactive\b/, 'active');
	}
	else {
		document.getElementById("dl_button").className = document.getElementById("dl_button").className.replace(/\bactive\b/, 'inactive');
	}
}