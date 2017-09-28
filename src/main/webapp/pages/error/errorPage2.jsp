<!DOCTYPE HTML>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="stylesheet" href="/payroll-agenda/statics/css/bootstrap.css">
<link rel="stylesheet" href="/payroll-agenda/statics/css/signin.css">
<link rel="stylesheet"
	href="/payroll-agenda/statics/css/stylesAdmin.css">
<script src="<spring:theme code='shortcut'/>"></script>
<title>Agenda</title>
</head>
<body>
	<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
	<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<div class="col-xs-12">

		<form id="formInicio" class="form-signin " name="loginForm"
			action="/payroll-agenda/homeAgenda" method="post">
			<div class="form-padding2">
				<img alt="HSBC"
					src="/payroll-agenda/statics/images/tablet/LogoHSBCLogIn.png"
					class="img-responsive center-block"><br>
				<br>
			</div>
			<div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<div class="center-block" style="width: 450px;">
					<h5 style="color: red;"><b>¡¡¡ OCURRIO UN ERROR INESPERADO !!!</b></h5>
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<div class="text-center nopadding">
					<a align="center" class="btn btn-primary btn-round " href="#"
						role="button" onclick="JavaScript:window.close();">
						&nbsp;&nbsp;&nbsp;&nbsp;Salir&nbsp;&nbsp;&nbsp;&nbsp; </a> <br>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
