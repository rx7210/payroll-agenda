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
    	body = $("#body");
    	container = $("#container");
    	burger=$("#burger");
    	left_white_shadow=$('#left-white-shadow');	
    	left_menu=$('#left-menu');
    	lm_close=$("#lm-close");
    	
    	btn_agenda_visita=$("#btn-agenda-visita");
    	right_black_shadow=$('#right-black-shadow');
    	r_content=$('#r-content');
    	rch_close=$("#rch-close");
    	activities_form=$("#activities-form");
    	agenda_form=$("#agenda-form");
    	
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

    	burger.click(function (){;
    		left_white_shadow.animate({width:"100%"},0);
			left_menu.animate({left:'0px'},50);	
		});
		
		var closeLeftContent = function (){
			
			left_white_shadow.animate({width:"0"},0);
			left_menu.animate({left:'-340px'},0);
		}
		left_white_shadow.click(closeLeftContent);
		lm_close.click(closeLeftContent);
		
		btn_agenda_visita.click(function (){
			right_black_shadow.animate({width:"100%"},0);
			r_content.animate({right:'0px'},50);
		});
		
		var closeRightContent = function (){
			right_black_shadow.animate({width:"0"},0);
			r_content.animate({right:'-500px'},50);
		}
		right_black_shadow.click(closeRightContent);
		rch_close.click(closeRightContent);
		
		$("#lm-down").click(function (){
			messages.openLoading();
			activities_form.attr('action', '/payroll-agenda/exitAgenda');
			activities_form.submit();
		});
		
		$("#lm-link-agenda").click(function (){
			messages.openLoading();
			closeLeftContent();
			activities_form.attr('action', '/payroll-agenda/homeAgenda');
			activities_form.submit();
		});
		$("#btn-save-agenda").click(function (){
			messages.openLoading();
			closeRightContent();
			agenda_form.attr('action', '/payroll-agenda/agendar');
			agenda_form.submit();
		});
		
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
								<p class="h2">${nameCompany}</p>                
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
								<form id="activities-form" method="post">
									<c:if test="${lstAccounts.size() <= 0}">
										<div class="col s12 empty-state">
											<p class="h2">No hay empleados agregados a esta empresa</p>
										</div>
									</c:if>	
									<c:if test="${lstAccounts.size() > 0}">						
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
																			<a class="btn small green" href="#">Ver informe</a>
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
    	<%@ include file="messages.jsp" %>
	</body>
</html>
