<!DOCTYPE HTML>
<%@page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<title>Firmas</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/signaturePad.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/bootstrap.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/signin.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/tarjetaFirmas.css">
	<script src="<spring:theme code='jquery'/>"></script>
	<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<script src="/payroll-agenda/statics/js/bootbox.js"></script>
<script type="text/javascript">
		
function init() {
	isConnected();
}

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

	setTimeout("isConnected()",10000);
}
</script>
</head>
<body onload="Javascript:init();" style="padding:0px; width: 100%; height: 100%;">
<div class="col-xs-12 nopadding">
	<form name="formSignature" id="formSignature" method="post" action="/payroll-agenda/saveSignature">
		<div class="col-xs-12 row nopadding shadow"  style="background: #f9f9ff;">
			<div class="col-xs-2 col-md-1 nopadding" >
				<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png" class="img-responsive center-block">
			</div>
			<div class="col-xs-2 col-md-1 hidetext" align="center"  >
				<a href="#" class="link" 
					onclick="$('#spinner').modal();document.forms['formSignature'].action='/payroll-agenda/startIntegration'; document.forms['formSignature'].submit();">
					<img alt="Regresar" src="/payroll-agenda/statics/images/tablet/FLECHA2.png" class="img-responsive center-block" style="padding:15px 0px 0px 0px">
					Regresar</a>
			</div>
			<div class="col-xs-6 col-md-9 " >
				<h3 align="center" class="headstyle"><%=session.getAttribute("nameClient")%></h3>
				<h4 align="center">Cuenta:&nbsp;<%=session.getAttribute("account")%></h4>
			</div>
			<div class="col-xs-2 col-md-1 hidetext " align="center">
				<a href="#" class="link"><img src="/payroll-agenda/statics/images/tablet/Ayuda.png" class="img-responsive center-block" style="padding:7px 0px 0px 0px">Ayuda</a>
			</div>
		</div>
		
		<div class="row">
			<c:if test="${not empty error}">
				<div class="alert alert-dismissible alert-danger alert-hsbc">
			  		<button class="close" type="button" data-dismiss="alert">&times;</button>
					<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
					<span>&nbsp;&nbsp;&nbsp;${error}</span>
				</div>
			</c:if>
			
			<div class="col-xs-12">
				<div  class=" form-signin-noBorder white shadow" style="margin-top:2%">
					<div align="center" style="background: #f9f9ff; margin:0; padding:5px;
							border-top-left-radius: 25px;border-top-right-radius: 25px;" >
							<p>Tarea 7: Recolección de firmas</p>
					</div>
					<div  align="left" style="padding:15px;">
						<div class="row nopadding" >
							<input class="filled-in" type="checkbox" id="termsAndConditions" name="termsAndConditions" />
							<label for="termsAndConditions" style="line-height:1 !important;">
								Entiendo y acepto términos y condiciones.<br>
								<a href="javascript:showMoreInfo('${txtTermCond}')" id="popoverTermsAndConditions"  class="linkG" style="font-size:80%">
									<img style="display:inline-block;width:20px" src="/payroll-agenda/statics/images/tablet/expandInfo_btn.png" class="img-responsive"/>
									Ver más información
								</a>
							</label>
						</div>
						<br>
						<div class="row nopadding" >
							<input class="filled-in" type="checkbox" id="verifyInfo" name="verifyInfo" />
							<label for="verifyInfo" style="line-height:1 !important;">
								Autorización de Consulta de Información Crediticia.<br>
								<a href="javascript:showMoreInfo('${txtInfoCred}')" id="popoverVerifyInfo"  class="linkG" style="font-size:80%">
									<img style="display:inline-block;width:20px" src="/payroll-agenda/statics/images/tablet/expandInfo_btn.png" class="img-responsive"/>
									Ver más información
								</a>	
							</label>
						</div>	
						<br>
						<div class="row nopadding">
							<input class="filled-in" type="checkbox" id="marketingAndPublicity" name="marketingAndPublicity"/>
							<label for="marketingAndPublicity" style="line-height:1 !important;">
								Autorización de Mercadeo.<br>
								<a href="javascript:showMoreInfo('${txtAutMercadeo}')" id="popoverVerifyInfo"  class="linkG" style="font-size:80%">
									<img style="display:inline-block;width:20px" src="/payroll-agenda/statics/images/tablet/expandInfo_btn.png" class="img-responsive"/>
									Ver más información
								</a>
							</label>
						</div>
						<br>
						<c:if test="${sessionScope.GeneraADD == 1}">
							<div class="row nopadding">
								<input class="filled-in" type="checkbox" id="add" name="add"/>
								<label for="add" style="line-height:1 !important;">
									Mantenimiento de Datos.<br>
									<a href="javascript:showMoreInfo('${txtADD}')" id="popoverVerifyInfo"  class="linkG" style="font-size:80%">
										<img style="display:inline-block;width:20px" src="/payroll-agenda/statics/images/tablet/expandInfo_btn.png" class="img-responsive"/>
										Ver más información
									</a>
								</label>
							</div> 
							<br>
						</c:if>	
						<div class="row nopadding">
							<input class="filled-in" type="checkbox" id="globalStandars" name="globalStandars"/>
							<label for="globalStandars" style="line-height:1 !important;">
								Formato de Global Standards de Cuentas Nómina.<br>
								<a href="javascript:showMoreInfo('${txtGS}')" id="popoverVerifyInfo"  class="linkG" style="font-size:80%">
									<img style="display:inline-block;width:20px" src="/payroll-agenda/statics/images/tablet/expandInfo_btn.png" class="img-responsive"/>
									Ver más información
								</a>
							</label>
						</div>
						
						<br>
						<div class="row nopadding" align="center">
							<img  class="img-responsive center-block" id="previewimage">
						</div>
						<br>
						<div class="row nopadding" align="center">
							<a class="btn bcompleto" id="signButton" href="#signPad" data-toggle="modal" >Firmar</a>
							<a class="btn bcompleto" href="#" id="save">Continuar</a>
						</div>

			   			<br>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="keyDocument" name="keyDocument" value="${keyDocument}">
		<input type="hidden" id="encodedImage" name="encodedImage" value="">
		<input type="hidden" id="newCaptureSameDocument" name="newCaptureSameDocument" value="true">
		<input type="hidden" id="page" name="page" value="${page}">
		<input type="hidden" id="countSignature" name="countSignature" value="${countSignature}">
		<input type="hidden" id="processing" name="processing" value="">
	</form>
</div>
<div class="modal fade" id="spinner" data-backdrop="static"
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
<div class="modal fade" id="signPad" data-backdrop="static"
    data-keyboard="false">
    <div class="modal-dialog modal-custom">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" align="center">Tarjeta de Firmas</h3>
            </div>
            <div class="nopadding modal-body">
            	<div>
	                <div id="signature-pad" class="m-signature-pad col-xs-12"> 
						<div class="m-signature-pad--body">
							<canvas></canvas>
						</div>
					</div>
				</div>
				<div align="center">
					<a href="#" id="accept" class="btn btn-xs bcompleto">Aceptar</a>
					<a href="#" id="clear" class=" btn btn-xs bcompleto">Reintentar</a>
				</div>
            </div>
        </div>
    </div>
</div>

<%@ include file="modal.jsp" %>
<script>
function showMoreInfo(message){
	bootbox.dialog({
		title: '',
		message: "<p align='justify' style='font-size: 20px;'>" + message + "</p>",
		size:'large'});
}
$(function(){
	$( "#signPad" ).on('shown.bs.modal', function (e) {
		resizeCanvas();
		
	});
});
</script>
<script src="/payroll-agenda/statics/js/signature_pad.js"></script>
<script src="/payroll-agenda/statics/js/app_signature.js"></script>
</body>
</html>