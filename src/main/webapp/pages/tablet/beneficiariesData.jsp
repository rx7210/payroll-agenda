
	<div class="col-xs-12 nopadding">
		<div class="col-xs-12 row nopadding shadow" style="background: #f9f9ff;">
			<div class="col-xs-2 col-md-1 nopadding">
				<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png" class="img-responsive center-block">
			</div>
			<div class="col-xs-2 col-md-1 hidetext" align="center">
				<a href="" class="link"
					data-ng-click="beneficiariesDataVM.back();">
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
				<h4 align="center"> Tarea 5: Recolección y verificación de información de beneficiarios</h4>
				<hr>

					<div class="row"style="padding:0">
						<div class="col-xs-6" style="padding:0">
							<button type="button" class="btn custom-button-width "
								data-ng-class="{'btn-tab':!beneficiariesDataVM.flagPane, 'bcompleto noactive':beneficiariesDataVM.flagPane}"
								data-ng-click="beneficiariesDataVM.flagPane=true">Beneficiario 1</button>
						</div>
						<div class="col-xs-6" style="padding:0" data-ng-show="beneficiariesDataVM.flagBen2">
							<button type="button" class="btn custom-button-width "
								data-ng-class="{'noactive':!beneficiariesDataVM.flagBen2,'btn-tab':beneficiariesDataVM.flagPane, 'bcompleto noactive':!beneficiariesDataVM.flagPane}"
								data-ng-click="beneficiariesDataVM.flagPane=false">Beneficiario 2</button>
						</div>
					</div> 
<form name="beneficiariesDataForm">
<!-- beneficiario 1 -->
					<div data-ng-show="beneficiariesDataVM.flagPane">
						<div class="row">
						    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
						    	data-ng-class="{'has-error': beneficiariesDataForm.name1.$invalid && beneficiariesDataVM.isSubmited }">
						    	<label class="control-label" for="name1">Nombre (s)*</label>
						        <div class="input-group">
						            <input class="form-control" id="name1" name="name1" type="text"
						            data-ng-model="beneficiariesDataVM.data.name1"
						            data-ng-pattern="/^[a-zA-ZáéíóúAÉÍÓÚÑñ ]+$/"
						            required >
						            <span class="input-group-addon" >
						                <img alt="ok" class ="img-responsive" 
						                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                	data-ng-show="!beneficiariesDataForm.name1.$invalid">
						            </span>
						        </div>
						        <span class="control-label"
									data-ng-show="beneficiariesDataForm.name1.$error.required && beneficiariesDataVM.isSubmited">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm.name1.$error.required && beneficiariesDataForm.name1.$invalid && beneficiariesDataVM.isSubmited">
									campo con formato invalido!!
								</span>
						    </div>
							<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
								data-ng-class="{'has-error': beneficiariesDataForm.firstname1.$invalid && beneficiariesDataVM.isSubmited }">
						    	<label class="control-label" for="firstname1">Apellido (s)*</label>
						        <div class="input-group">
						            <input class="form-control" id="firstname1" name="firstname1" type="text" 
									data-ng-model="beneficiariesDataVM.data.firstname1"
						            data-ng-pattern="/^[a-zA-ZáéíóúAÉÍÓÚÑñ ]+$/"
						            required >
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                	data-ng-show="!beneficiariesDataForm.firstname1.$invalid">
						            </span>
						        </div>
						         <span class="control-label"
									data-ng-show="beneficiariesDataForm.firstname1.$error.required && beneficiariesDataVM.isSubmited">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm.firstname1.$error.required && beneficiariesDataForm.firstname1.$invalid && beneficiariesDataVM.isSubmited">
									campo con formato invalido!!
								</span>
						    </div>
						</div>
						<div class="row">
							<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
								data-ng-class="{'has-error': beneficiariesDataForm.relationship1.$invalid && beneficiariesDataVM.isSubmited }">
						    	<label class="control-label" for="relationship1">Parentesco*</label>
						        <div class="input-group">
						            <input class="form-control" id="relationship1" name="relationship1" type="text"
						            data-ng-model="beneficiariesDataVM.data.relationship1"
						            data-ng-pattern="/^[a-zA-ZáéíóúAÉÍÓÚÑñ ]+$/"
						            required>
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                data-ng-show="!beneficiariesDataForm.relationship1.$invalid">
						            </span>
						        </div>
						        <span class="control-label"
									data-ng-show="beneficiariesDataForm.relationship1.$error.required && beneficiariesDataVM.isSubmited">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm.relationship1.$error.required && beneficiariesDataForm.relationship1.$invalid && beneficiariesDataVM.isSubmited">
									campo con formato invalido!!
								</span>
						    </div>
							<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
								data-ng-class="{'has-error': (beneficiariesDataVM.data.percentage1=='' || beneficiariesDataVM.data.percentage1==undefined) && beneficiariesDataVM.isSubmited}">
								<label class="control-label" for="percentage1">Porcentaje*</label>
								<div class="input-group">
									<input class=" form-control" id="percentage1" name="percentage1"
	            						required
	            						data-ng-model="beneficiariesDataVM.data.percentage1"
	            						data-ng-pattern="/^[1-9][0-9]?$|^100$/">
	            					<span class="input-group-addon">%</span>
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                data-ng-show="!beneficiariesDataForm.percentage1.$invalid">
						            </span>
						        </div>
						        <span style="color: #DD1F26" class="control-label"
									data-ng-show="beneficiariesDataForm.percentage1.$error.required && beneficiariesDataVM.isSubmited">
									Campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm.percentage1.$error.required && beneficiariesDataForm.percentage1.$invalid && beneficiariesDataVM.isSubmited">
									campo con formato invalido!!
								</span>
							</div>
						</div>
						<div class="row">
							<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': beneficiariesDataForm.birthdate1.$invalid && beneficiariesDataVM.isSubmited }">
						    	<label class="control-label" for="birthdate1">Fecha de nacimiento*</label>
						        <div class="input-group">
						            <input class="datepicker form-control" id="birthdate1" name="birthdate1"
	            						required
	            						data-ng-model="beneficiariesDataVM.data.birthdate1"
	            						data-ng-pattern="/^([0-9]{2})\/([0-9]{2})\/([0-9]{4})/">
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                data-ng-show="!beneficiariesDataForm.birthdate1.$invalid">
						            </span>
						        </div>
						        <span class="control-label"
									data-ng-show="beneficiariesDataForm.birthdate1.$error.required && beneficiariesDataVM.isSubmited">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm.birthdate1.$error.required && beneficiariesDataForm.birthdate1.$invalid && beneficiariesDataVM.isSubmited">
									campo con formato invalido!!
								</span>
					    	</div>
					    	<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
								data-ng-class="{'has-error': beneficiariesDataForm.homephone1.$invalid && beneficiariesDataVM.isSubmited }">
						    	<label class="control-label" for="homephone1">Teléfono de casa</label>
						        <div class="input-group">
						            <input class="form-control" id="homephone1" name="homephone1" type="number"
						            min="1" max="9999999999" 
									data-ng-model="beneficiariesDataVM.data.homephone1"
						            data-ng-pattern="/^[0-9]{10}/">
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                	data-ng-show="!beneficiariesDataForm.homephone1.$invalid">
						            </span>
						        </div>
						         <span class="control-label"
									data-ng-show="beneficiariesDataForm.homephone1.$error.required && beneficiariesDataVM.isSubmited">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm.homephone1.$error.required && beneficiariesDataForm.homephone1.$invalid && beneficiariesDataVM.isSubmited">
									campo con formato invalido!!
								</span>
						    </div>
							
						</div>
						<div class="row" align="center">
							<div 
								data-ng-class="{'has-error': beneficiariesDataVM.data.samedirection1==undefined && beneficiariesDataVM.isSubmited}">
								<label class="control-label" for="samedirection12">¿La dirección del beneficiario es la misma que la del nominahabiente? *</label><br>
								<div style="display:inline-block;">
									<input type="radio" class="with-gap" id="NO1" value="NO" name="samedirection1" 
										data-ng-model="beneficiariesDataVM.data.samedirection1"
										required
										data-ng-click/>
									<label for="NO1">No</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" class="with-gap" id="SI1" value="SI" name="samedirection1" 
										data-ng-model="beneficiariesDataVM.data.samedirection1"/>
									<label  for="SI1">Si</label>
								</div>
							</div>
							 <span style="color: #DD1F26" class="control-label"
								data-ng-show="beneficiariesDataVM.data.samedirection1==undefined && beneficiariesDataVM.isSubmited">
								Campo requerido!!
							</span>
						</div>
						<div data-ng-show ="beneficiariesDataVM.data.samedirection1=='NO' " style="background: #efefef;">
							<div class="row">
							    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							    	data-ng-class="{'has-error': beneficiariesDataForm.postalcode1.$invalid && beneficiariesDataVM.isSubmited }">
							    	<label class="control-label" for="postalcode1">Código Postal *</label>
							        <div class="input-group">
							            <input class="form-control" id="postalcode1" name="postalcode1" type="number"
							            min="1" max="999999"
							            data-ng-model="beneficiariesDataVM.data.postalcode1"
							            data-ng-blur="beneficiariesDataVM.searchCP(beneficiariesDataVM.data.postalcode1,1);"
							            data-ng-required ="beneficiariesDataVM.data.samedirection1=='NO'" >
							            <span class="input-group-addon" >
							                <img alt="ok" class ="img-responsive" 
							                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                	data-ng-show="!beneficiariesDataForm.postalcode1.$invalid">
							            </span>
							        </div>
							        <span class="control-label"
										data-ng-show="beneficiariesDataForm.postalcode1.$error.required && beneficiariesDataVM.isSubmited">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm.postalcode1.$error.required && beneficiariesDataForm.postalcode1.$invalid && beneficiariesDataVM.isSubmited">
										campo con formato invalido!!
									</span>
							    </div>
								<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
									data-ng-class="{'has-error': beneficiariesDataForm.state1.$invalid && beneficiariesDataVM.isSubmited }">
							    	<label class="control-label" for="state1">Estado *</label>
							        <div class="input-group">
							            <input class="form-control" id="state1" name="state1" type="text" 
										data-ng-model="beneficiariesDataVM.data.state1"
							            disabled>
							            <span class="input-group-addon">
							                <img alt="ok" class ="img-responsive" 
							                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                	data-ng-show="!beneficiariesDataForm.state1.$invalid">
							            </span>
							        </div>
							         <span class="control-label"
										data-ng-show="beneficiariesDataForm.state1.$error.required && beneficiariesDataVM.isSubmited">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm.state1.$error.required && beneficiariesDataForm.state1.$invalid && beneficiariesDataVM.isSubmited">
										campo con formato invalido!!
									</span>
							    </div>
							</div>
							<div class="row">
							    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							    	data-ng-class="{'has-error': beneficiariesDataForm.city1.$invalid && beneficiariesDataVM.isSubmited }">
							    	<label class="control-label" for="city1">Ciudad *</label>
							        <div class="input-group">
							            <input class="form-control" id="city1" name="city1" type="text"
							            data-ng-model="beneficiariesDataVM.data.city1"
							            disabled>
							            <span class="input-group-addon" >
							                <img alt="ok" class ="img-responsive" 
							                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                	data-ng-show="!beneficiariesDataForm.city1.$invalid">
							            </span>
							        </div>
							        <span class="control-label"
										data-ng-show="beneficiariesDataForm.city1.$error.required && beneficiariesDataVM.isSubmited">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm.city1.$error.required && beneficiariesDataForm.city1.$invalid && beneficiariesDataVM.isSubmited">
										campo con formato invalido!!
									</span>
							    </div>
								<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
									data-ng-class="{'has-error': beneficiariesDataForm.municipality1.$invalid && beneficiariesDataVM.isSubmited }">
							    	<label class="control-label" for="municipality1"> Delegación/Municipio *</label>
							        <div class="input-group">
							            <input class="form-control" id="municipality1" name="municipality1" type="text" 
										data-ng-model="beneficiariesDataVM.data.municipality1"
							            disabled>
							            <span class="input-group-addon">
							                <img alt="ok" class ="img-responsive" 
							                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                	data-ng-show="!beneficiariesDataForm.municipality1.$invalid">
							            </span>
							        </div>
							         <span class="control-label"
										data-ng-show="beneficiariesDataForm.municipality1.$error.required && beneficiariesDataVM.isSubmited">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm.municipality1.$error.required && beneficiariesDataForm.municipality1.$invalid && beneficiariesDataVM.isSubmited">
										campo con formato invalido!!
									</span>
							    </div>
							    
							</div>
							
							<div class="row">
								<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
									data-ng-class="{'has-error': (beneficiariesDataVM.data.colony1=='' || beneficiariesDataVM.data.colony1==undefined) && beneficiariesDataVM.isSubmited}">
									<label class="control-label" for="colony1">Colonia *</label>
									<div class="input-group">
							            <select class="form-control" id="colony1" name="colony1"
							            	data-ng-model="beneficiariesDataVM.data.colony1"
							            	data-ng-required ="beneficiariesDataVM.data.samedirection1=='NO'">
							            	<option disabled selected value=""> Selecciona una opción</option>
							            	<option data-ng-repeat="colony in beneficiariesDataVM.colonies1" value="{{colony.localidad}}">{{colony.localidad}}</option>
										</select>
							            <span class="input-group-addon">
							                <img alt="ok" class ="img-responsive" 
							                src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                data-ng-show="!beneficiariesDataForm.colony1.$invalid">
							            </span>
							        </div>
							        <span style="color: #DD1F26" class="control-label"
										data-ng-show="beneficiariesDataForm.colony1.$error.required && beneficiariesDataVM.isSubmited">
										Campo requerido!!
									</span>
								</div>
								<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
									data-ng-class="{'has-error': beneficiariesDataForm.street1.$invalid && beneficiariesDataVM.isSubmited }">
							    	<label class="control-label" for="street1">Calle, número exterior y número interior *</label>
							        <div class="input-group">
							            <textarea class="form-control" id="street1" name="street1" 
							            data-ng-model="beneficiariesDataVM.data.street1"
							            data-ng-required ="beneficiariesDataVM.data.samedirection1=='NO'"
							            rows="4"></textarea>
							            <span class="input-group-addon">
							                <img alt="ok" class ="img-responsive" 
							                src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                data-ng-show="!beneficiariesDataForm.street1.$invalid">
							            </span>
							        </div>
							        <span class="control-label"
										data-ng-show="beneficiariesDataForm.street1.$error.required && beneficiariesDataVM.isSubmited">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm.street1.$error.required && beneficiariesDataForm.street1.$invalid && beneficiariesDataVM.isSubmited">
										campo con formato invalido!!
									</span>
							    </div>
							</div>
							<br><br>
						</div>
						<div class="row" style="padding: 0px 30px;">
							<hr>
							<p><b>*</b> Campos mandatorios</p>
						</div>
						<div class="row" align="center" data-ng-show="!beneficiariesDataVM.flagBen2">
							<a class="btn bcompleto btn-round-lg"
								ng-click="beneficiariesDataVM.submit(beneficiariesDataForm.$valid)">&nbsp;&nbsp;&nbsp;&nbsp;Continuar&#09;&nbsp;&nbsp;&nbsp;</a>
							<a class="btn bcompleto btn-round-lg"
								ng-click="beneficiariesDataVM.beneficiary2(beneficiariesDataForm.$valid)">&nbsp;&nbsp;&nbsp;&nbsp;Añadir beneficiario&#09;&nbsp;&nbsp;&nbsp;</a>
						</div>
					</div>
</form>
<!-- Beneficiario 2 -->
<form name="beneficiariesDataForm2">

					<div data-ng-show="!beneficiariesDataVM.flagPane">
						<div class="row">
						    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
						    	data-ng-class="{'has-error': beneficiariesDataForm2.name2.$invalid && beneficiariesDataVM.isSubmited2 }">
						    	<label class="control-label" for="name2">Nombre (s)*</label>
						        <div class="input-group">
						            <input class="form-control" id="name2" name="name2" type="text"
						            data-ng-model="beneficiariesDataVM.data.name2"
						            data-ng-pattern="/^[a-zA-ZáéíóúAÉÍÓÚÑñ ]+$/"
						            required >
						            <span class="input-group-addon" >
						                <img alt="ok" class ="img-responsive" 
						                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                	data-ng-show="!beneficiariesDataForm2.name2.$invalid">
						            </span>
						        </div>
						        <span class="control-label"
									data-ng-show="beneficiariesDataForm2.name2.$error.required && beneficiariesDataVM.isSubmited2">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm2.name2.$error.required && beneficiariesDataForm2.name2.$invalid && beneficiariesDataVM.isSubmited2">
									campo con formato invalido!!
								</span>
						    </div>
							<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
								data-ng-class="{'has-error': beneficiariesDataForm2.firstname2.$invalid && beneficiariesDataVM.isSubmited2 }">
						    	<label class="control-label" for="firstname2">Apellido (s)*</label>
						        <div class="input-group">
						            <input class="form-control" id="firstname2" name="firstname2" type="text" 
									data-ng-model="beneficiariesDataVM.data.firstname2"
						            data-ng-pattern="/^[a-zA-ZáéíóúAÉÍÓÚÑñ ]+$/"
						            required >
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                	data-ng-show="!beneficiariesDataForm2.firstname2.$invalid">
						            </span>
						        </div>
						         <span class="control-label"
									data-ng-show="beneficiariesDataForm2.firstname2.$error.required && beneficiariesDataVM.isSubmited2">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm2.firstname2.$error.required && beneficiariesDataForm2.firstname2.$invalid && beneficiariesDataVM.isSubmited2">
									campo con formato invalido!!
								</span>
						    </div>
						</div>
						<div class="row">
							<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
								data-ng-class="{'has-error': beneficiariesDataForm2.relationship2.$invalid && beneficiariesDataVM.isSubmited2 }">
						    	<label class="control-label" for="relationship2">Parentesco*</label>
						        <div class="input-group">
						            <input class="form-control" id="relationship2" name="relationship2" type="text"
						            data-ng-model="beneficiariesDataVM.data.relationship2"
						            data-ng-pattern="/^[a-zA-ZáéíóúAÉÍÓÚÑñ ]+$/"
						            required>
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                data-ng-show="!beneficiariesDataForm2.relationship2.$invalid">
						            </span>
						        </div>
						        <span class="control-label"
									data-ng-show="beneficiariesDataForm2.relationship2.$error.required && beneficiariesDataVM.isSubmited2">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm2.relationship2.$error.required && beneficiariesDataForm2.relationship2.$invalid && beneficiariesDataVM.isSubmited2">
									campo con formato invalido!!
								</span>
						    </div>
							<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
								data-ng-class="{'has-error': (beneficiariesDataVM.data.percentage2=='' || beneficiariesDataVM.data.percentage2==undefined) && beneficiariesDataVM.isSubmited2}">
								<label class="control-label" for="percentage2">Porcentaje*</label>
								<div class="input-group">
						            <input class=" form-control" id="percentage2" name="percentage2"
	            						required
	            						data-ng-model="beneficiariesDataVM.data.percentage2"
	            						data-ng-pattern="/^[1-9][0-9]?$|^100$/">
	            					<span class="input-group-addon">%</span>
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                data-ng-show="!beneficiariesDataForm2.percentage2.$invalid">
						            </span>
						        </div>
						        <span style="color: #DD1F26" class="control-label"
									data-ng-show="beneficiariesDataForm2.percentage2.$error.required && beneficiariesDataVM.isSubmited2">
									Campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm2.percentage2.$error.required && beneficiariesDataForm2.percentage2.$invalid && beneficiariesDataVM.isSubmited2">
									campo con formato invalido!!
								</span>
							</div>
						</div>
						<div class="row">
							<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': beneficiariesDataForm2.birthdate2.$invalid && beneficiariesDataVM.isSubmited2 }">
						    	<label class="control-label" for="birthdate2">Fecha de nacimiento*</label>
						        <div class="input-group">
						            <input class="datepicker form-control" id="birthdate2" name="birthdate2"
	            						required
	            						data-ng-model="beneficiariesDataVM.data.birthdate2"
	            						data-ng-pattern="/^([0-9]{2})\/([0-9]{2})\/([0-9]{4})/">
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                data-ng-show="!beneficiariesDataForm2.birthdate2.$invalid">
						            </span>
						        </div>
						        <span class="control-label"
									data-ng-show="beneficiariesDataForm2.birthdate2.$error.required && beneficiariesDataVM.isSubmited2">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm2.birthdate2.$error.required && beneficiariesDataForm2.birthdate2.$invalid && beneficiariesDataVM.isSubmited2">
									campo con formato invalido!!
								</span>
					    	</div>
					    	<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
								data-ng-class="{'has-error': beneficiariesDataForm2.homephone2.$invalid && beneficiariesDataVM.isSubmited2 }">
						    	<label class="control-label" for="homephone2">Teléfono de casa</label>
						        <div class="input-group">
						            <input class="form-control" id="homephone2" name="homephone2" type="number"
						            min="1" max="9999999999" 
									data-ng-model="beneficiariesDataVM.data.homephone2"
						            data-ng-pattern="/^[0-9]{10}/" >
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                	data-ng-show="!beneficiariesDataForm2.homephone2.$invalid">
						            </span>
						        </div>
						         <span class="control-label"
									data-ng-show="beneficiariesDataForm2.homephone2.$error.required && beneficiariesDataVM.isSubmited2">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!beneficiariesDataForm2.homephone2.$error.required && beneficiariesDataForm2.homephone2.$invalid && beneficiariesDataVM.isSubmited2">
									campo con formato invalido!!
								</span>
						    </div>
							
						</div>
						<div class="row" align="center">
							<div 
								data-ng-class="{'has-error': beneficiariesDataVM.data.samedirection2==undefined && beneficiariesDataVM.isSubmited2}">
								<label class="control-label" for="samedirection22">¿La dirección del beneficiario es la misma que la del nominahabiente? *</label><br>
								<div style="display:inline-block;">
									<input type="radio" class="with-gap" id="NO2" value="NO" name="samedirection2" 
										data-ng-model="beneficiariesDataVM.data.samedirection2"
										required
										data-ng-click/>
									<label for="NO2">No</label>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" class="with-gap" id="SI2" value="SI" name="samedirection2" 
										data-ng-model="beneficiariesDataVM.data.samedirection2"/>
									<label  for="SI2">Si</label>
								</div>
							</div>
							 <span style="color: #DD1F26" class="control-label"
								data-ng-show="beneficiariesDataVM.data.samedirection2==undefined && beneficiariesDataVM.isSubmited2">
								Campo requerido!!
							</span>
						</div>
						<div data-ng-show ="beneficiariesDataVM.data.samedirection2=='NO' " style="background: #efefef;">
							<div class="row">
							    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							    	data-ng-class="{'has-error': beneficiariesDataForm2.postalcode2.$invalid && beneficiariesDataVM.isSubmited2 }">
							    	<label class="control-label" for="postalcode2">Código Postal *</label>
							        <div class="input-group">
							            <input class="form-control" id="postalcode2" name="postalcode2" type="number"
							            min="1" max="999999"
							            data-ng-model="beneficiariesDataVM.data.postalcode2"
							            data-ng-blur="beneficiariesDataVM.searchCP(beneficiariesDataVM.data.postalcode2,2);"
							            data-ng-required ="beneficiariesDataVM.data.samedirection2=='NO'" >
							            <span class="input-group-addon" >
							                <img alt="ok" class ="img-responsive" 
							                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                	data-ng-show="!beneficiariesDataForm2.postalcode2.$invalid">
							            </span>
							        </div>
							        <span class="control-label"
										data-ng-show="beneficiariesDataForm2.postalcode2.$error.required && beneficiariesDataVM.isSubmited2">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm2.postalcode2.$error.required && beneficiariesDataForm2.postalcode2.$invalid && beneficiariesDataVM.isSubmited2">
										campo con formato invalido!!
									</span>
							    </div>
								<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
									data-ng-class="{'has-error': beneficiariesDataForm2.state2.$invalid && beneficiariesDataVM.isSubmited2 }">
							    	<label class="control-label" for="state2">Estado *</label>
							        <div class="input-group">
							            <input class="form-control" id="state2" name="state2" type="text" 
										data-ng-model="beneficiariesDataVM.data.state2"
							            disabled>
							            <span class="input-group-addon">
							                <img alt="ok" class ="img-responsive" 
							                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                	data-ng-show="!beneficiariesDataForm2.state2.$invalid">
							            </span>
							        </div>
							         <span class="control-label"
										data-ng-show="beneficiariesDataForm2.state2.$error.required && beneficiariesDataVM.isSubmited2">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm2.state2.$error.required && beneficiariesDataForm2.state2.$invalid && beneficiariesDataVM.isSubmited2">
										campo con formato invalido!!
									</span>
							    </div>
							</div>
							<div class="row">
							    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							    	data-ng-class="{'has-error': beneficiariesDataForm2.city2.$invalid && beneficiariesDataVM.isSubmited2 }">
							    	<label class="control-label" for="city2">Ciudad *</label>
							        <div class="input-group">
							            <input class="form-control" id="city2" name="city2" type="text"
							            data-ng-model="beneficiariesDataVM.data.city2"
							            disabled>
							            <span class="input-group-addon" >
							                <img alt="ok" class ="img-responsive" 
							                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                	data-ng-show="!beneficiariesDataForm2.city2.$invalid">
							            </span>
							        </div>
							        <span class="control-label"
										data-ng-show="beneficiariesDataForm2.city2.$error.required && beneficiariesDataVM.isSubmited2">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm2.city2.$error.required && beneficiariesDataForm2.city2.$invalid && beneficiariesDataVM.isSubmited2">
										campo con formato invalido!!
									</span>
							    </div>
								<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
									data-ng-class="{'has-error': beneficiariesDataForm2.municipality2.$invalid && beneficiariesDataVM.isSubmited2 }">
							    	<label class="control-label" for="municipality2"> Delegación/Municipio *</label>
							        <div class="input-group">
							            <input class="form-control" id="municipality2" name="municipality2" type="text" 
										data-ng-model="beneficiariesDataVM.data.municipality2"
							            disabled>
							            <span class="input-group-addon">
							                <img alt="ok" class ="img-responsive" 
							                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                	data-ng-show="!beneficiariesDataForm2.municipality2.$invalid">
							            </span>
							        </div>
							         <span class="control-label"
										data-ng-show="beneficiariesDataForm2.municipality2.$error.required && beneficiariesDataVM.isSubmited2">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm2.municipality2.$error.required && beneficiariesDataForm2.municipality2.$invalid && beneficiariesDataVM.isSubmited2">
										campo con formato invalido!!
									</span>
							    </div>
							    
							</div>
							
							<div class="row">
								<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
									data-ng-class="{'has-error': (beneficiariesDataVM.data.colony2=='' || beneficiariesDataVM.data.colony2==undefined) && beneficiariesDataVM.isSubmited2}">
									<label class="control-label" for="colony2">Colonia *</label>
									<div class="input-group">
							            <select class="form-control" id="colony2" name="colony2"
							            	data-ng-model="beneficiariesDataVM.data.colony2"
							            	data-ng-required ="beneficiariesDataVM.data.samedirection2=='NO'">
							            	<option disabled selected value=""> Selecciona una opción</option>
							            	<option data-ng-repeat="colony in beneficiariesDataVM.colonies2" value="{{colony.localidad}}">{{colony.localidad}}</option>
										</select>
							            <span class="input-group-addon">
							                <img alt="ok" class ="img-responsive" 
							                src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                data-ng-show="!beneficiariesDataForm2.colony2.$invalid">
							            </span>
							        </div>
							        <span style="color: #DD1F26" class="control-label"
										data-ng-show="beneficiariesDataForm2.colony2.$error.required && beneficiariesDataVM.isSubmited2">
										Campo requerido!!
									</span>
								</div>
								<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
									data-ng-class="{'has-error': beneficiariesDataForm2.street2.$invalid && beneficiariesDataVM.isSubmited2 }">
							    	<label class="control-label" for="street2">Calle, número exterior y número interior *</label>
							        <div class="input-group">
							            <textarea class="form-control" id="street2" name="street2" 
							            data-ng-model="beneficiariesDataVM.data.street2"
							            data-ng-required ="beneficiariesDataVM.data.samedirection2=='NO'"
							            rows="4"></textarea>
							            <span class="input-group-addon">
							                <img alt="ok" class ="img-responsive" 
							                src="/payroll-agenda/statics/images/tablet/CHECK.png"
							                data-ng-show="!beneficiariesDataForm2.street2.$invalid">
							            </span>
							        </div>
							        <span class="control-label"
										data-ng-show="beneficiariesDataForm2.street2.$error.required && beneficiariesDataVM.isSubmited2">
										campo requerido!!
									</span>
									<span class="control-label"
										data-ng-show="!beneficiariesDataForm2.street2.$error.required && beneficiariesDataForm2.street2.$invalid && beneficiariesDataVM.isSubmited2">
										campo con formato invalido!!
									</span>
							    </div>
							</div>
							<br><br>
						</div>
						<div class="row" style="padding: 0px 30px;">
							<hr>
							<p><b>*</b> Campos mandatorios</p>
						</div>
						<div class="row" align="center">
							<a class="btn bcompleto btn-round-lg"
								ng-click="beneficiariesDataVM.submit2(beneficiariesDataForm.$valid,beneficiariesDataForm2.$valid)">&nbsp;&nbsp;&nbsp;&nbsp;Continuar&#09;&nbsp;&nbsp;&nbsp;</a>
						</div>
					</div>
				
</form>
			</div>
		</div>
	</div>

