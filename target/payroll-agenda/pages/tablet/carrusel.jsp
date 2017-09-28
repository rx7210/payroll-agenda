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
  <title>Documentos a IWH</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/payroll-agenda/statics/js/doc_bootstrap/bootstrap.min.css">
  <script src="/payroll-agenda/statics/js/doc_bootstrap/jquery.min.js"></script>
  <script src="/payroll-agenda/statics/js/doc_bootstrap/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/payroll-agenda/statics/css/signin.css">
	<script src="<spring:theme code='shortcut'/>"></script>
  <style>
  
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: auto;
  }

.neex {
	background-image: url(/payroll-agenda/statics/images/next.gif);
	background-repeat: no-repeat;
	height: 100px;
	width: 100px;
	background-position: center;
}
.pree {
	background-image: url(/payroll-agenda/statics/images/previous.gif);
	background-repeat: no-repeat;
	height: 100px;
	width: 100px;
	background-position: center;
}
  
  
  </style>
  
  <script type="text/javascript">
  
  function regresar(){
	  document.forms["docForm"].action = "/payroll-agenda/globalStandard"; 
	  document.forms["docForm"].submit();
  }
  
  function continuar(){
		$('#spinnerFinal').modal();
		document.forms["docForm"].action = "/payroll-agenda/completeIntegration";
		document.forms["docForm"].submit();
	}
  
  
	var $ = jQuery.noConflict();
	$(document).ready(function() {
		$("#myCarousel").carousel({
			interval : 2800,
			cycle : true
		});
		
		$(".left").click(function(){
	        $("#myCarousel").carousel("prev");
	    });
	    $(".right").click(function(){
	        $("#myCarousel").carousel("next");
	    });
	});
  </script>
  
</head>

<body>
<form id="docForm" method="post" >
	<div class="col-xs-12">
		<div class="row shadow"  style="background: #f9f9ff;">
			<div class="col-xs-1 nopadding" >
				<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png" class="img-responsive center-block">
			</div>
			<div class="col-xs-1 hidetext" align="center"  >
				<a href="#" class="link" 
					onclick="javaScript:regresar();">
					<img alt="Regresar" src="/payroll-agenda/statics/images/tablet/FLECHA2.png" class="img-responsive center-block" style="padding:15px 0px 0px 0px">
					Regresar</a>
			</div>
			<div class="col-xs-8 " >
				<h3 align="center" class="headstyle"><%=session.getAttribute("nameClient")%></h3>
				<h4 align="center">Cuenta:&nbsp;<%=session.getAttribute("account")%></h4>
			</div>
			<div class="col-xs-1 hidetext " align="center">
				<!-- <a href="#" class="link"
					onclick="javaScript:confirmExit('confirmExit');">
					<img alt="Cerrar" src="/payroll-agenda/statics/images/tablet/CERRAR.png" class="img-responsive center-block" style="padding:15px 0px 0px 0px">Cancelar
				</a> -->
			</div>
			<div class="col-xs-1 hidetext " align="center">
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
		
		
	<div class="panel panel-default">
		<div class="row">
		<div class="col-xs-1 col-md-2"></div>
		<div class="col-xs-10 col-md-8 white-no-border shadow">
			<h4 align="center">Documentos a enviar a IWH.</h4>
			<hr>
			<div id="Layer1" style="width:70%; height:550px; overflow: scroll;" class="center-block">
			
			<!-- <div class="container"> -->
				<br>
				<div id="myCarousel" class="carousel slide">
					<!-- Wrapper for slides -->
					<div class="carousel-inner text-center" role="listbox">

						<c:forEach var="img" items="${limgEncode}">
							<c:if test="${img.id == 1}">
								<div class="item active">
										<img src="data:image/png;base64,${img.encoded_doc}" >
								</div>
							</c:if>
							<c:if test="${img.id != 1}">
								<div class="item">
										<img src="data:image/png;base64,${img.encoded_doc}" >
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button" style="width:1%">
						<span class="pree  glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Anterior</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" role="button" style="width:1%">
						<span class="neex glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Siguiente</span>
					</a>
				</div>
			</div>
</div>			


<br/>
<br/>
	<div class="row">
		<div class="col-md-12 text-center">
			<button type="button" class="bbtn btn-danger btn-xs"
				onclick="javaScript:continuar();">Continuar</button>
		</div>
	</div>
		</div>
	</div>
	</div>
	
	
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
<div class="modal" id="spinnerFinal" data-backdrop="static"
        data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
        	<div class="modal-header">
                    <h3 class="modal-title">Enviando imágenes a IWH</h3>
           	</div>
            <div class="modal-body">
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