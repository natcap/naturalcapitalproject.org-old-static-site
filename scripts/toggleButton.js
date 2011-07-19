/**
 * @author James Douglass
 */

function changeClass(ID) {
	var classname = document.getElementById(ID).className;
	//alert(classname);
	
	if (classname == "inactive"){
		document.getElementById(ID).className = document.getElementById(ID).className.replace(/\binactive\b/, 'active');
	}
	else {
		document.getElementById(ID).className = document.getElementById(ID).className.replace(/\bactive\b/, 'inactive');
	}
}