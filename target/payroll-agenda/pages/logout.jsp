<!DOCTYPE HTML>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>logout</title>
<link rel="stylesheet" href="<spring:theme code='stylesAdmin'/>">
<meta http-equiv="X-UA-Compatible" content="IE=11" />
</head>
<body class="page">
	<div id="contenedor">
		<div id="header">
			<div class="headerLogin">
				<span class="lblheaderLogin">
					<spring:message code="lblNomApp" />
				</span>
			</div>
			<div class="navbarlogin">
				<img alt="HSBC" align="middle" class="logoNavBar"
					src="<spring:theme code='imglogoBlack'/> ">
			</div>
		</div>
		<div id="contenido">
			<br> <br> <br> <br> <br>
			<p align="center" class="arial11Red">USTED HA CERRADO SU SESION
				CORRECTAMENTE</p>
			<br>
			<form name="logoutForm" method="POST" action="/payroll-agenda/">
				<p align="center">
				<%-- 
					<a href="#" onclick="document.forms['logoutForm'].submit();"
						class="redButton">Ingresar nuevamente</a> &nbsp;&nbsp;&nbsp; 
						--%>
						<a
						href="JavaScript:window.close();" class="redButton">Salir</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>