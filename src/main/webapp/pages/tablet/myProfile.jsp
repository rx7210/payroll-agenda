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
							<div class="col s4 bwbh-edit-profile">
								<div id="edit-profile"class="data-write">
									<div class="btn-edit">
										<p class="h5 fond-red">Editar perfil</p>
										<i class="icon icon-edit"></i>
									</div>
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
																		<i class="icon icon-eye"></i>
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
																			<p class="h5 perf-type">Tarjetas de crédito</p>
																			<div>
																				<div class="progressBar-block">
																					<div class="progressBar-fondo"></div>
																					<div class=" progress progressBar-active">
																			        </div>
																				</div>
																				<p class="h5 porc-num">50%</p>
																			</div>
																			<p class="h6 perf-desc">Necesitas entregar 20 tarjetas más</p>
																		</div>
																		<div class="perform-block">
																			<p class="h5 perf-type">Cross Celling</p>
																			<div>
																				<div class="progressBar-block">
																					<div class="progressBar-fondo"></div>
																					<div class=" progress progressBar-active">
																			        </div>
																				</div>
																				<p class="h5 porc-num">75%</p>
																			</div>
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
		
		<div id="right-black-shadow" class="right-black-shadow"></div>
		
		<section id="r-content" class="r-content">
			<div class="rc-back">
				<div class="rc-heading">
					<div id="rch-close" class="rch-close">
						<i class="icon icon icon-error"></i>
					</div>
					<div class="rch-title">
						<p class="t-type">Editar Perfil</p>
						<p class="t-type">Margarita Sánchez Romero</p>
						<p id="companyNameTittle" class="t-leyend"/>
					</div>
				</div>
				
				<div class="rc-info">
					<form id="edit-perfil-form" class="rci-form" method="post">
						<div class="row">
							<div class="col s12 rci-title">
								<p>Modifica los datos de tu perfil</p>
							</div>
							<hr class="col s12">
							<div class="col s12 input-field">
			                    <input id="telefonoEdit" type="text" name="telefonoEdit" maxlength="80">
			                    <label for="telefonoEdit">Tel&eacute;fono</label>
			                    <p class="form-tips">Introduce tu tel&eacute;</p>
			                </div>
			                <div class="col s12 input-field">
			                    <input id="emailEdit" type="text" name="emailEdit" maxlength="80">
			                    <label for="emailEdit">Email</label>
			                    <p class="form-tips">Introduce tu email</p>
			                </div>
			                <div class="col s12 input-field">
			                    <input id="direccionEdit" type="text" name="direccionEdit" maxlength="80">
			                    <label for="direccionEdit">Direcci&oacute;n</label>
			                    <p class="form-tips">Introduce tu direcci&oacute;n tal como aparece en tu identificaci&oacute;n</p>
			                </div>
			                <div class="col s6 input-field">
			                    <input id="numExteriorEdit" type="text" name="numExteriorEdit" maxlength="80">
			                    <label for="numExteriorEdit">No. exterior</label>
			                    <p class="form-tips">Introduce tu direcci&oacute;n tal como aparece en tu identificaci&oacute;n</p>
			                </div>
			                <div class="col s6 input-field">
			                    <input id="numInteriorEdit" type="text" name="numInteriorEdit" maxlength="80">
			                    <label for="numInteriorEdit">No. interior</label>
			                    <p class="form-tips">Introduce tu direcci&oacute;n tal como aparece en tu identificaci&oacute;n</p>
			                </div>
			                <div class="col s6 input-field">
			                    <input id="coloniaEdit" type="text" name="coloniaEdit" maxlength="80">
			                    <label for="coloniaEdit">Col&oacute;nia</label>
			                    <p class="form-tips">Introduce tu direcci&oacute;n tal como aparece en tu identificaci&oacute;n</p>
			                </div>
			                <div class="col s6 input-field">
			                    <input id="cpEdit" type="text" name="cpEdit" maxlength="80">
			                    <label for="cpEdit">C&oacute;digo Postal</label>
			                    <p class="form-tips">Introduce tu direcci&oacute;n tal como aparece en tu identificaci&oacute;n</p>
			                </div>
							<div class="col s12 cont-btn">
								<a id="btn-save-agenda" class="btn little red">Guardar</a>
							</div>
						</div>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="menu.jsp" %>
	<%@ include file="messages.jsp" %>
	<script src="/payroll-agenda/statics/js/vendors.min.js"></script>
   	<script src="/payroll-agenda/statics/js/main.min.js"></script>
	</body>
</html>