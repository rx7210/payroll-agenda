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
										<select id="select-filter"> 
											<option value="T"  selected>Ver todas</option>
											<option value="Activo">Activo</option>
											<option value="Esperando">En espera</option>
											<option value="Pendiente">Pendiente</option>
											<option value="Completado">Completado</option>	
										</select>
								</div>
							</div>
							<div class="bwb-secondary-i">
								<i class="icon icon-search"></i>
							</div>
						</div>

						<div class="bwb-list-scrollableContainer">
							<div class="row scrollArea">
								<form id="company-form" method="post">
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
														<p class="h4"></p>
													</th>
												</tr>
											<thead>
											<tbody>
												<c:forEach var="account" items="${lstAccounts}">
					        						<tr class="staVisit ${account.status}">
														<th class="col s12 comp-lineblock">
															<div class="row">
																<c:if test="${account.status.contains('Esperando')}">
																	<div class="col s12 lb-left">
																		<div class="lb-leyend">
																</c:if>
																<c:if test="${!account.status.contains('Esperando')}">
																	<div class="col s8 lb-left">
																		<div class="lb-leyend-with-btn">
																</c:if>
																		<p class="h4">${account.clientName}</p>
																		<p class="lb-descripton">Integraci&oacute;n | CTA. ${account.dda}</p>
																	</div>
																	<c:if test="${account.status.contains('Activo')}">
																		<div class="lb-circle c-blue">
																			<i class="icon icon-content"></i>
																		</div>
																		<div class="lb-description">
																			<p class="h5">${account.status}"</p> 	<!-- Activo -->
																		</div>
																	</c:if>
																	<c:if test="${account.status.contains('Esperando')}">
																		<div class="lb-circle c-yellow">
																			<i class="icon icon-error-1"></i>
																		</div>
																		<div class="lb-description">
																			<p class="h5">${account.status}"</p> 	<!-- Esperando respuesta por parte del integrador -->
																		</div>
																	</c:if>
																	<c:if test="${account.status.contains('Pendiente')}">
																		<div class="lb-circle c-red">
																			<i class="icon icon-done"></i>
																		</div>
																		<div class="lb-description">
																			<p class="h5">${account.status}"</p> 	<!-- Pendiente -->
																		</div>
																	</c:if>
																	<c:if test="${account.status.contains('Completado')}">								
																		<div class="lb-circle c-green">
																			<i class="icon icon-done"></i>
																		</div>
																		<div class="lb-description">
																			<p class="h5">${account.status}"</p>	<!-- Completado -->
																		</div>
																	</c:if>
																</div>
																
																	<c:if test="${account.status.contains('Activo')}">
																		<div class="col s4 lb-right">
																			<div class="lb-circle">
																				<i class="icon icon-address"></i>
																			</div>
																			<div  class="cont-btn">
																				<a class="btn small blue" >Inicar integraci&oacute;n</a>
																			</div>
																		</div>
																	</c:if>
																	<c:if test="${account.status.contains('Pendiente')}">
																		<div class="col s4 lb-right">
																			<div class="lb-circle">
																				<i class="icon icon-error"></i>
																			</div>
																			<div class="lb-circle">
																				<i class="icon icon-ok"></i>
																			</div>
																		</div>
																	</c:if>
																	<c:if test="${account.status.contains('Completado')}">
																		<div class="col s4 lb-right">
																			<div  class="cont-btn">
																				<a class="btn small green" >Ver reporte</a>
																			</div>
																		</div>
																	</c:if>
															</div>
															<hr class="two"><hr class="one">
														</th>
													</tr>
												</c:forEach>
											</tbody>								
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
	<%@ include file="messages.jsp" %>
	<script src="/payroll-agenda/statics/js/vendors.min.js"></script>
    <script src="/payroll-agenda/statics/js/main.min.js"></script>
	</body>
</html>