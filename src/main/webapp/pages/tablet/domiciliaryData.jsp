
<div class="col-xs-12 nopadding" data-ng-init="domiciliaryDataVM.searchCPINIT();">
	<div class="col-xs-12 row nopadding shadow" style="background: #f9f9ff;">
		<div class="col-xs-2 col-md-1 nopadding">
			<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png" class="img-responsive center-block">
		</div>
		<div class="col-xs-2 col-md-1 hidetext" align="center">
			<a href="" class="link" data-ng-click="domiciliaryDataVM.back();">
				<img alt="Regresar"
					src="/payroll-agenda/statics/images/tablet/FLECHA2.png"
					class="img-responsive center-block"
					style="padding: 15px 0px 0px 0px">
				Regresar
			</a>
		</div>
		<div class="col-xs-6 col-md-9 ">
			<h3 align="center" class="headstyle"><%=session.getAttribute("nameClient")%></h3>
			<p align="center">Cuenta:&nbsp;<%=session.getAttribute("account")%></p>
		</div>
		<div class="col-xs-2 col-md-1 hidetext " align="center">
			<a href="#" class="link">
				<img src="/payroll-agenda/statics/images/tablet/Ayuda.png"
					class="img-responsive center-block"
					style="padding: 7px 0px 0px 0px">
				Ayuda
			</a>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-1 col-md-2"></div>
		<div class="col-xs-10 col-md-8 white-no-border shadow">
			<h4 align="center">Tarea 3: Verificación y recolección de información de domicilio</h4>
			<hr>
			<form name="domiciliaryDataForm">
				<div class="row">
				    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
				    	data-ng-class="{'has-error': domiciliaryDataForm.postalcode.$invalid && domiciliaryDataVM.isSubmited }">
				    	<label class="control-label" for="postalcode">Código Postal *</label>
				        <div class="input-group">
				            <input class="form-control" id="postalcode" name="postalcode" type="text"
				            min="1" max="999999"
				            data-ng-model="domiciliaryDataVM.data.postalcode"
				            data-ng-blur="domiciliaryDataVM.searchCP(domiciliaryDataVM.data.postalcode);"
				            required >
				            <span class="input-group-addon" >
				                <img alt="ok" class ="img-responsive" 
				                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
				                	data-ng-show="!domiciliaryDataForm.postalcode.$invalid">
				            </span>
				        </div>
				        <span class="control-label"
							data-ng-show="domiciliaryDataForm.postalcode.$error.required && domiciliaryDataVM.isSubmited">
							campo requerido!!
						</span>
						<span class="control-label"
							data-ng-show="!domiciliaryDataForm.postalcode.$error.required && domiciliaryDataForm.postalcode.$invalid && domiciliaryDataVM.isSubmited">
							campo con formato invalido!!
						</span>
				    </div>
					<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
						data-ng-class="{'has-error': domiciliaryDataForm.state.$invalid && domiciliaryDataVM.isSubmited }">
				    	<label class="control-label" for="state">Estado *</label>
				        <div class="input-group">
				            <input class="form-control" id="state" name="state" type="text" 
							data-ng-model="domiciliaryDataVM.data.state"
				             disabled>
				            <span class="input-group-addon">
				                <img alt="ok" class ="img-responsive" 
				                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
				                	data-ng-show="!domiciliaryDataForm.state.$invalid">
				            </span>
				        </div>
				         <span class="control-label"
							data-ng-show="domiciliaryDataForm.state.$error.required && domiciliaryDataVM.isSubmited">
							campo requerido!!
						</span>
						<span class="control-label"
							data-ng-show="!domiciliaryDataForm.state.$error.required && domiciliaryDataForm.state.$invalid && domiciliaryDataVM.isSubmited">
							campo con formato invalido!!
						</span>
				    </div>
				</div>
				<div class="row">
				    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
				    	data-ng-class="{'has-error': domiciliaryDataForm.city.$invalid && domiciliaryDataVM.isSubmited }">
				    	<label class="control-label" for="city">Ciudad *</label>
				        <div class="input-group">
				            <input class="form-control" id="city" name="city" type="text"
				            data-ng-model="domiciliaryDataVM.data.city"
				             disabled>
				            <span class="input-group-addon" >
				                <img alt="ok" class ="img-responsive" 
				                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
				                	data-ng-show="!domiciliaryDataForm.city.$invalid">
				            </span>
				        </div>
				        <span class="control-label"
							data-ng-show="domiciliaryDataForm.city.$error.required && domiciliaryDataVM.isSubmited">
							campo requerido!!
						</span>
						<span class="control-label"
							data-ng-show="!domiciliaryDataForm.city.$error.required && domiciliaryDataForm.city.$invalid && domiciliaryDataVM.isSubmited">
							campo con formato invalido!!
						</span>
				    </div>
					<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
						data-ng-class="{'has-error': domiciliaryDataForm.municipality.$invalid && domiciliaryDataVM.isSubmited }">
				    	<label class="control-label" for="municipality"> Delegación/Municipio *</label>
				        <div class="input-group">
				            <input class="form-control" id="municipality" name="municipality" type="text" 
							data-ng-model="domiciliaryDataVM.data.municipality"
				             disabled>
				            <span class="input-group-addon">
				                <img alt="ok" class ="img-responsive" 
				                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
				                	data-ng-show="!domiciliaryDataForm.municipality.$invalid">
				            </span>
				        </div>
				         <span class="control-label"
							data-ng-show="domiciliaryDataForm.municipality.$error.required && domiciliaryDataVM.isSubmited">
							campo requerido!!
						</span>
						<span class="control-label"
							data-ng-show="!domiciliaryDataForm.municipality.$error.required && domiciliaryDataForm.municipality.$invalid && domiciliaryDataVM.isSubmited">
							campo con formato invalido!!
						</span>
				    </div>
				</div>
				
				<div class="row">
					<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
						data-ng-class="{'has-error': (domiciliaryDataVM.data.colony=='' || domiciliaryDataVM.data.colony==undefined) && domiciliaryDataVM.isSubmited}">
						<label class="control-label" for="colony">Colonia *</label>
						<div class="input-group">
				            <select class="form-control" id="colony" name="colony"
				            	data-ng-model="domiciliaryDataVM.data.colony"
				            	required>
				            	<option disabled selected value=""> Selecciona una opción</option>
				            	<option data-ng-repeat="colony in domiciliaryDataVM.colonies" value="{{colony.localidad}}">{{colony.localidad}}</option>
							</select>
				            <span class="input-group-addon">
				                <img alt="ok" class ="img-responsive" 
				                src="/payroll-agenda/statics/images/tablet/CHECK.png"
				                data-ng-show="!domiciliaryDataForm.colony.$invalid">
				            </span>
				        </div>
				        <span style="color: #DD1F26" class="control-label"
							data-ng-show="domiciliaryDataForm.colony.$error.required && domiciliaryDataVM.isSubmited">
							Campo requerido!!
						</span>
					</div>
					<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
						data-ng-class="{'has-error': domiciliaryDataForm.street.$invalid && domiciliaryDataVM.isSubmited }">
				    	<label class="control-label" for="street">Calle *</label>
				        <div class="input-group">
				            <textarea class="form-control" id="street" name="street" 
				            data-ng-model="domiciliaryDataVM.data.street"
				            required
				            rows="2"></textarea>
				            <span class="input-group-addon">
				                <img alt="ok" class ="img-responsive" 
				                src="/payroll-agenda/statics/images/tablet/CHECK.png"
				                data-ng-show="!domiciliaryDataForm.street.$invalid">
				            </span>
				        </div>
				        <span class="control-label"
							data-ng-show="domiciliaryDataForm.street.$error.required && domiciliaryDataVM.isSubmited">
							campo requerido!!
						</span>
						<span class="control-label"
							data-ng-show="!domiciliaryDataForm.street.$error.required && domiciliaryDataForm.street.$invalid && domiciliaryDataVM.isSubmited">
							campo con formato invalido!!
						</span>
				    </div>
				    
				</div>
				<div class="row">
					<div class="form-group-padding col-xs-12 col-sm-6 col-md-6">
						<div class=" nopadding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': domiciliaryDataForm.numExt.$invalid && domiciliaryDataVM.isSubmited }">
					    	<label class="control-label" for="numExt">Número exterior</label>
					        <div class="input-group">
					            <input class="form-control" id="numExt" name="numExt" 
					            type="text"
					            data-ng-model="domiciliaryDataVM.data.numExt"
					            data-ng-pattern="/^[0-9a-zA-Z ]+$/"
					            >
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" 
					                src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                data-ng-show="!domiciliaryDataForm.numExt.$invalid">
					            </span>
					        </div>
					        <span class="control-label"
								data-ng-show="domiciliaryDataForm.numExt.$error.required && domiciliaryDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!domiciliaryDataForm.numExt.$error.required && domiciliaryDataForm.numExt.$invalid && domiciliaryDataVM.isSubmited">
								campo con formato invalido!!
							</span>
					    </div>
					    <div class="nopadding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': domiciliaryDataForm.numInt.$invalid && domiciliaryDataVM.isSubmited }">
					    	<label class="control-label" for="numInt">Número interior</label>
					        <div class="input-group">
					            <input class="form-control" id="numInt" name="numInt" 
					            type="text"
					            data-ng-model="domiciliaryDataVM.data.numInt"
					            data-ng-pattern="/^[0-9a-zA-Z ]+$/"
					             >
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" 
					                src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                data-ng-show="!domiciliaryDataForm.numInt.$invalid">
					            </span>
					        </div>
					        <span class="control-label"
								data-ng-show="domiciliaryDataForm.numInt.$error.required && domiciliaryDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!domiciliaryDataForm.numInt.$error.required && domiciliaryDataForm.numInt.$invalid && domiciliaryDataVM.isSubmited">
								campo con formato invalido!!
							</span>
					    </div>
					
					</div>
				</div>
				<div class="row" style="padding: 0px 30px;">
					<p><b>*</b> Campos mandatorios</p>
				</div>
				<div class="row" align="center">
					<a class="btn bcompleto btn-round-lg"
						ng-click="domiciliaryDataVM.submit(domiciliaryDataForm.$valid)">&nbsp;&nbsp;&nbsp;&nbsp;Continuar&#09;&nbsp;&nbsp;&nbsp;</a>
				</div>
			</form>
		</div>
	</div>
</div>
