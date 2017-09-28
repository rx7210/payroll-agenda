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
<meta http-equiv="X-UA-Compatible" content="IE=edge,IE=11,chrome=1" />
<title>endSession</title>
<link rel="stylesheet" href="<spring:theme code='stylesAdmin'/>">
<link rel="stylesheet" href="/payroll-agenda/statics/css/bootstrap.css">
<link rel="stylesheet" href="/payroll-agenda/statics/css/signin.css">
</head>
<body style="padding:0px; width: 100%; height: 100%;">
	<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
	<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<div id="header">
		<div class="headerLogin">
			<span class="lblheaderLogin"> <spring:message code="lblNomApp" />
			</span>
		</div>
		<div class="navbarlogin">
			<img alt="HSBC" align="middle" class="logoNavBar"
				src="<spring:theme code='imglogoBlack'/> ">
		</div>
	</div>
	<div class="col-xs-12">
		<div>
			<br> <br> <br> <br> <br> <br>
			<div class="center-block" style="width: 320px;">
				<p align="center" class="arial16Red btn-round "
					style="padding: 20px; border: 2px; border-color: #EAF1E9;">
					<img src="/payroll-agenda/statics/images/iconConfirmed.gif">&nbsp;&nbsp;&nbsp;<b>SU
						SESION HA FINALIZADO</b>
				</p>
			</div>
			<br> <br> <br> <br> <br> <br>
			<div class="center-block" style="width: 100px;">
				<a href="#" class="btn btn-primary btn-round "
					style="padding-left: 40px; padding-right: 40px;" 
					onclick="JavaScript:window.close();">Salir</a>
			</div>
		</div>
	</div>
</body>
</html>