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
	<link rel="stylesheet" href="/payroll-agenda/statics/css/jquery-ui.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/tarjetaFirmas.css">
	<script src="<spring:theme code='jquery'/>"></script>
	<script src="/payroll-agenda/statics/js/jquery-ui.js"></script>
	<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<script type="text/javascript">
	</script>
	<title>Integracion</title>
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
</head>
<body style="padding:0px; width: 100%; height: 100%;">
<form id="formInteg" method="post" action="/payroll-agenda/takePhoto">
	<div class="col-xs-12">
		<div class="row shadow"  style="background: #f9f9ff;">
			<div class="col-xs-2 col-md-1 nopadding" >
				<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png" class="img-responsive center-block">
			</div>
			<div class="col-xs-2 col-md-1 hidetext" align="center"  >
				<a href="#" class="link" 
					onclick="document.forms['formInteg'].action = '/payroll-agenda/startVisit'; document.forms['formInteg'].submit();">
					<img alt="Regresar" src="/payroll-agenda/statics/images/tablet/FLECHA2.png" class="img-responsive center-block" style="padding:15px 0px 0px 0px">
					Regresar</a>
			</div>
			<div class="col-xs-4 col-md-8" >
				<h3 align="center" class="headstyle"><%=session.getAttribute("nameClient")%></h3>
				<h4 align="center">Cuenta:&nbsp;<br><%=session.getAttribute("account")%></h4>
			</div>
			<div class="col-xs-2 col-md-1 hidetext " align="center">
				<a href="#" class="link"
					onclick="javaScript:confirmExit('confirmExit');">
					<img alt="Cerrar" src="/payroll-agenda/statics/images/tablet/CERRAR.png" class="img-responsive center-block" style="padding:15px 0px 0px 0px">Cancelar
				</a>
			</div>
			<div class="col-xs-2 col-md-1 hidetext " align="center">
				<a href="#" class="link"><img src="/payroll-agenda/statics/images/tablet/Ayuda.png" class="img-responsive center-block" style="padding:7px 0px 0px 0px">Ayuda</a>
			</div>
		</div>
		<c:if test="${not empty error}">
			<div class="alert alert-dismissible alert-danger alert-hsbc">
		  		<button class="close" type="button" data-dismiss="alert">&times;</button>
				<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
				<span>&nbsp;&nbsp;&nbsp;${error}</span>
			</div>
		</c:if>
		<div  class=" form-signin-noBorder white shadow" style="margin-top:3%">
			<div align="center" style="background: #f9f9ff; margin:0; padding:	4%;
					border-top-left-radius: 25px;border-top-right-radius: 25px;" >
					<c:if test="${typeDocument == 7}">
						<h4>Tarea 8: Fotografía del nominahabiente</h4>
					</c:if>
					<c:if test="${typeDocument != 7}">
						<h4>Tarea 1: Digitalización de documentos</h4>
					</c:if>
			</div>
			<div  align="center" style="padding:4%">
				<c:if test="${typeDocument == 1}">
					<img alt="Documento" src="/payroll-agenda/statics/images/tablet/INE frente OFF.png" class="img-responsive center-block" style="max-width: 67px;">
				</c:if>
				<c:if test="${typeDocument == 3}">
					<img alt="Documento" src="/payroll-agenda/statics/images/tablet/INE reverso OFF.png" class="img-responsive center-block" style="max-width: 67px;">
				</c:if>
				<c:if test="${typeDocument == 7}">
					<img alt="Documento" src="/payroll-agenda/statics/images/tablet/docto.png" class="img-responsive center-block" style="max-width: 67px;">
				</c:if>
				<br>
				<c:if test="${typeDocument == 1 || typeDocument == 3}">
					<p style="line-height:1;">Digitalización de<br>${desDocument}</p>
				</c:if>
				<c:if test="${typeDocument == 7}">
					<p style="line-height:1;">
						Para continuar, necesitamos validar la<br>
						identidad del nominahabiente.
					</p>
				</c:if>
				<br>
	   			<c:if test="${typeDocument == 1}">
	   				<div class="row nopadding">
							<input class="filled-in" type="checkbox" name="useAs" id="useAs">
							<label for="useAs">Usar identificación como comprobante de domicilio.</label>
					</div>
					<br>
				</c:if>
				<a href="#" onclick="$('#spinner').modal();document.forms['formInteg'].submit();" class=" btn bcompleto btn-round" >Digitalizar</a>
				<c:if test="${isOptional == 1}">
					<c:choose>
						<c:when test="${finalDoc==1}">
							<a href="#" onclick="$('#spinner').modal();document.forms['formInteg'].action = '/payroll-agenda/optionalDocument'; document.forms['formInteg'].submit();" class=" btn bvisita btn-round">No digitalizar</a>
						</c:when>    
						<c:otherwise>
							<a href="#" onclick="$('#spinner').modal();document.forms['formInteg'].action = '/payroll-agenda/optionalDocument'; document.forms['formInteg'].submit();" class=" btn bvisita btn-round">No digitalizar</a>
						</c:otherwise>
				   </c:choose>
				</c:if>
	   			<br>
	   			<br>
			</div>		
		</div>
	</div>
	<input type="hidden" id="keyDocument" name="keyDocument" value="${keyDocument}">
	<input type="hidden" id="countDoc" name="countDoc" value="1">
</form>
<div class="modal" id="spinner" data-backdrop="static"
        data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
        	<div class="modal-header">
				<h3 class="modal-title">Procesando</h3>
           	</div>
            <div class="modal-body">
                <p>Su petición está siendo atendida.</p>
                <div class="progress progress-striped active ">
                    <div class="progress-bar progress-bar-danger" style="width:120%">
                  
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="modal.jsp" %>
</body>
</html>