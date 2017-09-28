<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<title>Add</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="stylesheet" href="/payroll-agenda/statics/css/bootstrapForms.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/signin.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/tarjetaFirmas.css">
	<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
	<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<script src="/payroll-agenda/statics/js/bootbox.js"></script>
	
	<script src="/payroll-agenda/statics/js/angular.min-1.5.7.js"></script>
	<script src="/payroll-agenda/statics/js/angular/angular-ui-router.js"></script>
	<script src="/payroll-agenda/statics/js/angular/tablet/add.js"></script>
	<script src="/payroll-agenda/statics/js/angular/tablet/config.js"></script>
	
	<link rel="stylesheet" href="/payroll-agenda/statics/css/materialIcons.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/MaterialDate.css">
	
	<script src="/payroll-agenda/statics/js/moment.js"></script>
	<script src="/payroll-agenda/statics/js/MaterialDate.js"></script>
	
</head>
<body style="padding: 0px"  ng-app="app" ng-controller="addController as addControllerVM">
	<script type="text/javascript">
		function isConnected() {
			var urlLoc = window.location.href;
			var idx = urlLoc.search("payroll-agenda/") + 15;
			var url = urlLoc.substring(0, idx) + "statics/js/jquery-ui.js";

			try {
				var http = new XMLHttpRequest();
				http.open('HEAD', url, false);
				http.send();
				$('#noConnection').modal('hide');
			} catch(err) {
				$('#noConnection').modal();
			}
		
			setTimeout("isConnected()",1000);
		}
		   
		
	</script>
	<form name="formADD" id="formADD" method="post" action="/payroll-agenda/saveDocument">
		<input type="hidden" id="keyDocument" name="keyDocument" value="6">
		<input type="hidden" id="page" name="page" value="${page}">
		<input type="hidden" id="processing" name="processing" value="">
		<input type="hidden" id="accountClient" name="accountClient" value="<%=session.getAttribute("account")%>">
		<input type="hidden" id="page" name="page" value="${page}">
		<input type="hidden" id="newCaptureSameDocument" name="newCaptureSameDocument" value="">
	</form>
	<div ui-view> </div>
		<input type="hidden" id="listCountries" name="listCountries" 
				value="<c:forEach var="country" items="${countries}">${country}|</c:forEach>">	
	<%@ include file="modal.jsp" %>
	
			<c:if test="${not empty error}">
			<div class="alert alert-dismissible alert-danger alert-hsbc">
		  		<button class="close" type="button" data-dismiss="alert">&times;</button>
				<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
				<span>&nbsp;&nbsp;&nbsp;${error}</span>
			</div>
		</c:if>
</body>
</html>
