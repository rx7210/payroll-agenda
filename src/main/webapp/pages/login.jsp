<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Login</title>
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
			<form:form name="loginForm" method="POST"
				action="/payroll-agenda/loginValid">
				<br>
				<br>
				<br>
				<table style="margin: 0 auto;" class="arial12">
					<tr>
						<td colspan="2" width="150">&nbsp;</td>
					</tr>
					<tr align="center" height="40">
						<td colspan="2" valign="top"><spring:message code="lblLogin" /></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr valign="middle">
						<td align="right"><form:label path="userId" cssClass="aria11">
								<spring:message code="lblUser" />
							</form:label></td>
						<td style="padding-left: 10px;"><form:input path="userId" cssClass="arial11" size="12" value=""
								maxlength="10" /></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr valign="middle">
						<td align="right"><form:label path="password">
								<spring:message code="lblPassword" />
							</form:label></td>
						<td style="padding-left: 10px;"><form:password path="password" cssClass="arial11" size="12" value=""
								maxlength="50" /></td>
					</tr>
				</table>
				<input type="hidden" name="origen" value="1">
			</form:form>
			<br><br>
			<p align="center">
				<a href="http://intranet.mx.hsbc/" class="redButton"><spring:message
						code="lblBtnIntranet" /></a> &nbsp;&nbsp;&nbsp; <a href="#"
					onclick="document.forms['loginForm'].submit();" class="redButton"><spring:message
						code="lblBtnAceptar" /></a> <br> <br>
			<p align="center" class="arial12">
				<spring:message code="lblCau" />
			</p>
			<br>
			<p align="center" class="arial11Red">${error}</p>
			<br>
			<p align="right" class="arial9white">${version}</p>
		</div>
	</div>
</body>
</html>
