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
			if (option=="T"){
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

    	$("#burger").click(openLeftMenu);
		
    	openRightAgenda = function (companyName,keyVisit,proposedDate){
    		$("#companyNameTittle").text(unescape(companyName));
    		$("#companyName").val(unescape(companyName));
    		$("#datepicker").attr("placeholder","Fecha propuesta: "+proposedDate)
    		$("#keyVisit").val(unescape(keyVisit));
    		$('#right-black-shadow').animate({width:"100%"},0);
			$('#r-content').animate({right:'0px'},50);
    	};
		
		var closeRightAgenda = function (){
			$('#right-black-shadow').animate({width:"0"},0);
			$('#r-content').animate({right:'-500px'},50);
		};
		
		$('#right-black-shadow').click(closeRightAgenda);
		$("#rch-close").click(closeRightAgenda);
		
		$("#btn-save-agenda").click(function (){
			messages.openLoading();
			$("#agenda-form").attr('action', '/payroll-agenda/agendar');
			$("#agenda-form").submit();
		});
		
		openStarVisit = function (){
			$("#hours").val($("#timepicker").substring(0, 1));
			$("#minutes").val($("#timepicker").substring(3, 4));
			$("#ampm").val($("#timepicker").substring(5, 6));
			messages.openLoading();
			$("#activities-form").attr('action', '/payroll-agenda/startVisit');
			$("#activities-form").submit();
		};
	
		$("#btn-continuar-visita").click(openStarVisit);
		$("#btn-comenzar-visita").click(openStarVisit);
    });
    </script>
	</head>
	<body class="basic-template std-back">
		<main id="container" class="container">
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
											<option value="T"  selected>Ver todas</option>
											<option value="0">No agendadas</option>
											<option value="1">Agendadas</option>
											<option value="2">Pendientes</option> 
											<option value="3">Imagenes Pendientes</option>  
											<option value="4">Completadas</option>	
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
								<form id="activities-form" method="post">
									<c:if test="${countCompanies <= 0}">
										<div class="col s12 empty-state">
											<p class="h2">No tienes actividades o empresas dadas de alta</p>
										</div>
									</c:if>	
									<c:if test="${countCompanies > 0}">						
										<table class="table">
											<thead>
												<tr class="col s12 bwb-subtitle">
													<th>
														<p class="h4"></p>
													</th>
												</tr>
											<thead>
											<tbody>
												<c:forEach var="company" items="${lstCompanies}">
					        						<tr class="staVisit ${company.staVisit}">
														<th class="col s12 bwb-lineblock">
															<div class="row">
																<div class="col s8 lb-left">
																	<c:if test="${company.staVisit == 0}"> <!-- 0 - No Agendada -->
																		<div class="lb-circle c-yellow">
																			<i class="icon icon-error-1"></i>
																		</div>
																	</c:if>
																	<c:if test="${company.staVisit == 1}"> <!-- 1 - Agendada -->
																		<div class="lb-circle c-blue">
																			<i class="icon icon-today"></i>
																		</div>
																	</c:if>
																	<c:if test="${company.staVisit == 2}"> <!-- 2 - Pendiente -->
																		<div class="lb-circle c-red">
																			<i class="icon icon-error-1"></i>
																		</div> 
																	</c:if>
																	<c:if test="${company.staVisit == 3}"> <!-- 3 - Imagen Pendiente -->
																		<div class="lb-circle c-black-red">
																			<i class="icon icon-cloud-upload"></i>
																		</div> 
																	</c:if>
																	<c:if test="${company.staVisit == 4}"> <!-- 4 - Completada-->
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
																	<c:if test="${company.staVisit != 4}">
																		<div class="lb-location">
																			<i class="icon icon-address"></i>
																		</div>
																	</c:if>
																	<c:if test="${company.staVisit == 0}">
																		<div  class="cont-btn" onclick="openRightAgenda('${company.companyName}','${company.cveVisit}','${company.proposedDate}');">
																			<a class="btn small line" >Agendar visita</a>
																		</div>
																	</c:if>
																	<c:if test="${company.staVisit == 1}">
																		<div id="btn-comenzar-visita"  class="cont-btn">
																			<a class="btn small blue">Comenzar visita</a>
																		</div>
																	</c:if>
																	<c:if test="${company.staVisit == 2}">
																		<div id="btn-continuar-visita" class="cont-btn">
																			<a class="btn small red">Continuar visita</a>
																		</div>
																	</c:if>
																	<c:if test="${company.staVisit == 3}">
																		<div id="btn-continuar-visita" class="cont-btn">
																			<a class="btn small black-red">Finalizar Imagen</a>
																		</div>
																	</c:if>
																	<c:if test="${company.staVisit == 4}">
																		<div id="btn-ver-informe" class="cont-btn">
																			<a class="btn small green">Ver informe</a>
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
		
		<%@ include file="menu.jsp" %>
		
		<div id="right-black-shadow" class="right-black-shadow"></div>
		
		<section id="r-content" class="r-content">
			<div class="rc-back">
				<div class="rc-heading">
					<div id="rch-close" class="rch-close">
						<i class="icon icon icon-error"></i>
					</div>
					<div class="rch-title">
						<p class="t-type">Agendar visita</p>
						<p id="companyNameTittle" class="t-leyend"/>
					</div>
				</div>
				
				<div class="rc-info">
					<form id="agenda-form" class="rci-form" method="post">
						<div class="row">
							<div class="col s12 rci-title">
								<p>Fecha</p>
<!-- 						 	<p>Fecha y hora propuestas</p> -->
							</div>
							<hr class="col s12">
							<div class="col s12">
								<div class="data-write rci-date">
									<div class="input-field">
										<input class="datepicker" id="datepicker" name="datepicker" type="text" maxlength="10" minlength="10" placeholder="Fecha">
									</div>
								</div>
							</div>
<!-- 							<div class="col s6"> -->
<!-- 								<div class="data-write rci-hour"> -->
<!-- 									<div class="input-field"> -->
<!-- 										<input class="timepicker" type="text" maxlength="10" minlength="10" placeholder="Hora"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="col s12 rci-title">
<!-- 							<p>Ubicación</p> -->
								<p>Tiempo</p>
							</div>
							 <hr class="col s12">
<!-- 							<div class="col s12"> -->
<!-- 								<div class="data-write rci-date"> -->
<!-- 									<div class="input-field"> -->
<!-- 										<input type="text" maxlength="10" minlength="10" placeholder="Dirección"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="col s12">
								<div class="data-write rci-hour">
									<div class="input-field">
										<input class="timepicker" id="timepicker" name="timepicker" type="text" maxlength="10" minlength="10" placeholder="Hora">
									</div>
								</div>
							</div>
							
							<div class="col s12 cont-btn">
								<a id="btn-save-agenda" class="btn little red">Guardar</a>
							</div>
						</div>
	                    <input type="hidden" id="keyVisit" name="keyVisit">
						<input type="hidden" id="hours" name="hours">
						<input type="hidden" id="minutes" name="minutes">
						<input type="hidden" id="ampm" name="ampm">
						<input type="hidden" id="" name="ampm">
<!-- 				<div class="rci-title"> -->
<!-- 					<p>Datos de contacto para agendar visita</p> -->
<!-- 				</div> -->
<!-- 				<hr> -->
<!-- 				<div class="data-write"> -->
<!-- 					<p class="rci-subtext">Contacto en la empresa</p> -->
<!-- 					<input type="text" class="input-text-info" id="nombreContacto" name="nombreContacto" readonly="readonly"/> -->
<!-- 				</div> -->
<!-- 				<div class="data-write"> -->
<!-- 					<p class="rci-subtext">Teléfono:</p> -->
<!-- 					<input type="text" class="input-text-info" id="telefonoContacto" name="telefonoContacto" readonly="readonly"/> -->
<!-- 				</div> -->
<!-- 				<div class="data-write"> -->
<!-- 					<p class="rci-subtext">Cuentas:</p> -->
<!-- 					<input type="text" class="input-text-info" id="cuenta" name="cuenta" readonly="readonly"> -->
<!-- 				</div> -->
				</form>
			</div>
		</div>
	</section>
		<script src="/payroll-agenda/statics/js/vendors.min.js"></script>
    	<script src="/payroll-agenda/statics/js/main.min.js"></script>
    	<script src="/payroll-agenda/statics/js/vendors/materialize.clockpicker.js"></script>
    	<script>
    	$('.datepicker').pickadate({
//     	    selectMonths: true, // Creates a dropdown to control month
//     	    selectYears: 15, // Creates a dropdown of 15 years to control year,
    	    today: 'Today',
    	    format : 'dd/mm/yyyy',
    	    clear: 'Limpiar',
    	    close: 'Listo',
    	    minDate : new Date(), 
			time: false,
    	    closeOnSelect: false // Close upon selecting a date,
    	});
    	$('.timepicker').pickatime({
	        fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
	        twelvehour: true, // Use AM/PM or 24-hour format
	        interval: 15,
	        donetext: 'Listo', // text for done-button
	        cleartext: 'Clear', // text for clear-button
	        canceltext: 'Cancel', // Text for cancel-button
	        autoclose: false, // automatic close timepicker
	        ampmclickable: false, // make AM PM clickable
	        disable: [
	            3, 5, 7
	          ],
	        onSet: function(){} //Function for after opening timepicker
      });
    	</script>
    	<%@ include file="messages.jsp" %>
	</body>
</html>