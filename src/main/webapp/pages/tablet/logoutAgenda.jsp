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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="stylesheet" href="/payroll-agenda/statics/css/bootstrap.css">
<link rel="stylesheet" href="/payroll-agenda/statics/css/signin.css">
<link rel="stylesheet"
	href="/payroll-agenda/statics/css/stylesAdmin.css">
<script src="<spring:theme code='shortcut'/>"></script>
<title>Agenda</title>
</head>
<body style="padding:0px; width: 100%; height: 100%;">
	<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
	<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<div class="col-xs-12">
		<div class="form-padding2">
			<img alt="HSBC"
				src="/payroll-agenda/statics/images/tablet/LogoHSBCLogIn.png"
				class="img-responsive center-block"><br> <br>
		</div>
		<div>
			<br> <br> <br> <br> <br> <br>
			<div class="center-block"
				style="width: 380px; height: 100px; border: 2px; border-color: #EAF1E9;">
				<img src="/payroll-agenda/statics/images/iconConfirmed.gif"
					align="left" style="top: 30px; left: 10px; position: relative;">
				<p class="arial16Red" align="center"
					style="position: relative; top: 35px;">
					<b>SU SESION HA FINALIZADO</b>
				</p>
			</div>
			<br> <br> <br> <br> <br> <br>
			<div class="text-center nopadding">
				<a href="#" class="btn btn-primary btn-round " 
					onclick="JavaScript:window.close();">
					&nbsp;&nbsp;&nbsp;&nbsp;Salir&nbsp;&nbsp;&nbsp;&nbsp; </a> <br>
			</div>
		</div>
	</div>
</body>
</html>
