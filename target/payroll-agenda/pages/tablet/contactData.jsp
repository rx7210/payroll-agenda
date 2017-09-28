
	<div class="col-xs-12 nopadding">
		<div class="col-xs-12 row nopadding shadow" style="background: #f9f9ff;">
			<div class="col-xs-2 col-md-1 nopadding">
				<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoBlue2.png" class="img-responsive center-block">
			</div>
			<div class="col-xs-2 col-md-1 hidetext" align="center">
				<a href="" class="link"
					data-ng-click="contactDataVM.back();">
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
				<h4 align="center">Tarea 4: Verificación y recolección de información de contacto</h4>
				<hr>
				<form name="contactDataForm">
					<div class="row">
					    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
					    	data-ng-class="{'has-error': contactDataForm.email.$invalid && contactDataVM.isSubmited }">
					    	<label class="control-label" for="email">Correo electrónico</label>
					        <div class="input-group">
					            <input class="form-control" id="email" name="email" type="text"
					            data-ng-pattern="/^[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}$/"
					            data-ng-model="contactDataVM.data.email"
					            style="text-transform: none;">
					            <span class="input-group-addon" >
					                <img alt="ok" class ="img-responsive" 
					                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                	data-ng-show="!contactDataForm.email.$invalid">
					            </span>
					        </div>
					        <span class="control-label"
								data-ng-show="contactDataForm.email.$error.required && contactDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!contactDataForm.email.$error.required && contactDataForm.email.$invalid && contactDataVM.isSubmited">
								campo con formato invalido!!
							</span>
					    </div>
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': contactDataForm.cellphone.$invalid && contactDataVM.isSubmited }">
					    	<label class="control-label" for="cellphone">Teléfono móvil **</label>
					        <div class="input-group">
					            <input class="form-control" id="cellphone" name="cellphone" type="text" 
					            min="1" max="9999999999"
								data-ng-model="contactDataVM.data.cellphone"
					            data-ng-pattern="/^[0-9]{10}/"
					            required>
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" 
					                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                	data-ng-show="!contactDataForm.cellphone.$invalid">
					            </span>
					        </div>
					         <span class="control-label"
								data-ng-show="contactDataForm.cellphone.$error.required && contactDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!contactDataForm.cellphone.$error.required && contactDataForm.cellphone.$invalid && contactDataVM.isSubmited">
								campo con formato invalido!!
							</span>
					    </div>
					</div>
					<div class="row">
					    <div class="form-group-padding col-xs-12 col-sm-6 col-md-6"
							data-ng-class="{'has-error': contactDataForm.homephone.$invalid && contactDataVM.isSubmited }">
					    	<label class="control-label" for="homephone">Teléfono de casa **</label>
					        <div class="input-group">
					            <input class="form-control" id="homephone" name="homephone" type="text"
					            min="1" max="9999999999" 
								data-ng-model="contactDataVM.data.homephone"
					            data-ng-pattern="/^[0-9]{10}/"
					            required>
					            <span class="input-group-addon">
					                <img alt="ok" class ="img-responsive" 
					                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
					                	data-ng-show="!contactDataForm.homephone.$invalid">
					            </span>
					        </div>
					         <span class="control-label"
								data-ng-show="contactDataForm.homephone.$error.required && contactDataVM.isSubmited">
								campo requerido!!
							</span>
							<span class="control-label"
								data-ng-show="!contactDataForm.homephone.$error.required && contactDataForm.homephone.$invalid && contactDataVM.isSubmited">
								campo con formato invalido!!
							</span>
					    </div>
						<div class="form-group-padding col-xs-12 col-sm-6 col-md-6">
						
							<div class=" col-xs-7 nopadding"
								data-ng-class="{'has-error': contactDataForm.workphone.$invalid && contactDataVM.isSubmited }">
						    	<label class="control-label" for="workphone">Teléfono de Oficina *</label>
						        <div class="input-group">
						            <input class="form-control" id="workphone" name="workphone" type="text" 
						            min="1" max="9999999999"
									data-ng-model="contactDataVM.data.workphone"
						            data-ng-pattern="/^[0-9]{10}/"
						            required>
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                	data-ng-show="!contactDataForm.workphone.$invalid">
						            </span>
						        </div>
						         <span class="control-label"
									data-ng-show="contactDataForm.workphone.$error.required && contactDataVM.isSubmited">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!contactDataForm.workphone.$error.required && contactDataForm.workphone.$invalid && contactDataVM.isSubmited">
									campo con formato invalido!!
								</span>
							</div>
							<div class=" col-xs-5 nopadding"
								data-ng-class="{'has-error': contactDataForm.extention.$invalid && contactDataVM.isSubmited }">
						    	<label class="control-label" for="extention">Extensión</label>
						        <div class="input-group">
						            <input class="form-control" id="extention" name="extention" type="text" 
						            min="1" max="999999"
									data-ng-model="contactDataVM.data.extention"
						            data-ng-pattern="/^[0-9]{1,6}/"
						            >
						            <span class="input-group-addon">
						                <img alt="ok" class ="img-responsive" 
						                	src="/payroll-agenda/statics/images/tablet/CHECK.png"
						                	data-ng-show="!contactDataForm.extention.$invalid">
						            </span>
						        </div>
						         <span class="control-label"
									data-ng-show="contactDataForm.extention.$error.required && contactDataVM.isSubmited">
									campo requerido!!
								</span>
								<span class="control-label"
									data-ng-show="!contactDataForm.extention.$error.required && contactDataForm.extention.$invalid && contactDataVM.isSubmited">
									campo con formato invalido!!
								</span>
							</div>
					    </div>
					</div>

					
					<div class="row" style="padding: 0px 30px;">
						<hr>
						<p><b>*</b> Campos mandatorios</p>
						<p><b>**</b> Campos condicionalmente obligatorios</p>
					</div>
					<div class="row" align="center">
						<a class="btn bcompleto btn-round-lg"
							ng-click="contactDataVM.submit(contactDataForm.$valid)">&nbsp;&nbsp;&nbsp;&nbsp;Continuar&#09;&nbsp;&nbsp;&nbsp;</a>
					</div>
				</form>
			</div>
		</div>
	</div>
