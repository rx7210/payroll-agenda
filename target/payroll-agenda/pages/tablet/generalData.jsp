
	<div class="col-xs-12 nopadding" ng-init="generalDataVM.searchData();">
		<div class="col-xs-12 row nopadding shadow" style="background: #f9f9ff;">
			<div class="col-xs-2 col-md-1 nopadding">
				<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png" class="img-responsive center-block">
			</div>
			<div class="col-xs-2 col-md-1 hidetext" align="center">
				<a href="#" class="link"
					onclick="$('#proccess').modal();document.forms['formADD'].action='/payroll-agenda/startIntegration'; document.forms['formADD'].submit();">
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
				<h4 align="center">Tarea 2: Verificación y recolección de información básica</h4>
				<hr>
				<form name="generalDataForm" id="generalDataForm">
					<div class="row">
					    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
					    	data-ng-class="{'has-error': generalDataForm.name.$invalid && generalDataVM.isSubmited }">
					    	<label class="control-label" for="name">Nombre Completo*</label>
					        <div class="input-group">
					            <input class="form-control" id="name" name="name" type="text"
					            data-ng-model="generalDataVM.data.name"
					            data-ng-pattern="/^[a-zA-ZáéíóúAÉÍÓÚÑñ ]+$/"
					            required >
					            <span class="input-group-addon" >
					                <img alt="ok" class ="img-responsive" 
					                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                	data-ng-show="!generalDataForm.name.$invalid">
					            </span>
					        </div>
					        <span class="control-label"
								data-ng-show="generalDataForm.name.$error.required && generalDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!generalDataForm.name.$error.required && generalDataForm.name.$invalid && generalDataVM.isSubmited">
								campo con formato invalido!!
							</span>
					    </div>
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': generalDataForm.firstname.$invalid && generalDataVM.isSubmited }">
					    	<label class="control-label" for="firstname">Apellido Completo*</label>
					        <div class="input-group">
					            <input class="form-control" id="firstname" name="firstname" type="text" 
								data-ng-model="generalDataVM.data.firstname"
					            data-ng-pattern="/^[a-zA-ZáéíóúAÉÍÓÚÑñ ]+$/"
					            required >
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" 
					                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                	data-ng-show="!generalDataForm.firstname.$invalid">
					            </span>
					        </div>
					         <span class="control-label"
								data-ng-show="generalDataForm.firstname.$error.required && generalDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!generalDataForm.firstname.$error.required && generalDataForm.firstname.$invalid && generalDataVM.isSubmited">
								campo con formato invalido!!
							</span>
					    </div>
					</div>
					<div class="row">
						<div class="form-group form-group-padding col-xs-12" >
							<div data-ng-class="{'has-error': generalDataVM.data.cambioNombre==undefined && generalDataVM.isSubmited}">
								<label class="control-label" for="cambioNombre">
									¿El cliente alguna vez ha cambiado de nombre? *
								</label><br>
								<input data-ng-model="generalDataVM.data.cambioNombre" value="0"
									type="radio" class="with-gap" id="NOcambioNombre" name="cambioNombre" 
									required
									data-ng-click />
								<label  for="NOcambioNombre">NO</label>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input data-ng-model="generalDataVM.data.cambioNombre"
									value="1" type="radio" class="with-gap" id="SIcambioNombre"
									name="cambioNombre" />
								<label for="SIcambioNombre">SI</label>
							</div>
							<span  style="color: #DD1F26"
								class="control-label"
								data-ng-show="generalDataVM.data.cambioNombre==undefined && generalDataVM.isSubmited">
								Campo requerido!! 
							</span>
						</div>
					</div>
					<div class="row" data-ng-show="generalDataVM.data.cambioNombre=='1'"
						style="background: #efefef;">
						<div class="form-group form-group-padding col-xs-12 col-md-6"
							data-ng-class="{'has-error': generalDataForm.oldName.$invalid && generalDataVM.isSubmited }">
							<label class="control-label" for="oldName">
								Nombre (s) anterior (es) *
							</label>
							<input class="form-control" id="oldName" name="oldName"
								type="text"
								data-ng-model="generalDataVM.data.oldName"
								data-ng-pattern ="/^[A-Za-z ]+$/"
								data-ng-required="generalDataVM.data.cambioNombre=='1'">
							<span class="control-label"
								data-ng-show="generalDataForm.oldName.$error.required && generalDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!generalDataForm.oldName.$error.required && generalDataForm.oldName.$invalid && generalDataVM.isSubmited">
								campo con formato invalido!!
							</span>
						</div>
						<div class="form-group form-group-padding col-xs-12 col-md-6"
							data-ng-class="{'has-error': generalDataForm.oldFirstName.$invalid && generalDataVM.isSubmited }">
							<label class="control-label" for="oldFirstName">
								Apellido (s) anterior (es) *
							</label>
							<input class="form-control" id="oldFirstName" name="oldFirstName"
								type="text"
								data-ng-model="generalDataVM.data.oldFirstName"
								data-ng-pattern ="/^[A-Za-z ]+$/"
								data-ng-required="generalDataVM.data.cambioNombre=='1'">
							<span class="control-label"
								data-ng-show="generalDataForm.oldFirstName.$error.required && generalDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!generalDataForm.oldFirstName.$error.required && generalDataForm.oldFirstName.$invalid && generalDataVM.isSubmited">
								campo con formato invalido!!
							</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': generalDataForm.curp.$invalid && generalDataVM.isSubmited }">
					    	<label class="control-label" for="curp">CURP*</label>
					        <div class="input-group">
					            <input class="form-control" id="curp" name="curp" type="text"
					            data-ng-model="generalDataVM.data.curp"
					            data-ng-pattern="/^([a-zA-Z]{4}[0-9]{6}[a-zA-Z]{6}[A-Za-z0-9]{2})$/"
					            required>
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" 
					                src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                data-ng-show="!generalDataForm.curp.$invalid">
					            </span>
					        </div>
					        <span class="control-label"
								data-ng-show="generalDataForm.curp.$error.required && generalDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!generalDataForm.curp.$error.required && generalDataForm.curp.$invalid && generalDataVM.isSubmited">
								campo con formato invalido!!
							</span>
					    </div>
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': (generalDataVM.data.civilstatus=='' || generalDataVM.data.civilstatus==undefined) && generalDataVM.isSubmited}">
							<label class="control-label" for="civilstatus">Estado civil*</label>
							<div class="input-group">
					            <select class="form-control" id="civilstatus" name="civilstatus"
					            	data-ng-model="generalDataVM.data.civilstatus"
					            	required>
					            	<option disabled selected value=""> Selecciona una opción</option>
									<option data-ng-repeat ="status in generalDataVM.statusList" value="{{status.toUpperCase()}}">{{status}}</option>
								</select>
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" 
					                src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                data-ng-show="!generalDataForm.civilstatus.$invalid">
					            </span>
					        </div>
					        <span style="color: #DD1F26" class="control-label"
								data-ng-show="generalDataForm.civilstatus.$error.required && generalDataVM.isSubmited">
								Campo requerido!!
							</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
						data-ng-class="{'has-error': generalDataForm.birthdate.$invalid && generalDataVM.isSubmited }">
					    	<label class="control-label" for="birthdate">Fecha de nacimiento*</label>
					        <div class="input-group">
					            <input class="datepicker form-control" id="birthdate" name="birthdate"
            						required
            						data-ng-model="generalDataVM.data.birthdate"
            						data-ng-pattern="/^([0-9]{2})\/([0-9]{2})\/([0-9]{4})/">
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" 
					                src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                data-ng-show="!generalDataForm.birthdate.$invalid">
					            </span>
					        </div>
					        <span class="control-label"
								data-ng-show="generalDataForm.birthdate.$error.required && generalDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!generalDataForm.birthdate.$error.required && generalDataForm.birthdate.$invalid && generalDataVM.isSubmited">
								campo con formato invalido!!
							</span>
				    	</div>

						<div class="form-group form-group-padding col-xs-12 col-sm-6 col-md-6" >
							<div 
								data-ng-class="{'has-error': generalDataVM.data.gender==undefined && generalDataVM.isSubmited}">
								<label class="control-label" for="gender2">Genero*</label><br>
								<input type="radio" class="with-gap" id="F" value="FEMENINO" name="gender" 
									data-ng-model="generalDataVM.data.gender"
									required
									data-ng-click/>
								<label for="F">F</label>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="with-gap" id="M" value="MASCULINO" name="gender" 
									data-ng-model="generalDataVM.data.gender"/>
								<label for="M">M</label>
							</div>
							 <span style="color: #DD1F26" class="control-label"
								data-ng-show="generalDataVM.data.gender==undefined && generalDataVM.isSubmited">
								Campo requerido!!
							</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': generalDataForm.rfc.$invalid && generalDataVM.isSubmited }">
					    	<label class="control-label" for="curp">RFC*</label>
					        <div class="input-group">
					            <input class="form-control" id="rfc" name="rfc" type="text"
					            data-ng-model="generalDataVM.data.rfc"
					            data-ng-pattern="/^([a-zA-Z]{4}[0-9]{6}(00[a-zA-Z1-9]|0[a-zA-Z1-9][a-zA-Z0-9]|[a-zA-Z1-9][a-zA-Z0-9][a-zA-Z0-9]))$/"
					            required>
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" 
					                src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                data-ng-show="!generalDataForm.rfc.$invalid">
					            </span>
					        </div>
					        <span class="control-label"
								data-ng-show="generalDataForm.rfc.$error.required && generalDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!generalDataForm.rfc.$error.required && generalDataForm.curp.$invalid && generalDataVM.isSubmited">
								campo con formato invalido!!
							</span>
					    </div>
					</div>
					<div class="row">
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6">
							<label class="control-label" for="countrybirth">País de nacimiento*</label>
							<div class="input-group" >
					            <select class="form-control" id="countrybirth" name="countrybirth" 
					            	data-ng-model="generalDataVM.data.birthcountry"
					            	disabled>
									<option value="MEXICO">MEXICO</option>
								</select>
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" src="/payroll-agenda/statics/images/tablet/CHECK.png">
					            </span>
					        </div>
						</div>
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6">
							<label class="control-label" for="entitybirth">Entidad federativa de nacimiento*</label>
							<div class="input-group">
					            <select class="form-control" id="entitybirth" name="entitybirth" 
					            	data-ng-model="generalDataVM.data.entiFede"
					            	>
									<option disabled selected value=""> Selecciona una opción</option>
									<option data-ng-repeat ="state in generalDataVM.states" value="{{state.toUpperCase()}}">{{state.toUpperCase()}}</option>
								</select>
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" src="/payroll-agenda/statics/images/tablet/CHECK.png">
					            </span>
					        </div>
						</div>
					</div>
					<div class="row">
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6">
							<label class="control-label" for="nationality">Nacionalidad*</label>
							<div class="input-group">
					            <select class="form-control" id="nationality" name="nationality" 
					            	data-ng-model="generalDataVM.data.nationality"
					            	disabled>
									<option value="MEXICO">MEXICO</option>
								</select>
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" src="/payroll-agenda/statics/images/tablet/CHECK.png">
					            </span>
					        </div>
						</div>
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6">
							<label class="control-label" for="citinzenship">Ciudadania*</label>
							<div class="input-group">
					            <select class="form-control" id="citinzenship" name="citinzenship"
					            	data-ng-model="generalDataVM.data.citinzenship"
					            	disabled >
									<option value="MEXICO">MEXICO</option>
								</select>
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" src="/payroll-agenda/statics/images/tablet/CHECK.png">
					            </span>
					        </div>
						</div>
					</div>
					<div class="row" style="padding: 0px 30px;">
						<p><b>*</b> Campos mandatorios</p>
					</div>
					<div class="row" align="center">
						<a class="btn bcompleto btn-round-lg"
							ng-click="generalDataVM.submit(generalDataForm.$valid)">&nbsp;&nbsp;&nbsp;&nbsp;Continuar&#09;&nbsp;&nbsp;&nbsp;</a>
					</div>
				</form>
			</div>
		</div>
	</div>
