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
	<script src="<spring:theme code='closeNav' />"></script>
	<script src="<spring:theme code='jquery'/>"></script>
	<script src="<spring:theme code='payroll'/>"></script>
	<script src="<spring:theme code='shortcut'/>"></script>
	<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<script src="/payroll-agenda/statics/js/list.js"></script>
	
	<link rel="stylesheet" href="/payroll-agenda/statics/css/materialIcons.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/MaterialDate.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/sidenav.css">
	<script src="/payroll-agenda/statics/js/materialize.js"></script>
	
	<script type="text/javascript">
	function verInforme(account) {
		$("#account").val(unescape(account));
	}
	
	function integrarCuenta(account, nameClient) {
		$('#spinner').modal();
		$("#account").val(unescape(account));
		$("#nameClient").val(unescape(nameClient));
		document.forms['formCompany'].action = "/payroll-agenda/startIntegration";
		document.forms['formCompany'].submit();
	}
	
	function sendImages(account) {
		$('#spinner').modal();
		$("#account").val(unescape(account));
		document.forms['formCompany'].action = "/payroll-agenda/sendImages";
		document.forms['formCompany'].submit();
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
	
		setTimeout("isConnected()",1000);
	}
	$(document).ready(function(){
		var regsXPage = parseInt($("#regsXPage").val());
		var list = new List('nominaHabientes', {
			valueNames : [ 'name' ],
			page : regsXPage,
			pagination : true
		});
		
		$(".button-collapse").sideNav({
		      closeOnClick: true

		});
		
	});
	
	</script>
	<title>Agenda</title>
</head>
<body onload="isConnected()" style="padding:0px; width: 100%; height: 100%;">
<form id="formCompany" method="post" action="/payroll-agenda/agendar">
	<div class="col-xs-12">
		<div class="row shadow"  style="background: #f9f9ff;">
			<div class="col-xs-2 nopadding" >
				<div class="col-xs-7 col-md-4 col-lg-2 nopadding" >
					<a href="#" data-activates="slide-out" class="button-collapse"><i style="padding-top: 10px; font-size: 30px;color:black;padding-left:5px;" class="material-icons">menu</i></a>
				</div>
				<div class="col-xs-5 col-md-8 col-lg-10 nopadding" align="left" >
					<img style="padding-top: 10px;" alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png" class="img-responsive">
				</div>
			</div>
			<div class="col-xs-2 hidetext" align="left"  >
				<a href="#" class="link" 
					onclick="document.forms['formCompany'].action = '/payroll-agenda/homeAgenda'; document.forms['formCompany'].submit();">
					<img alt="Regresar" src="/payroll-agenda/statics/images/tablet/FLECHA2.png" class="img-responsive" style="padding:10px 0px 0px 0px">
					Regresar</a>
			</div>
			<div class="col-xs-6 " >
				<h3 align="center" class="headstyle">${nameCompany}</h3>
			</div>
			<div class="col-xs-2 hidetext " align="center">
				<a href="#" class="link"><img src="/payroll-agenda/statics/images/tablet/Ayuda.png" class="img-responsive center-block" style="padding:7px 0px 0px 0px">Ayuda</a>
			</div>
		</div>
		<div class="row ">
<!-- 			<div class="col-xs-1 whitetop shadowdown hidetext" align="center"> -->
<!-- 				<div class="row menufont" > -->
<!-- 					<a  class="link " href="#" onclick="document.forms['formCompany'].action = '/payroll-agenda/homeAgenda'; document.forms['formCompany'].submit();"> -->
<!-- 						<img alt="Mi Agenda" src="/payroll-agenda/statics/images/tablet/Mi_agenda_y_actividades.png" class="img-responsive center-block paddingpo"> -->
<!-- 						Mi Agenda y Actividades -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<hr class="nopadding"> -->
<!-- 				<div class="row menufont" > -->
<!-- 					<img src="/payroll-agenda/statics/images/tablet/Mi_Perfil_OFF.png" class="img-responsive center-block paddingpo"/> -->
<!-- 					Mi Perfil -->
<!-- 				</div> -->
<!-- 				<hr class="nopadding"> -->
<!-- 				<div class="row menufont" > -->
<!-- 					<img src="/payroll-agenda/statics/images/tablet/Mis_cursos_y_capacitaciones_OFF.png" class="img-responsive center-block paddingpo"/> -->
<!-- 					Mis cursos y capacitaciones -->
<!-- 				</div> -->
<!-- 				<hr class="nopadding"> -->
<!-- 				<div class="row menufont" > -->
<!-- 					<img src="/payroll-agenda/statics/images/tablet/Ayuda_y_soporte_OFF.png" class="img-responsive center-block paddingpo" /> -->
<!-- 					Ayuda y soporte -->
<!-- 				</div> -->
<!-- 				<hr class="nopadding"> -->
<!-- 				<div class="row menufont" > -->
<!-- 					<a href="#" onclick="document.forms['formCompany'].action='/payroll-agenda/exitAgenda'; document.forms['formCompany'].submit();" class="link"> -->
<!-- 						<img alt="Cerrar Sesion" src="/payroll-agenda/statics/images/tablet/LogOut.png" class="img-responsive center-block paddingpo"/> -->
<!-- 						Cerrar sesión -->
<!-- 					</a> -->
<!-- 				</div> -->
				
<!-- 			</div> -->
			<div class="col-xs-12" style="padding:3%;">
				<c:if test="${not empty error}">
					<div class="alert alert-dismissible alert-danger alert-hsbc">
				  		<button class="close" type="button" data-dismiss="alert">&times;</button>
						<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
						<span>&nbsp;&nbsp;&nbsp;${error}</span>
					</div>
				</c:if>

				<div style="padding: 30px 30px 0px;" class="whitetop shadow" >
					<div style="padding:0px 15px 0px 15px">
							<ul class="nav nav-tabs">
								<li class="active "><a aria-expanded="true" href="#" onclick="document.forms['formCompany'].action='/payroll-agenda/startVisit'; document.forms['formCompany'].submit();">Nominahabientes</a></li>
								<li class = "noactive"><a aria-expanded="false" href="#" data-toggle="tab">Información de la Empresa</a></li>
								<li class = "noactive"><a aria-expanded="false" href="#" data-toggle="tab">Reagendar Visita</a></li>
								<li class = "noactive"><a aria-expanded="false" href="#" data-toggle="tab">Reporte</a></li>
							</ul>
					</div>
					<div id="nominaHabientes">
						<div class="form-group">
							<div class="input-group">
								<span class="algo input-group-addon">
									<img style="max-width: 50px;" class="img-responsive"
										src="/payroll-agenda/statics/images/tablet/look.png" />
								</span>
								<input
									style="position: static; border-radius: 25px; padding: 0 40px; margin-top: 12px !important; margin-left: -50px !important;"
									class="form-control searchAnimate search" type="text"
									id="search"
									placeholder="Escribe el nombre del nominahabiente que estás buscando" />
							</div>
						</div>
						<ul class="list-group list">
							<c:forEach var="account" items="${lstAccounts}">
								<li class="list-group-item">
									<div class="row">
										<div class="col-sm-6 col-xs-8 ">
											<p class="name">
												${account.clientName}
												<br> <span class="menufont"> Integracion | CTA. ${account.dda}
												</span>
											</p>
										</div>
										<div class="col-sm-2 col-xs-4">${account.status}</div>
										<div class="col-xs-12 col-sm-4" align="center">${account.link}</div>
									</div>
								</li>
							</c:forEach>
						</ul>
						<div class="row" align="center">
							<ul class="pagination pagination-lg pager" id="pagerTableNominees">
							</ul>
						</div>
					</div>
					<div class="row" align="center">
						<ul class="pagination pagination-lg pager" id="pagerTableNominees"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="account" name="account">
	<input type="hidden" id="nameClient" name="nameClient">
	<input type="hidden" id="nameCompany" name="nameCompany" value="${nameCompany}">
	<input type="hidden" id="keyVisit" name="keyVisit" value="${keyVisit}">
</form>

<input type="hidden" id="regsXPage" name="regsXPage" value="${regsXPage}">

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
<ul id="slide-out" class="side-nav">
	<li>
		<div class="user-view">
			<a href="#!"><button class="close" type="button" data-dismiss="alert">&times;</button></a>
			<div class="background">
				<img src="/payroll-agenda/statics/images/Fondo.png">
			</div>
			<a href="#!user"><img class="circle" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png"></a>

		</div>
	</li>
		<li><a class="waves-effect" href="#!" onclick="document.forms['formCompany'].action = '/payroll-agenda/homeAgenda'; document.forms['formCompany'].submit();">
			<i class="material-icons">today</i>Mi Agenda y Actividades
		</a></li>
		<li><a class="waves-effect noactive" href="#!"><i class="material-icons">account_circle</i>Mi Perfil </a></li>
		<li><a class="waves-effect noactive" href="#!"><i class="material-icons">touch_app</i>Mis cursos y capacitaciones </a></li>
		<li><a class="waves-effect noactive" href="#!"><i class="material-icons">question_answer</i>Ayuda y soporte  </a></li>
		<li><a class="waves-effect" href="#!" onclick="document.forms['formCompany'].action = '/payroll-agenda/exitAgenda'; document.forms['formCompany'].submit();" >
			<i class="material-icons">exit_to_app</i>Cerrar sesión  
		</a></li>
 </ul>
</body>
</html> 