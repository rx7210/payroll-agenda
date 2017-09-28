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
<title>home</title>
</head>
<body class="page">
	<div id="contenedor">
		<div id="header">
			<jsp:include flush="false" page="/pages/include/menu.jsp" />
		</div>
		<div id="contenido">
			 ${searcher} 
			 
			 <div class="msgHome">
			 <p align="center" style="color: red;">¡ A G E N D A !</p>
			 <br><br>
			 <p align="center" style="color: red;">MODULO&nbsp;&nbsp;ADMINISTRADOR</p>
			 </div>
		</div>
		<div id="footer">
			<br>
		</div>
	</div>
	<script src="<spring:theme code='payroll'/>"></script>
</body>
</html>