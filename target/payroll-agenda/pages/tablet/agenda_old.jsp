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
<%-- 	<script src="<spring:theme code='closeNav' />"></script> --%>
<%-- 	<script src="<spring:theme code='jquery'/>"></script> --%>
<%-- 	<script src="<spring:theme code='payroll'/>"></script> --%>
<%-- 	<script src="<spring:theme code='shortcut'/>"></script> --%>
<script src="/payroll-agenda/statics/js/closeNav.js"></script>
<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
<script src="/payroll-agenda/statics/js/payroll.js"></script>
<script src="/payroll-agenda/statics/js/shortcut.js"></script>
	<script src="/payroll-agenda/statics/js/jquery-ui.js"></script>
	<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<script src="/payroll-agenda/statics/js/pagination.js"></script>
	<script src="/payroll-agenda/statics/js/list.js"></script>
	
	<link rel="stylesheet" href="/payroll-agenda/statics/css/materialIcons.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/MaterialDate.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/sidenav.css">
	<script src="/payroll-agenda/statics/js/materialize.js"></script>
	
	
	<script src="/payroll-agenda/statics/js/moment.js"></script>
	<script src="/payroll-agenda/statics/js/angular.min-1.5.7.js"></script>
	<script src="/payroll-agenda/statics/js/MaterialDate.js"></script>
	<script type="text/javascript">
		function agendarEmpresa(nameCompany, idDiv, keyVisit, proposedDate) {
			$('#spinner').modal();
			$("#nomCompany").text(unescape(nameCompany));
			$("#proposedDate").text(unescape(proposedDate));
			//$("#nomCompany").val(unescape(nameCompany));
			$("#nameCompany").val(unescape(nameCompany));
			$("#keyVisit").val(unescape(keyVisit));
			
			//$("#proposedDate").val(unescape(proposedDate));
			//document.getElementById(idDiv).style.display = "block";
			//document.getElementById(idDiv).style.zIndex = "2";
		}
	
		function comenzarVisita(keyVisit, nameCompany) {
			$('#spinnerload').modal();
			$("#keyVisit").val(unescape(keyVisit));
			$("#nameCompany").val(unescape(nameCompany));
			document.forms['formHome'].action = "/payroll-agenda/startVisit";
			document.forms['formHome'].submit();
		}
		
		$(function() {
			$('#datepicker').bootstrapMaterialDatePicker({ 
				format : 'DD/MM/YYYY',
				minDate : new Date(), 
			    clearText: 'Limpar',
				time: false 
			});
		});
		
		function isConnected() {
			var urlLoc = window.location.href;
			var idx = urlLoc.search("payroll-agenda/") + 15;
			var url = urlLoc.substring(0, idx) + "statics/js/jquery-ui.js";

			try {
				var http = new XMLHttpRequest();
				http.open('HEAD', url, false);
				//http.send();
				$('#noConnection').modal('hide');
			} catch(err) {
				$('#noConnection').modal();
			}
		
			setTimeout("isConnected()",1000);
		}
		
		$(document).ready(function() {
			var regsXPage = parseInt($("#regsXPage").val());
			var list = new List('todas', { page : regsXPage, pagination : true });
			var list2 = new List('pendientes', { page : regsXPage, pagination : true });
			var list3 = new List('completadas', { page : regsXPage, pagination : true });
			var list4 = new List('noagendadas', { page : regsXPage, pagination : true });
			
			$(".button-collapse").sideNav({
			      closeOnClick: true

			});
		});
	</script>
<title>Agenda</title>
</head>
<body onload="isConnected()" style="padding:0px; width: 100%; height: 100%;">
<form id="formHome" method="post" action="/payroll-agenda/agendar">
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
			
			<div class="col-xs-8 " >
				<h3 align="center" class="headstyle">Mi Agenda y actividades</h3>
			</div>
			<div class="col-xs-2 hidetext " align="center">
				<a href="#" class="link"><img src="/payroll-agenda/statics/images/tablet/Ayuda.png" class="img-responsive center-block" style="padding:7px 0px 0px 0px">Ayuda</a>
			</div>
		</div>
		<div class="row ">
<!--  
		<div class="col-xs-1 whitetop shadowdown hidetext" align="center">
				<div class="row menufont" >
					<a  class="link " href="#" onclick="document.forms['formHome'].action = '/payroll-agenda/homeAgenda'; document.forms['formHome'].submit();" >
						<img alt="Mi Agenda" src="/payroll-agenda/statics/images/tablet/Mi_agenda_y_actividades.png" class="img-responsive center-block paddingpo">
						Mi Agenda y Actividades
					</a>
				</div>
				<hr class="nopadding">
				<div class="row menufont" >
					<img src="/payroll-agenda/statics/images/tablet/Mi_Perfil_OFF.png" class="img-responsive center-block paddingpo"/>
					Mi Perfil
				</div>
				<hr class="nopadding">
				<div class="row menufont" >
					<img src="/payroll-agenda/statics/images/tablet/Mis_cursos_y_capacitaciones_OFF.png" class="img-responsive center-block paddingpo"/>
					Mis cursos y capacitaciones
				</div>
				<hr class="nopadding">
				<div class="row menufont" >
					<img src="/payroll-agenda/statics/images/tablet/Ayuda_y_soporte_OFF.png" class="img-responsive center-block paddingpo" />
					Ayuda y soporte
				</div>
				<hr class="nopadding">
				<div class="row menufont" >
					<a href="#" onclick="document.forms['formHome'].action='/payroll-agenda/exitAgenda'; document.forms['formHome'].submit();" class="link">
						<img alt="Cerrar Sesion" src="/payroll-agenda/statics/images/tablet/LogOut.png" class="img-responsive center-block paddingpo"/>
						Cerrar sesión
					</a>
				</div>
				
			</div>
-->			  
			<div class="col-xs-12" style="padding:3%;">
				<c:if test="${not empty message}">
					<div class="alert alert-dismissible alert-danger alert-hsbc">
				  		<button class="close" type="button" data-dismiss="alert">&times;</button>
						<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
						<span>&nbsp;&nbsp;&nbsp;${message}</span>
					</div>
				</c:if>

				<div style="padding: 30px 30px 0px;" class="whitetop shadow" >
					<div style="padding:0px 15px 0px 15px">
							<ul class="nav nav-tabs">
								<li><a class="noactive">Mis actividades</a></li>
								<li class = "navbar-right "><a  href="#noagendadas" data-toggle="tab">No agendadas</a></li>
								<li class = "navbar-right "><a  href="#completadas" data-toggle="tab">Completadas</a></li>
								<li class = "navbar-right "><a  href="#pendientes" data-toggle="tab">Pendientes</a></li>
								<li class = "navbar-right noactive"><a  href="#" data-toggle="tab">Próximas</a></li>
								<li class="active navbar-right"><a  href="#todas" data-toggle="tab">Todas</a></li>
							</ul>
					</div>
					<div class="tab-content" id="myTabContent">
  						<div class="tab-pane fade active in" id="todas">
  							<c:if test="${countCompanies > 0}">
  								<ul class="list-group list">
									<c:forEach var="company" items="${lstCompanies}">
										<li class="list-group-item">
											<div class="row">
												<div class="col-sm-6 col-xs-8 ">
													${company.companyName}<br> 
													<span class="menufont">${company.noteCompany}</span>
												</div>
												<div class="col-sm-2 col-xs-4">${company.descStatus}</div>
												<div class="col-xs-12 col-sm-4" align="center">${company.link}</div>
											</div>
										</li>
									</c:forEach>
								</ul>
								
  							</c:if>
							<c:if test="${countCompanies <= 0}">
								<br>
								<div class="alert alert-dismissible alert-danger alert-hsbc">
									<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
									<span>&nbsp;&nbsp;&nbsp;No existen registros para esta seccion</span>
								</div>
							</c:if>
							<div class="row" align="center">
								<ul class="pagination pagination-lg pager" id="pagerTableNominees">
								</ul>
							</div>
  						</div>
  						<div class="tab-pane fade" id="pendientes">
  							<c:set var="countPending" value="0"/>
  							<c:if test="${countCompanies > 0}">
  								<ul class="list-group list">
									<c:forEach var="company" items="${lstCompanies}">
										<c:if test="${company.descStatus.contains('Pendiente')}">
											<c:set var="countPending" value="${count + 1}"/>
											<li class="list-group-item">
												<div class="row">
													<div class="col-sm-6 col-xs-8 ">
														${company.companyName}<br> 
														<span class="menufont">${company.noteCompany}</span>
													</div>
													<div class="col-sm-2 col-xs-4">${company.descStatus}</div>
													<div class="col-xs-12 col-sm-4" align="center">${company.link}</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</ul>
								
							</c:if>
							<c:if test="${countPending==0 }">
								<br>
								<div class="alert alert-dismissible alert-danger alert-hsbc">
									<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
									<span>&nbsp;&nbsp;&nbsp;No existen registros para esta seccion</span>
								</div>
							</c:if>
							<div class="row" align="center">
								<ul class="pagination pagination-lg pager" id="pagerTableCompaniesPending"></ul>
							</div>
  							
							
  						</div>
  						<div class="tab-pane fade " id="completadas">
  							<c:set var="countComplete" value="0"/>
  							<c:if test="${countCompanies > 0}">
  								<ul class="list-group list">
									<c:forEach var="company" items="${lstCompanies}">
										<c:if test="${company.descStatus.contains('Completada')}">
												<c:set var="countComplete" value="${count + 1}"/>
											<li class="list-group-item">
												<div class="row">
													<div class="col-sm-6 col-xs-8 ">
														${company.companyName}<br> 
														<span class="menufont">${company.noteCompany}</span>
													</div>
													<div class="col-sm-2 col-xs-4">${company.descStatus}</div>
													<div class="col-xs-12 col-sm-4" align="center">${company.link}</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</ul>
								
							</c:if>
							<c:if test="${countComplete==0 }">
								<br>
								<div class="alert alert-dismissible alert-danger alert-hsbc">
									<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
									<span>&nbsp;&nbsp;&nbsp;No existen registros para esta seccion</span>
								</div>
							</c:if>
							<div class="row" align="center">
								<ul class="pagination pagination-lg pager" id="pagerTableCompaniesComplete"></ul>
							</div>
							
  						</div>
  						<div class="tab-pane fade " id="noagendadas">
  							<c:set var="countUnassigned" value="0"/>
  							<c:if test="${countCompanies > 0}">
  								<ul class="list-group list">
									<c:forEach var="company" items="${lstCompanies}">
										<c:if test="${company.descStatus.contains('No Agendada')}">
											<c:set var="countUnassigned" value="${count + 1}"/>
											<li class="list-group-item">
												<div class="row">
													<div class="col-sm-6 col-xs-8 ">
														${company.companyName}<br> 
														<span class="menufont">${company.noteCompany}</span>
													</div>
													<div class="col-sm-2 col-xs-4">${company.descStatus}</div>
													<div class="col-xs-12 col-sm-4" align="center">${company.link}</div>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</ul>
								
							</c:if>
  							<c:if test="${countUnassigned==0 }">
								<br>
								<div class="alert alert-dismissible alert-danger alert-hsbc">
									<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
									<span>&nbsp;&nbsp;&nbsp;No existen registros para esta seccion</span>
								</div>
							</c:if>
							<div class="row" align="center">
								<ul class="pagination pagination-lg pager" id="pagerTableCompaniesUnassigned"></ul>
							</div>
  						</div>
  					</div>
								
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="spinner" data-backdrop="true" data-keyboard="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" align="center" style="background: #f9f9ff;">
                	<button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title">AGENDAR VISITA</h3>
                </div>
                <div class="modal-body" align="center">
	                    <p>Llama al contacto de la empresa para agendar la visita.</p>
	                    <div class="row">
	                    	<div class=" col-xs-6">
	                    		<p class="headstyle" id="nomCompany" name="nomCompany"></p>
	                    	</div>
	                    	<div class=" col-xs-6">
	                    		<p>&nbsp;</p>
	                    	</div>
	                    </div>
	                    <div class="row">
	                    	<div class=" col-xs-6">
	                    		<p>Empresa</p>
	                    	</div>
	                    	<div class=" col-xs-6">
	                    		<p>Contacto</p>
	                    	</div>
	                    </div>
	                    <div class="row">
	                    	<div class=" col-xs-6">
	                    		<p>&nbsp;</p>
	                    	</div>
	                    	<div class=" col-xs-6">
	                    		<p>&nbsp;</p>
	                    	</div>
	                    </div>
	                    <div class="row">
	                    	<div class=" col-xs-6">
	                    		<p>Teléfono</p>
	                    	</div>
	                    	<div class=" col-xs-6">
	                    		<p>Cuentas</p>
	                    	</div>
	                    </div>
	                    <br>
	                    <div class="row">
	                    	<div class=" col-xs-6" align="right">
	                    		<p>Fecha propuesta</p>
	                    		<p>Fecha</p>
	                    	</div>
	                    	<div class=" col-xs-6" align="left">
	                    		<p class ="headstyle" id="proposedDate" name="proposedDate"></p>
	                    		<input class="input-sm" type="text" id="datepicker" name="datepicker" size="10" style="font-size: 98%;">
	                    		<p class="nopadding" style="font-size: 80%;">(dd/mm/aaaa)</p>
	                    		<br>
	                    	</div>
	                    </div>
	                    <div class="row">
	                    	<select id="hours" name="hours" class="font18" style="width: 70px; font-size:250%">
										<c:forEach var="hora" begin="1" end="12">
											<option value="${hora}">${hora}</option>
										</c:forEach>
								</select><b>:</b> 
								<select id="minutes" name="minutes" class="font18" style="width: 70px;  font-size:250%">
										<option value="0">00</option>
										<option value="15">15</option>
										<option value="30">30</option>
										<option value="45">45</option>
								</select>
								<select id="ampm" name="ampm" class="font18" style="width: 80px;  font-size:250%">
									<option value="AM">AM</option>
									<option value="PM">PM</option>
								</select>
	                    </div>
	                    <br><br>
	                    <a href="#" onclick="$('#spinnerload').modal();document.forms['formHome'].submit();" class="btn btn-primary btn-round ">
	                    	Agendar Visita
	                    </a>
	                    <input type="hidden" id="nameCompany" name="nameCompany">
	                    <input type="hidden" id="keyVisit" name="keyVisit">
	                    <br><br>
                </div>
            </div>

        </div>
    </div>
</form>
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
		<li><a class="waves-effect" href="#!" onclick="document.forms['formHome'].action = '/payroll-agenda/homeAgenda'; document.forms['formHome'].submit();">
			<i class="material-icons">today</i>Mi Agenda y Actividades
		</a></li>
		<li><a class="waves-effect noactive" href="#!"><i class="material-icons">account_circle</i>Mi Perfil </a></li>
		<li><a class="waves-effect noactive" href="#!"><i class="material-icons">touch_app</i>Mis cursos y capacitaciones </a></li>
		<li><a class="waves-effect noactive" href="#!"><i class="material-icons">question_answer</i>Ayuda y soporte  </a></li>
		<li><a class="waves-effect" href="#!" onclick="document.forms['formHome'].action='/payroll-agenda/exitAgenda'; document.forms['formHome'].submit();">
			<i class="material-icons">exit_to_app</i>Cerrar sesión  
		</a></li>
 </ul>
  
  
  
  
<input type="hidden" id="regsXPage" name="regsXPage" value="${regsXPage}">

	<div class="modal" id="spinnerload" data-backdrop="static"
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