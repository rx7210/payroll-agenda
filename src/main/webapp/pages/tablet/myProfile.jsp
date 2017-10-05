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
    <link rel="stylesheet" 		href="/payroll-agenda/statics/css/vendors/default.css">
    <link rel="stylesheet" 		href="/payroll-agenda/statics/css/vendors/default.time.css">
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
		
    	openRightAgenda = function (nameCompany,keyVisit,proposedDate){
    		$("#companyNameTittle").text(unescape(nameCompany));
    		$("#datepicker").attr("placeholder","Fecha propuesta: "+proposedDate)
    		$("#agenda-form").find("#keyVisit").val(unescape(keyVisit));
    		$("#agenda-form").find("#nameCompany").val(unescape(nameCompany));
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
			timeSplit = $("#timepicker").val().split(" ");
			$("#ampm").val(timeSplit[1]);
			timeSplit = timeSplit[0].split(":");
			$("#hours").val(timeSplit[0]);
			$("#minutes").val(timeSplit[1]);
			messages.openLoading();
			$("#agenda-form").attr('action', '/payroll-agenda/agendar');
			$("#agenda-form").submit();
		});
		
		getStartVisit = function (nameCompany,keyVisit){
			$("#activities-form").find("#nameCompany").val(unescape(nameCompany));
			$("#activities-form").find("#keyVisit").val(unescape(keyVisit));
			messages.openLoading();
			$("#activities-form").attr('action', '/payroll-agenda/startVisit');
			$("#activities-form").submit();
		};
	
// 		$("#btn-continuar-visita").click(openStarVisit);
// 		$("#btn-comenzar-visita").click(openStarVisit);
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
							<div class="col s8 bwbh-title">
								<p class="h2">Mi Perfil</p>                
							</div>
							<div class="col s4 bwbh-search">
								<div class="data-write">
									<!-- boton editar perfil  -->
								</div>
							</div>
						</div>

						<div class="bwb-list-scrollableContainer">
							<div class="row scrollArea">
								<form id="my-profile-form" method="post">					
										<table class="table">
											<tbody>
					        						<tr class="">
														<th class="col s12 my-profile-lineblock">
															<div class="row msg-block">
																<div class="msg-content">
																	<div class="msg-icon">
																		<i class="icon icon-personal"></i>
																	</div>
																	<div class="msg-description">
																		<p class="h5 msg-txt">Margarita, no olvides generar el reporte de tus visitas al terminar tu día de trabajo</p>
																	</div>
																</div>
															</div>
															<div class="row prof-block">
																<div class="col s8 prof-cont">
																		<div class="cl-photo"></div>
																		<div class="cl-desc">
																			<div>
																				<p class="h3 prf-name">Margarita Sánchez Robledo<p>
																			</div>
																			<div>
																				<p class="pfr-type">Teléfono</p>
																				<p class="pfr-desc">(55) 3958 1123</p>
																			</div>
																			<div>
																				<p class="pfr-type">Email</p>
																				<p class="pfr-desc">margarita.sanchez@hsbc.com.mx</p>
																			</div>
																			<div>
																				<p class="pfr-type">Dirección</p>
																				<p class="pfr-desc">Cerrada Desierto de los Leones 1520 Colonia San Juan Pescador, 06070 CDMX</p>
																			</div>
																			<div>
																				<p class="pfr-type">POC</p>
																				<p class="pfr-desc">6375 Interlomas, CDMX</p>
																			</div>
																		</div>
																</div>
																<div class="col s4 pstn-cont">
																	<div class="pstn-frame">
																		<div class="pstn-red-circle">
																			<p class="h2 pstn-num">4</p> 
																		</div>
																		<p class="h4 pstn-title">!Buen Trabajo¡</p>
																		<p class="h5 pstn-desc">Esta es la posición 4 de los 130 POC's en toda la República Méxicana</p>
																	</div>
																</div>
															</div>
															<div class="row rt-block">
																<div class="col s6">
																	<div>
																		<p class="h3 rt-title">Mis Logros</p>
																	</div>
																	<div>
																		<div class="achiv-circle-red">
																			<i class="icon icon-card icon-white"></i>
																		</div>
																		<div class="achiv-desc">
																			<p class="h4 num-rate">1,300&nbsp;</p>
																			<p class="h5 desc-rate">tarjetas integradas</p>
																		</div>
																	</div>
																	<div>
																		<div class="achiv-circle-red">
																			<i class="icon icon-today icon-white"></i>
																		</div>
																		<div class="achiv-desc">
																			<p class="h4 num-rate">32&nbsp;</p>
																			<p class="h5 desc-rate">visitas a empresas terminadas</p>
																		</div>
																	</div>
																	<div>
																		<div class="achiv-circle-red">
																			<i class="icon icon-opps icon-white"></i>
																		</div>
																		<div class="achiv-desc">
																			<p class="h4 num-rate">14:08&nbsp;</p>
																			<p class="h5 desc-rate">es tu mejor tiempo</p>
																		</div>
																	</div>
																</div>
																<div class="col s6 achiv-cont">
																	<div>
																		<div>
																			<p class="h3 rt-title">Mi desempeño</p>
																		</div>
																		<div class="perform-block">
																			<p class="h5">Tarjetas de crédito</p>
																			<div>---------------------------------  50%</div>
																			<p class="h6 perf-desc">Necesitas entregar 20 tarjetas más</p>
																		</div>
																		<div class="perform-block">
																			<p class="h5">Cross Celling</p>
																			<div>---------------------------------   75%</div>
																			<p class="h6 perf-desc">Necesitas vender 2 productos más</p>
																		</div>
																	</div>
																</div>
															</div>
														</th>
													</tr>
											</tbody>								
										</table>
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
	                    <input type="hidden" id="nameCompany" name="nameCompany">
	                    <input type="hidden" id="keyVisit" name="keyVisit">
						<input type="hidden" id="hours" name="hours">
						<input type="hidden" id="minutes" name="minutes">
						<input type="hidden" id="ampm" name="ampm">
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
    	<script src="/payroll-agenda/statics/js/vendors/picker.js"></script>
    	<script src="/payroll-agenda/statics/js/vendors/picker.time.js"></script>
    	<script src="/payroll-agenda/statics/js/vendors/legacy.js"></script>
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
	        onSet: function(){} //Function for after opening timepicker
      });
    	</script>
    	<%@ include file="messages.jsp" %>
	</body>
</html>