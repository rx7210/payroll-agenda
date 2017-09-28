<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.Cookie"%>
<%
    Cookie[] cookielist = request.getCookies();
			if (cookielist != null) {
				for (int i = 0; i < cookielist.length; i++) {
					cookielist[i].setMaxAge(0);
					out.println("");
				}
			}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>index</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Expires" content="Fri, Jun 12 1981 08:20:00 GMT">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<script src="/payroll-agenda/statics/js/browser.js"></script>
<script type="text/javascript">
	document.oncontextmenu = function() {
		return false;
	};

	if (window.location.protocol == "http:") {
		var restOfUrl = window.location.href.substr(4);
		var isHttp = "<c:out value='${isHttp}' />";

		if (isHttp == "https") {
			var url = isHttp + restOfUrl;
			window.location = url;
		}
	}
</script>
</head>
<body>
	<script>
		var height=0; 
		var width=0;
		if (self.screen) {     // for NN4 and IE4
			width = screen.width;
			height = screen.height;
		} else {
			if (self.java) {   // for NN3 with enabled Java
				var jkit = java.awt.Toolkit.getDefaultToolkit();
				var screensize = jkit.getScreenSize();
				width = screensize.width;
				height = screensize.height; 
			}
		}
		window.open('/payroll-agenda/loginTablet', 'Agenda', 'status=yes, width='+ width +'px, height='+ height +'px, hotkeys=no, resizable=yes, menubar=no, location=no, directories=no, scrollbars=no, left=0, top=0');
	</script>
</body>
</html>