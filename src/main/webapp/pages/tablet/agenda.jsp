<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>HSBC</title>
    <link rel="shortcut icon" 	href="/payroll-agenda/statics/images/tablet/favicon.ico">
    <link rel="stylesheet" 		href="/payroll-agenda/statics/css/vendors/materialize.clockpicker.css">
    <link rel="stylesheet" 		href="/payroll-agenda/statics/css/style.css">
 
    <script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
    <script>
    $(document).ready(function() {
    	
    	$('#select-filter').change(function(){
			var option, staVisit = ".staVisit" ;
			$( "#select-filter option:selected" ).each(function() {
				option = $( this ).val();
			    });
			if (option==0){
				$ (staVisit).each(function (){
					$(this).show();
				});
			}else{
				$ (staVisit).each(function (){
					$(this).hide();
				});
				$(staVisit+"." + option).show();
			}
		})
    	
		variable = hola;
		$("#burger").add = variable
		
    	alert($("#burger").variable);
    	
		$("#burger").click(function (){
			
			$('#left-white-shadow').css('width','100%');
	       	$('#left-menu').css('left','0px');	
		});
		
		var closeLeftContent = function (){
			$('#left-white-shadow').css('width','0');
	       	$('#left-menu').css('left','-340px');
		}
		$("#left-white-shadow").click(closeLeftContent);
		$("#lm-close").click(closeLeftContent);
		
		$("#btn-agenda-visita").click(function (){
			$('#right-black-shadow').css('width','100%');
	       	$('#r-content').css('right','0px');
		});
		
		var closeRightContent = function (){
			$('#right-black-shadow').css('width','0');
	       	$('#r-content').css('right','-450.8px');
		}
		$("#right-black-shadow").click(closeRightContent);
		$("#rch-close").click(closeRightContent);
		
		$("#lm-down").click(function (){
			$("#agenda-form").attr('action', '/payroll-agenda/exitAgenda');
			$("#agenda-form").submit();
		});
		
		$("#lm-link-agenda").click(function (){
			
			$("#agenda-form").attr('action', '/payroll-agenda/homeAgenda');
			$("#agenda-form").submit();
		});
		
    });
    </script>
	</head>
	<body class="misact std-back">
		<main class="container">
			<section class="row ma-block">
				<div class="col s12 col-block">
					
					<div class="nav">
						<div id="burger" class="burger">
							<div></div>  
							<div></div>
							<div></div>
						</div>

						<div class="side-logo">
							<img class="responsive-img" src="/payroll-agenda/statics/images/tablet/logo-hsbc.png" alt="">
						</div>

						<div class="right-help">
							<i class="icon icon-notifications"></i>
						</div>
					</div>

					<div class="big-white-block">
						<div class="bwb-heading row">
							<div class="col s6 bwbh-title">
								<p class="h2">Mis actividades</p>                
							</div>
							<div class="col s6">
								<div class="data-write">
									<div class="input-field">
										<select id="select-filter"> 
											<option value="0"  selected>Ver todas</option>
											<option value="2">Próximas</option>
											<option value="3">Pendientes</option>
											<option value="4">Completadas</option>
											<option value="1">No agendadas</option>	
										</select>
									</div>
								</div>
							</div>
							<div class="bwb-secondary-i">
								<i class="icon icon-search"></i>
							</div>
						</div>

						<div class="bwb-list-scrollableContainer">
							<div class="row scrollArea">
								<form id="agenda-form" method="get">
									<c:if test="${countCompanies <= 0}">
										<div class="col s12 empty-state">
											<p class="h2">No tienes actividades o empresas dadas de alta.</p>
										</div>
									</c:if>	
									<c:if test="${countCompanies > 0}">						
										<table class="table">
											<thead>
												<tr class="col s12 bwb-subtitle">
													<th>
														<p class="h4">A - M</p>
													</th>
												</tr>
											<thead>
											<tbody>
												<c:forEach var="company" items="${lstCompanies}">
					        						<tr class="staVisit ${company.staVisit}">
														<th class="col s12 bwb-lineblock">
															<div class="row">
																<div class="col s8 lb-left">
																	<c:if test="${company.descStatus.equals('No Agendada')}"> <!-- 1 -->
																		<div class="lb-circle c-yellow">
																			<i class="icon icon-error-1"></i>
																		</div>
																	</c:if>
																	<c:if test="${company.descStatus.equals('Agendada')}"> <!-- 2 -->
																		<div class="lb-circle c-blue">
																			<i class="icon icon-today"></i>
																		</div>
																	</c:if>
																	<c:if test="${company.descStatus.equals('Pendiente')}"> <!-- 3 -->
																		<div class="lb-circle c-red">
																			<i class="icon icon-error-1"></i>
																		</div> 
																	</c:if>
																	<c:if test="${company.descStatus.equals('Completada')}"> <!-- 4 -->
																		<div class="lb-circle c-green">
																			<i class="icon icon-done"></i>
																		</div>
																	</c:if>
																	<div class="lb-leyend">
																		<p class="h4">${company.companyName}</p>
																		<p class="lb-descripton">${company.noteCompany}</p>
																	</div>
																</div>
																<div class="col s4 lb-right">
																	<c:if test="${!company.descStatus.equals('Completada')}">
																		<div class="lb-location">
																			<i class="icon icon-address"></i>
																		</div>
																	</c:if>
																	<c:if test="${company.descStatus.equals('No Agendada')}">
																		<div id="btn-agenda-visita" class="cont-btn">
																			<a class="btn small line" >Agendar visita</a>
																		</div>
																	</c:if>
																	<c:if test="${company.descStatus.equals('Agendada')}">
																		<div id="btn-comenzar-visita"  class="cont-btn">
																			<a class="btn small blue">Comenzar visita</a>
																		</div>
																	</c:if>
																	<c:if test="${company.descStatus.equals('Pendiente')}">
																		<div id="btn-continuar-visita" class="cont-btn">
																			<a class="btn small">Continuar visita</a>
																		</div>
																	</c:if>
																	<c:if test="${company.descStatus.equals('Completada')}">
																		<div id="btn-ver-informe" class="cont-btn">
																			<a class="btn small green" href="employee.html">Ver informe</a>
																		</div>
																	</c:if>
																</div>
															</div>
															<hr class="two"><hr class="one">
														</th>
													</tr>
												</c:forEach>
											<tbody>								
										</table>
									</c:if>
								</form>
							</div>
						</div>           
					</div>
				</div>
			</section>
		</main>
		<div id="left-white-shadow" class="left-white-shadow" ></div>
    
		<section id="left-menu" class="left-menu"> 
			<div id="lm-dark-cont" class="lm-dark-cont">
				<div class="lm-up">
					<div id="lm-close" class="lm-close">
						<i class="icon icon-error"></i>
					</div>
					<div class="lm-logo">
						<img src="/payroll-agenda/statics/images/tablet/logo-hsbc-white.png">
					</div>
				</div>
				<div class="lm-middle">
					<ul class="lm-list">
						<li>
							<a id="lm-link-agenda" class="lm-link">
								<i class="icon icon-today"></i>
								<span>Mi agenda y actividades</span>
							</a>
						</li>
						<li>
							<a href="" class="lm-link">
								<i class="icon icon-twins"></i>
								<span>Mi perfil</span>
							</a>
						</li>
						<li>
							<a href="" class="lm-link">
								<i class="icon icon-graduate"></i>
								<span>Mis cursos y capacitaciones</span>
							</a>
						</li>
						<li>
							<a href="" class="lm-link">
								<i class="icon icon-help"></i>
								<span>Ayuda y soporte</span>
							</a>
						</li>
						<li>
							<a href="" class="lm-link">
								<i class="icon icon-notifications"></i>
								<span>Notificaciones</span>
							</a>
						</li>
					</ul>
				</div>
				<div id="lm-down" class="lm-down" >
					<ul class="lm-list">
						<li>
							<a class="lm-link">
								<i class="icon icon-logout-1"></i>
								<span>Cerrar sesión</span> 
							</a>
						</li>
					</ul>
				</div>
			</div>
		</section>
		
		<div id="right-black-shadow" class="right-black-shadow"></div>
		
		<section id="r-content" class="r-content">
			<div class="rc-back">
				<div class="rc-heading">
					<div id="rch-close" class="rch-close">
						<i class="icon icon icon-error"></i>
					</div>
					<div class="rch-title">
						<p class="t-type">Agendar visita</p>
						<p class="t-leyend">Incrementa Consulting S.A. de C.V.</p>
					</div>
				</div>
				<div class="rc-info">
					<div class="rci-title">
						<p>Fecha y hora propuestas</p>
					</div>
					<hr>
					<form class="rci-form">
						<div class="row">
							<div class="col s6">
								<div class="data-write rci-date">
									<div class="input-field">
										<input class="datepicker" type="text" maxlength="10" minlength="10" placeholder="Fecha">
										<p class="form-tips">Introduce tu ...</p>
									</div>
								</div>
							</div>
							<div class="col s6">
								<div class="data-write rci-hour">
									<div class="input-field">
										<input class="timepicker" type="text" maxlength="10" minlength="10" placeholder="Hora">
										<p class="form-tips">Introduce tu ...</p>
									</div>
								</div>
							</div>
							<div class="col s12 cont-btn">
								<a href="#" class="btn little red">Guardar</a>
							</div>
						</div>
					</form>
				<div class="rci-title">
					<p>Datos de contacto para agendar visita</p>
				</div>
				<hr>
				<div class="data-write">
					<p class="rci-subtext">Contacto en la empresa</p>
					<p class="rci-text">Gaël Thome</p>
				</div>
				<div class="data-write">
				<p class="rci-subtext">Teléfono:</p>
				<p class="rci-text">044(55)1234-1234</p>
				</div>
				<div class="data-write">
				<p class="rci-subtext">Cuentas:</p>
				<p class="rci-text">Multiplica México</p>
				</div>
				</div>
			</div>
		</section>
		<script src="/payroll-agenda/statics/js/vendors.min.js"></script>
    	<script src="/payroll-agenda/statics/js/main.min.js"></script>
    	<script src="/payroll-agenda/statics/js/main.min.js"></script>
    	<script src="/payroll-agenda/statics/js/vendors/materialize.clockpicker.js"></script>
    	<script>
    	$('.datepicker').pickadate({
    	    selectMonths: true, // Creates a dropdown to control month
    	    selectYears: 15, // Creates a dropdown of 15 years to control year,
    	    today: 'Today',
    	    clear: 'Clear',
    	    close: 'Ok',
    	    closeOnSelect: false // Close upon selecting a date,
    	});
    	$('.timepicker').pickatime({
	    	time: 'now', 
	        fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
	        twelvehour: false, // Use AM/PM or 24-hour format
	        donetext: 'OK', // text for done-button
	        cleartext: 'Clear', // text for clear-button
	        canceltext: 'Cancel', // Text for cancel-button
	        autoclose: false, // automatic close timepicker
	        ampmclickable: true, // make AM PM clickable
	        aftershow: function(){} //Function for after opening timepicker
      });
    	</script>
	</body>
</html>