<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
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
<link rel="stylesheet" href="<spring:theme code='stylesAdmin'/>">
<script src="<spring:theme code='jquery'/>"></script>
<script src="<spring:theme code='closeNav' />"></script>
<script src="<spring:theme code='shortcut'/>"></script>
<title>error</title>
</head>
<body>
	<div id="contenedor">
		<div id="header">
			<div class="headerLogin">
				<span class="lblheaderLogin"><spring:message code="lblNomApp" /></span>
			</div>
			<div class="navbarlogin">
				<img alt="HSBC" align="middle" class="logoNavBar"
					src="<spring:theme code='imglogoBlack'/> ">
			</div>
		</div>
		<div id="contenido">
			<div id="msgError" class="msgException">
				<div class="imgException">
					<img src="/payroll-agenda/statics/images/errorsCritical.gif">
				</div>
				<div class="divTxtException">
					<p class="arial11Red txtException">
						<b>¡¡¡ OCURRIO UN ERROR INESPERADO !!!</b>
					</p>
					<p>&nbsp;</p>
					<p class="arial11Red txtException">
						<b>${exception}</b>
					</p>
					
				</div>
			</div>

			<div style="top: 250px; position: relative;">
				<form name="logoutForm" method="post" action="/payroll-agenda/">
					<p align="center">
					<%-- 
						<a href="#" onclick="document.forms['logoutForm'].submit();"
							class="imgRedButton txtButton redButtonExit">Ingresar
							nuevamente</a> &nbsp;&nbsp;&nbsp; 
					--%>
							<a
							href="JavaScript:window.close();"
							class="imgRedButton txtButton redButtonExit">Salir</a>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>