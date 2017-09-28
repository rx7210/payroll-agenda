<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="es">
<head>
<title>Estándares Globales</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="stylesheet" href="/payroll-agenda/statics/css/bootstrapForms.css">
<link rel="stylesheet" href="/payroll-agenda/statics/css/signin.css">
<link rel="stylesheet" href="/payroll-agenda/statics/css/tarjetaFirmas.css">
<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
<script src="/payroll-agenda/statics/js/bootbox.js"></script>
<script src="/payroll-agenda/statics/js/angular.min-1.5.7.js"></script>
<script src="/payroll-agenda/statics/js/angular/tablet/globalStandars.js"></script>
</head>
<body style="padding: 0px" ng-app="globalStandars">
	<div class="col-xs-12 nopadding" ng-controller="globalStandarsController as globalStandarsVM">
		<div class="col-xs-12 row nopadding shadow" style="background: #f9f9ff;">
			<div class="col-xs-2 col-md-1 nopadding">
				<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png" class="img-responsive center-block">
			</div>
			<div class="col-xs-2 col-md-1 hidetext" align="center">
			 
				<a href="#" class="link"
					onclick="$('#spinner').modal();document.forms['globalStandarsForm'].action='/payroll-agenda/startVisit'; document.forms['globalStandarsForm'].submit();">
					<img alt="Regresar" src="/payroll-agenda/statics/images/tablet/FLECHA2.png" class="img-responsive center-block" style="padding: 15px 0px 0px 0px"> 
					Regresar
				</a>
			</div>
			<div class="col-xs-6 col-md-9 ">
				<h3 align="center" class="headstyle"><%=session.getAttribute("nameClient")%></h3>
				<p align="center">Cuenta:&nbsp;<%=session.getAttribute("account")%></p>
			</div>
			<div class="col-xs-2 col-md-1 hidetext " align="center">
				<a href="#" class="link"> 
					<img src="/payroll-agenda/statics/images/tablet/Ayuda.png" class="img-responsive center-block" style="padding: 7px 0px 0px 0px">
					Ayuda
				</a>
			</div>
		</div>
		<c:if test="${not empty error}">
			<div class="alert alert-dismissible alert-danger alert-hsbc">
		  		<button class="close" type="button" data-dismiss="alert">&times;</button>
				<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">
				<span>&nbsp;&nbsp;&nbsp;${error}</span>
			</div>
		</c:if>
		<div class="row">
			<div class="col-sm-1 col-md-2"></div>
			<div class="col-xs-12 col-sm-10 col-md-8 white-no-border shadow">
				<h4 align="center">Tarea 6: Movimientos bancarios</h4>
				<hr>
				<form name="globalStandarsForm" novalidate action="/payroll-agenda/saveGlobalStandard" method="post">
					<div class="row">
						<div class="form-group form-group-padding col-xs-12"
							
							data-ng-class="{'has-error': globalStandarsVM.data.deposito==undefined && globalStandarsVM.isSubmited}">
							<label class="control-label" for="deposito">¿Tiene la
								intención de hacer depósitos/retiros significativos de efectivo
								(Iguales o superiores a $10,000 dlls en moneda nacional)?*</label><br>
							<input data-ng-model="globalStandarsVM.data.deposito" value="0" type="radio" class="with-gap" id="NOdeposito" name="deposito" /> 
							<label  for="NOdeposito">NO</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input data-ng-model="globalStandarsVM.data.deposito" value="1" type="radio" class="with-gap" id="SIdeposito" name="deposito" /> 
							<label for="SIdeposito">SI</label>
						</div>
						<span style="margin-bottom: 15px; color: #DD1F26"
							class="control-label form-group form-group-padding col-xs-12"
							data-ng-show="globalStandarsVM.data.deposito==undefined && globalStandarsVM.isSubmited">
							Campo requerido!! 
						</span>
					</div>
					<div class="row" data-ng-show="globalStandarsVM.data.deposito=='1'"
						style="background: #efefef;">
						<div class="form-group form-group-padding col-xs-12 col-md-6"
							data-ng-class="{'has-error': globalStandarsForm.numberOfTransactions.$invalid && globalStandarsVM.isSubmited }">
							<label class="control-label" for="numberOfTransactions">
								¿Cuántas transacciones por mes realizará? *
							</label>
							<input class="form-control" id="numberOfTransactions" name="numberOfTransactions"
								type="number" min="1" max="999999999999999"
								data-ng-model="globalStandarsVM.data.txnMensuales"
								data-ng-required="globalStandarsVM.data.deposito=='1'">
							<span class="control-label"
								data-ng-show="globalStandarsForm.numberOfTransactions.$error.required && globalStandarsVM.isSubmited">
								campo requerido!!
							</span><br>
							<span class="control-label"
								data-ng-show="globalStandarsForm.numberOfTransactions.$invalid && globalStandarsVM.isSubmited">
								campo con formato invalido!!
							</span>
						</div>
						<div class="form-group form-group-padding col-xs-12 col-md-6"
							data-ng-class="{'has-error': (globalStandarsForm.MXN.$invalid || globalStandarsForm.USD.$invalid) && globalStandarsVM.isSubmited }">
							<label class="control-label" for="MXN">
								¿Cuál es el valor
								total de estas transacciones en moneda nacional(MXN) y en
								dólares (USD)? *
							</label>
							<div class="row">
								<div class="col-xs-6">
									<input class="form-control" id="MXN" name="MXN" type="number" placeholder="MXN"
										min="1" max="999999999999999"
										data-ng-model="globalStandarsVM.data.MXN"
										data-ng-required="globalStandarsVM.data.deposito=='1'">
									<span class="control-label"
										data-ng-show="globalStandarsForm.MXN.$error.required && globalStandarsVM.isSubmited">
										campo requerido!!
									</span><br>
									<span class="control-label"
										data-ng-show="globalStandarsForm.MXN.$invalid && globalStandarsVM.isSubmited">
										campo con formato invalido!!
									</span>
								</div>
								<div class="col-xs-6">
									<input class="form-control" id="USD" name="USD" type="number" placeholder="USD"
										min="1" max="999999999999999"
										data-ng-model="globalStandarsVM.data.USD"
										data-ng-required="globalStandarsVM.data.deposito=='1'">
									<span class="control-label"
										data-ng-show="globalStandarsForm.USD.$error.required && globalStandarsVM.isSubmited">
										campo requerido!!
									</span><br>
									<span class="control-label"
										data-ng-show="globalStandarsForm.USD.$invalid && globalStandarsVM.isSubmited">
										campo con formato invalido!!
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group form-group-padding col-xs-12" 
							data-ng-class="{'has-error': globalStandarsVM.data.txnInter==undefined && globalStandarsVM.isSubmited}">
							<label class="control-label" for="transaccionesInter">
								¿Tiene
								la intención de enviar/recibir dinero de otros países a través
								de esta cuenta? *
							</label><br>
							<input data-ng-model="globalStandarsVM.data.txnInter" value="0"
								type="radio" class="with-gap" id="NOtransaccionesInter" name="transaccionesInter" />
							<label  for="NOtransaccionesInter">NO</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input data-ng-model="globalStandarsVM.data.txnInter"
								value="1" type="radio" class="with-gap" id="SItransaccionesInter"
								name="transaccionesInter" />
							<label  for="SItransaccionesInter">SI</label>
						</div>
						<span style="margin-bottom: 15px; color: #DD1F26"
							class="control-label form-group form-group-padding col-xs-12"
							data-ng-show="globalStandarsVM.data.txnInter==undefined && globalStandarsVM.isSubmited">
							Campo requerido!! 
						</span>
					</div>
					<div class="row" data-ng-show="globalStandarsVM.data.txnInter=='1'" style="background: #efefef;">
						<div class="form-group form-group-padding col-xs-12" 
							data-ng-class="{'has-error': globalStandarsVM.data.txnInterSancion==undefined && globalStandarsVM.isSubmited}">
							<label class="control-label" for="transaccionesInterSancion">¿Alguna
								de estas transferencias internacionales tendrá como
								destino/origen alguno de los siguientes países: Cuba, Irán, Corea
								del Norte, Sudán, Siria o Región de Crimea? *
							</label><br>
							
							<input data-ng-model="globalStandarsVM.data.txnInterSancion"
								value="0" type="radio" class="with-gap" id="NOtransaccionesInterSancion"
								name="transaccionesInterSancion" />
							<label  for="NOtransaccionesInterSancion"> NO </label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input data-ng-model="globalStandarsVM.data.txnInterSancion"
								value="1" type="radio" class="with-gap" id="SItransaccionesInterSancion"
								name="transaccionesInterSancion" />
							<label  for="SItransaccionesInterSancion">SI</label>
						</div>
						<span style="margin-bottom: 15px; color: #DD1F26"
							class="control-label form-group form-group-padding col-xs-12"
							data-ng-show="globalStandarsVM.data.txnInterSancion==undefined && globalStandarsVM.isSubmited">
							Campo requerido!! 
						</span>
						<div class="form-group form-group-padding col-xs-12 col-md-6"
							data-ng-show="globalStandarsVM.data.txnInterSancion=='1'"
							data-ng-class="{'has-error': (globalStandarsVM.data.country=='' || globalStandarsVM.data.country==undefined) && globalStandarsVM.isSubmited}">
							<label class="control-label" for="country">Indique el país:</label>
							<select class="form-control" id="country" name="country"
								data-ng-model="globalStandarsVM.data.country"
								data-ng-required="globalStandarsVM.data.txnInterSancion=='1'">
								<option disabled selected value="">Selecciona</option>
								<c:forEach var="country" items="${countriesWithSanction}">
									<option value="${country}">${country}</option>
				 				</c:forEach>
							</select>
							<span style="color: #DD1F26" class="control-label"
								data-ng-show="globalStandarsForm.country.$error.required && globalStandarsVM.isSubmited">
								Campo requerido!!
							</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group form-group-padding col-xs-12" 
							data-ng-class="{'has-error': globalStandarsVM.data.cambioPais==undefined && globalStandarsVM.isSubmited}">
							<label class="control-label" for="cambioPais">
								¿Ha cambiado su país de residencia en los últimos 3 años? *
							</label><br>
							<input data-ng-model="globalStandarsVM.data.cambioPais" value="0"
								type="radio" class="with-gap" id="NOcambioPais" name="cambioPais" />
							<label for="NOcambioPais">NO</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input data-ng-model="globalStandarsVM.data.cambioPais"
								value="1" type="radio" class="with-gap" id="SIcambioPais"
								name="cambioPais" />
							<label for="SIcambioPais">&nbsp;&nbsp;&nbsp;&nbsp;SI</label>
						</div>
						<span style="margin-bottom: 15px; color: #DD1F26"
							class="control-label form-group form-group-padding col-xs-12"
							data-ng-show="globalStandarsVM.data.cambioPais==undefined && globalStandarsVM.isSubmited">
							Campo requerido!! 
						</span>
					</div>
					<div class="row" style="background: #efefef;">
						<div class="form-group form-group-padding col-xs-12 col-md-6"
							data-ng-show="globalStandarsVM.data.cambioPais=='1'"
							data-ng-class="{'has-error': (globalStandarsVM.data.oldcountry=='' || globalStandarsVM.data.oldcountry==undefined) && globalStandarsVM.isSubmited}">
							<label class="control-label" for="oldcountry">Indique el país:</label>
							<select class="form-control" id="oldcountry" name="oldcountry"
								data-ng-model="globalStandarsVM.data.oldcountry"
								data-ng-required="globalStandarsVM.data.cambioPais=='1'">
								<option disabled selected value="">Selecciona</option>
								<c:forEach var="country" items="${countriesOfResidence}">
									<option value="${country}">${country}</option>
				 				</c:forEach>
							</select>
							<span style="color: #DD1F26" class="control-label"
								data-ng-show="globalStandarsForm.oldcountry.$error.required && globalStandarsVM.isSubmited">
								Campo requerido!!
							</span>
						</div>
					</div>
					<div class="row" style="padding: 0px 30px;">
						<p>* Campos mandatorios</p>
					</div>
					<div class="row" align="center">
						<a class="btn bcompleto btn-round-lg" ng-click="globalStandarsVM.submit(globalStandarsForm.$valid);">&nbsp;&nbsp;&nbsp;&nbsp;Continuar&#09;&nbsp;&nbsp;&nbsp;</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="modal.jsp" %>
<div class="modal fade" id="spinner" data-backdrop="static"
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
</body>
</html>

