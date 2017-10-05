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
							<div class="col s8 bwbh-title-arrow">
								<a href="" class="bwb-goback">
				                  <i class="icon icon-arrow-back"></i>
				                </a>
								<p class="h2">${nameCompany}</p>                
							</div>
							<div class="col s4 bwbh-search">
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
														<p class="h4">A</p>
													</th>
												</tr>
											<thead>
											<tbody>
												<c:forEach var="account" items="${lstAccounts}">
					        						<tr class="">
														<th class="col s12 comp-lineblock">
															<div class="row">
																<div class="col s12 lb-left">
																	<div class="lb-leyend">
																		<p class="h4">${account.clientName}</p>
																		<p class="lb-descripton">Integracion | CTA. ${account.dda}</p>
																	</div>
																	<div class="lb-circle c-yellow">
																		<i class="icon icon-error-1"></i>
																	</div>
																	<div class="lb-description">
																		<p class="h5">Esperando respuesta por parte del integrador</p>
																	</div>
																</div>
															</div>
															<hr class="two"><hr class="one">
														</th>
													</tr>
												</c:forEach>
												<tr class="">
														<th class="col s12 comp-lineblock">
															<div class="row">
																<div class="col s8 lb-left">
																	<div class="lb-leyend-with-btn">
																		<p class="h4">Nombre</p>
																		<p class="lb-descripton">Integracion | CTA. 2412341234123412</p>
																	</div>
																	<div class="lb-circle c-blue">
																		<i class="icon icon-content"></i>
																	</div>
																	<div class="lb-description">
																		<p class="h5">Activo</p>
																	</div>
																</div>
																<div class="col s4 lb-right">
																	<div class="lb-location">
																		<i class="icon icon-address"></i>
																	</div>
																	<div  class="cont-btn">
																		<a class="btn small blue" >Inicar integración</a>
																	</div>
																</div>
															</div>
														</th>
													</tr>
											</tbody>								
										</table>
									</c:if>
								</form>
							</div>
						</div>           
					</div>
				</div>
			</section>
			<script src="/payroll-agenda/statics/js/vendors.min.js"></script>
    		<script src="/payroll-agenda/statics/js/main.min.js"></script>
		</main>
		<%@ include file="menu.jsp" %>
    	<%@ include file="messages.jsp" %>
	</body>
</html>
