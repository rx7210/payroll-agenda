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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/jquery-ui.css">
	<script src="<spring:theme code='closeNav' />"></script>
	<script src="<spring:theme code='jquery'/>"></script>
	<script src="<spring:theme code='payroll'/>"></script>
	<script src="<spring:theme code='shortcut'/>"></script>
	<script src="${pageContext.request.contextPath}/statics/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/webcam.js"></script>
	<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<script src="/payroll-agenda/statics/js/bootbox.js"></script>
	<script src="/payroll-agenda/statics/js/compress.js"></script>
	
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
		
	function saveSnapshot(){
		//Para evitar doble submit se establece un token
		$('#spinner').modal();
		var processing = $("#processing").val();
		if (processing){
			$('#spinner').modal('hide');
			bootbox.alert({
				message:"Hay una solicitud en proceso, por favor espere",
				buttons:{
					ok:{
						label:"Aceptar"
					}
				}
			});
		}else{
			$('#spinner').modal('hide');
			$("#processing").val("true");
			$("#cancelSnapshotDigitBtn").css({"opacity":"0.4","cursor": "not-allowed"});
			$("#saveSnapshotBtn").css({"opacity":"0.4","cursor": "not-allowed"});
			$("#cancelPreviewSnapshotBtn").css({"opacity":"0.4","cursor": "not-allowed"});
			var raw_image_data = Webcam.getEncodedImage();
			$("#encodedImage").val(raw_image_data);
			bootbox.confirm({
				closeButton: false,
				animate:false,
				message: " ¿Deseas capturar otra imagen del mismo documento?",
				buttons: {
					
					confirm: {
						label: '&nbsp;&nbsp;&nbsp;NO&nbsp;&nbsp;&nbsp;',
						className:'btn-lg btn-default '
					},
					cancel: {
						label: '&nbsp;&nbsp;&nbsp;SI&nbsp;&nbsp;&nbsp;',
						className:'btn-lg btn-primary marginR25'
					}
				},
				callback: function (result) {
					if (!result) {
						bootbox.hideAll();
						$("#newCaptureSameDocument").val("true");
						if($('#finalDoc').val()=="1"){
							$('#proccess').modal();
						}else{
							$('#spinner').modal();
						}
	          			
	          			document.forms['formDigId'].submit();
					}
					else{
						if($('#finalDoc').val()=="1"){
							$('#IWHSend').modal();
						}else{
							$('#proccess').modal();
						}
	          			document.forms['formDigId'].submit();
					}
	          			
						
				}
			});
		}
	 }
	function saveSnapshot2(){
		//Para evitar doble submit se establece un token
		$('#spinner').modal();
		var processing = $("#processing").val();
		if (processing){
			$('#spinner').modal('hide');
			bootbox.alert({
				message:"Hay una solicitud en proceso, por favor espere",
				buttons:{
					ok:{
						label:"Aceptar"
					}
				}
			});
		}else{
			$('#spinner').modal('hide');
			$("#processing").val("true");
			$("#cancelSnapshotDigitBtn").css({"opacity":"0.4","cursor": "not-allowed"});
			$("#saveSnapshotBtn").css({"opacity":"0.4","cursor": "not-allowed"});
			$("#cancelPreviewSnapshotBtn").css({"opacity":"0.4","cursor": "not-allowed"});
			bootbox.confirm({
				closeButton: false,
				animate:false,
				message: " ¿Deseas capturar otra imagen del mismo documento?",
				buttons: {
					
					confirm: {
						label: '&nbsp;&nbsp;&nbsp;NO&nbsp;&nbsp;&nbsp;',
						className:'btn-lg btn-default '
					},
					cancel: {
						label: '&nbsp;&nbsp;&nbsp;SI&nbsp;&nbsp;&nbsp;',
						className:'btn-lg btn-primary marginR25'
					}
				},
				callback: function (result) {
					if (!result) {
						bootbox.hideAll();
						$("#newCaptureSameDocument").val("true");
	          			$('#spinner').modal();
	          			document.forms['formDigId'].submit();
					}
					else{
						$('#spinner').modal();
	          			document.forms['formDigId'].submit();
					}
	          			
						
				}
			});
		}
	 }
	
	function cancelDigitalizaId(){
		//no puede cancelar si ya se mando a guardar
		var processing = $("#processing").val();
		if (processing){
			bootbox.alert({
				message:"Hay una solicitud en proceso, por favor espere",
				buttons:{
					ok:{
						label:"Aceptar"
					}
				}
			});
		}else{
			document.forms['formDigId'].action = '/payroll-agenda/startIntegration';
			document.forms['formDigId'].submit();
		}
	}
	function cancelPreview(){
		//no puede cancelar el preview si ya se mando a guardar
		var processing = $("#processing").val();
		if (processing){
			bootbox.alert({
				message:"Hay una solicitud en proceso, por favor espere",
				buttons:{
					ok:{
						label:"Aceptar"
					}
				}
			});
		}else{
			if (Webcam.isCamaraSupported()){
				Webcam.unFreezeSnap();
				$("#previewSnapshot").show();
				$("#saveSnapshot").hide();
				$("#cancelPreviewSnapshot").hide();
				$("#processing").val("");
			}else{
				bootbox.alert({
					message:'Acceso a la cámara denegado, favor de habilitarla',
					buttons:{
						ok:{
							label:"Aceptar"
						}
					}
				});
			}
		}
	}
	function previewSnapshot() {
		var processing = $("#processing").val();
		if (processing){
			bootbox.alert({
				message:"Hay una solicitud en proceso, por favor espere",
				buttons:{
					ok:{
						label:"Aceptar"
					}
				}
			});
		}else{
			if (Webcam.isCamaraSupported()){
				$("#processing").val("true");
				processing = $("#processing").val();
				Webcam.snapAndFreeze();
				$("#previewSnapshot").hide();
				$("#saveSnapshot").show();
				$("#cancelPreviewSnapshot").show();
				$("#processing").val("");
			}else{
				bootbox.alert({
					message:'Acceso a la cámara denegado, favor de habilitarla',
					buttons:{
						ok:{
							label:"Aceptar"
						}
					}
				});
			}
		}
	}
	
	$( document ).ready(function() {
		if (navigator.userAgent.indexOf('Android')>-1) {
			var clickEvent = document.createEvent('MouseEvent');
		    clickEvent.initEvent('click', true, true);
		    document.getElementById("fototext").dispatchEvent(clickEvent);
		    document.getElementById("foto").dispatchEvent(clickEvent);
		}
	}); 
	
	
	</script>
	<title>Digitalizar</title>
</head>
<body onload="isConnected()" style="padding:0px; width: 100%; height: 100%;">
<form name="formDigId" id="formDigId" method="post" action="/payroll-agenda/saveDocument">
	<div class="col-xs-12">
		<div class="row shadow"  style="background: #f9f9ff;">
			<div class="col-xs-2 col-md-1 nopadding" >
				<img alt="HSBC" src="${pageContext.request.contextPath}/statics/images/tablet/LogoBlue2.png" class="img-responsive center-block">
			</div>
			<div class="col-xs-2 col-md-1 hidetext" align="center"  >
				<a href="#" class="link" 
					onclick="document.forms['formDigId'].action = '/payroll-agenda/startIntegration'; document.forms['formDigId'].submit();">
					<img alt="Regresar" src="/payroll-agenda/statics/images/tablet/FLECHA2.png" class="img-responsive center-block" style="padding:15px 0px 0px 0px">
					Regresar</a>
			</div>
			<div class="col-xs-6 col-md-9" >
				<h3 align="center" class="headstyle"><%=session.getAttribute("nameClient")%></h3>
				<h4 align="center">Cuenta:&nbsp;<%=session.getAttribute("account")%></h4>
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
		<div class="row" id="windowsSelector">
			<div class="col-xs-2 " style="padding-top:10%">
				<div id="cancelSnapshotDigit" class="cancelSnapshotDigit">
					<a href="javascript:cancelDigitalizaId();">
						<img class="img-responsive center-block " alt="Cancelar" id="cancelSnapshotDigitBtn" src="${pageContext.request.contextPath}/statics/images/tablet/Cancelardigitalizacion.png" >
					</a><br>
				</div>
				<div id="cancelPreviewSnapshot" class="cancelPreviewSnapshot">
					<a href="javascript:cancelPreview();">
						<img class="img-responsive center-block " alt="Reintentar" id="cancelPreviewSnapshotBtn" src="${pageContext.request.contextPath}/statics/images/tablet/Repetirdigitalizacion.png" >
					</a>
				</div>			
			</div>
			<div class="col-xs-8" style="padding-top:2%">
				<div  id="camcontainer" class=" center-block">
					<div id="camera" style="width: 220px;"></div>
				</div>
			</div>
			<div class="col-xs-2 " style="padding-top:10%">
				<div id="previewSnapshot" class="previewSnapshot">
					<a href="javascript:previewSnapshot();">
						<img class="img-responsive center-block " alt="Foto" id ="previewSnapshotBtn" src="${pageContext.request.contextPath}/statics/images/tablet/Digitalizar.png" >
					</a>
				</div>
				<div id="saveSnapshot" class="saveSnapshot">	
					<a href="javascript:saveSnapshot();">
						<img class="img-responsive center-block " alt="Foto" id="saveSnapshotBtn" src="${pageContext.request.contextPath}/statics/images/tablet/Aceptardigitalizacion.png" >
					</a>
				</div>
			</div>
		</div>
		<div class="col-xs-12" id="androidSelector" align="center">
			<div class="row">
				<div class="col-xs-3"></div>
				<div class="col-xs-6">
					<img class="img-responsive center-block" id="previewimage">
				</div>
				<div class="col-xs-3"></div>
			</div>
			<br>
			<div class="row">
				<div class="col-xs-6" align="right">
		        	<label id ="fototext" for="foto" class="btn btn-round bcompleto">Toma una foto...</label>
		        	<input style="visibility:hidden;" type="file" name="foto" id="foto" class="SubirFoto" accept="image/*" capture="camera"  />	        	
	        	</div class="col-xs-6">
	        	<div class="col-xs-6" align="left">
	        		<a class="btn bcompleto btn-round" id="record_button" onclick="recordToFilename(this);" href="javascript:void(0);" title="Record">Enviar foto</a>
				</div>
			</div>
	</div>
	<script>
	var resultP;

    function readFile() {
		if (this.files && this.files[0]) {
			var FR= new FileReader();
			
			FR.addEventListener("load", function(e) {
			  $("#encodedImage").val(e.target.result);
			  document.getElementById("previewimage").src = e.target.result;
			  document.getElementById('record_button').style.display='inline-block';
			  document.getElementById('fototext').innerHTML= "Intentar de nuevo";
			}); 
			
			FR.readAsDataURL( this.files[0] );
		}
	}

	document.getElementById("foto").addEventListener("change", readFile);
	
		var agent=navigator.userAgent;
		if (agent.indexOf('Android')>-1) {
			this.mobile = true;     
			document.getElementById('androidSelector').style.display='block';
			document.getElementById('record_button').style.display='none';
			
			document.getElementById('windowsSelector').style.display='none';
		} else {
			document.getElementById('androidSelector').style.display='none';
			document.getElementById('windowsSelector').style.display='block';
			var widthProp = ${requestScope.cameraProps.width};
			var heightProp = ${requestScope.cameraProps.height};
			var dest_widthProp = ${requestScope.cameraProps.destWidth};
			var dest_heightProp = ${requestScope.cameraProps.destHeight};
			var image_formatProp = '${requestScope.cameraProps.imageFormat}';
			var swfURLProp= '${pageContext.request.contextPath}/statics/flash/webcam.swf';
			Webcam.set({
				width: widthProp,
				height: heightProp,
				dest_width: dest_widthProp,
				dest_height: dest_heightProp,
				force_flash: true,
				image_format: image_formatProp,
				jpeg_quality: 100,
				swfURL: swfURLProp,
				setCameraIndex:1,
				unfreeze_snap:false
			});
			Webcam.attach( '#camera' );
			
			$(document).ready(function() {
				$("#camera").removeAttr("style");
				$("#camcontainer").css('width',widthProp)
				$("#camcontainer").css('height',heightProp)
	  		});
		}
	
		function recordToFilename(element) {
		    var input = document.getElementById('foto'),
		        fileName = input.value;
		    if (fileName) {
				saveSnapshot2();
		    } else {
		        bootbox.alert({
					message:"Toma una foto antes de enviar",
					buttons:{
						ok:{
							label:"Aceptar"
						}
					}
				});
		        input.focus();
		    }
		}
	</script>
	<input type="hidden" id="keyDocument" name="keyDocument" value="${keyDocument}">
	<input type="hidden" id="newCaptureSameDocument" name="newCaptureSameDocument" value="">
	<input type="hidden" id="encodedImage" name="encodedImage" value="">
	<input type="hidden" id="page" name="page" value="${page}">
	<input type="hidden" id="processing" name="processing" value="">
	<input type="hidden" id="useAs" name="useAs" value="${useAs}">
	<input type="hidden" id="finalDoc" name="finalDoc" value="${finalDoc}">
</form>
<div class="modal" id="spinner" data-backdrop="static"
       data-keyboard="false">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   
                   <c:choose>
						<c:when test="${finalDoc==1}">
							<h3 class="modal-title">Enviando imágenes a IWH</h3>
						</c:when>    
						<c:otherwise>
							<h3 class="modal-title">Procesando</h3>
						</c:otherwise>
				   </c:choose>
               </div>
               <div class="modal-body">
               		<c:if test="${finalDoc!=1}">
                   		<p>Su petición está siendo atendida.</p>
                   	</c:if>
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