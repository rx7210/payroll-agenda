setInterval("window.defaultStatus = 'Agenda'", 1);

function init() {
	var msg = "*** FUNCION NO PERMITIDA ***";
	//Close window
	shortcut.add("Alt+F4",function() {
		sessionInvalidate();
	});
	shortcut.add("Ctrl+F4",function() {
		sessionInvalidate();
	});
	shortcut.add("Ctrl+w",function() {
		sessionInvalidate();
		window.close();
	});
	//Refresh
	shortcut.add("F5",function() {
		alert(msg);
	});
	shortcut.add("Alt+left",function() {
		alert(msg);
	});
	shortcut.add("Alt+right",function() {
		alert(msg);
	});
}

window.onload=init;

function sessionInvalidate() { 
	var url = '/payroll-agenda/InvalidateSession';

	if (window.ActiveXObject) { 
		httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
	else if (window.XMLHttpRequest) {
		httpRequest = new XMLHttpRequest(); 
	} 

	httpRequest.open("post", url, true); 
	httpRequest.onreadystatechange = function() {processRequest(); } ; 
	httpRequest.send(null); 
}

function setComboValue(cmb,value){
	var cmbText;
	var cont = 0;
	for (cont = 0; cont < cmb.length; cont++){
		cmbText = cmb.options[cont].text;
		if (cmbText.toUpperCase() == value.toUpperCase())
			cmb.selectedIndex = cont;
	}
}