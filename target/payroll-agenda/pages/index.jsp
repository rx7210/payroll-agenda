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
		window.open('/payroll-agenda/login', '_self');
	</script>
</body>
</html>