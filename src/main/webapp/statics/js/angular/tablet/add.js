function addControllerFunction ($scope,$state,ADD){
	 addControllerVM= this;
	addControllerVM.ADD = ADD.getADD();
	var urlCP ='';
	var ledoCivil =[];
	$state.go('generalData');
}

function generalDataControllerFunction ($scope,$state,$http,ADD){
	$('#proccess').modal('hide');
	generalDataVM=this;
	generalDataVM.ADD = ADD.getADD();
	generalDataVM.data=generalDataVM.ADD.generalData;
	generalDataVM.statusList='Casado_Divorciado_Separado_Soltero_Unión Libre_Viudo'.split('_');
	generalDataVM.states='Aguascalientes_Baja California_Baja California Sur_Campeche_Coahuila_Colima_Chiapas_Chihuahua_distrito federal_Ciudad de Mexico_Durango_Guanajuato_Guerrero_Hidalgo_Jalisco_Mexico_Michoacan_Morelos_Nayarit_Nuevo Leon_Oaxaca_Puebla_Queretaro_Quintana Roo_San Luis Potosi_Sinaloa_Sonora_Tabasco_Tamaulipas_Tlaxcala_Veracruz_Yucatan_Zacatecas'.split('_');
	generalDataVM.isSubmited=false;
	generalDataVM.data.birthcountry="MEXICO";
	generalDataVM.data.nationality="MEXICO";
	generalDataVM.data.citinzenship="MEXICO";
	
	
	generalDataVM.searchData = function(){
		if(generalDataVM.data.name==null || generalDataVM.data.name==undefined){
			$('#proccess').modal();
			$http.post("/payroll-agenda/DatosAdd/"+$('#accountClient').val())
			.success(function(response) {
				console.log("****Respuesta datos  ADD " + JSON.stringify(response));
	
				generalDataVM.data= response.datGen;
				generalDataVM.ADD.generalData = response.datGen;
				generalDataVM.ADD.domiciliaryData  = response.datDomi;
				generalDataVM.ADD.contactData = response.datContra;
				urlCP=generalDataVM.data.urlCP;
				ledoCivil=generalDataVM.data.ledoCivil;
				generalDataVM.statusList=ledoCivil;
				generalDataVM.data.birthcountry="MEXICO";
				generalDataVM.data.nationality="MEXICO";
				generalDataVM.data.citinzenship="MEXICO";
				ADD.setADD (generalDataVM.ADD);
				$('#proccess').modal('hide');
			})
			.error(function(response){
				console.log("****Respuesta incorrecta  datos ADD " + JSON.stringify(response));
				$('#proccess').modal('hide');
			}); 
		}
	};
	
	generalDataVM.submit = function(valid){
		console.log("llega");
		generalDataVM.isSubmited=true;
		if(valid){
			$('#proccess').modal();
			generalDataVM.ADD.generalData = generalDataVM.data;
			ADD.setADD (generalDataVM.ADD);
			$state.go('domiciliaryData');
		}
	}
	
	$(function() {
		$('.datepicker').bootstrapMaterialDatePicker({ 
			format : 'DD/MM/YYYY',
			maxDate : new Date(), 
		    clearText: 'Limpar',
			time: false 
		});
	});

}

function beneficiariesDataControllerFunction($scope,$state,$http,ADD) {
	$('#proccess').modal('hide');
	beneficiariesDataVM=this;
	beneficiariesDataVM.ADD = ADD.getADD();
	beneficiariesDataVM.ADDColonies = ADD.getColonies();
	
	beneficiariesDataVM.flagPane=true;
	beneficiariesDataVM.colonies1=beneficiariesDataVM.ADDColonies.coloniesBenefector1;
	beneficiariesDataVM.colonies2=beneficiariesDataVM.ADDColonies.coloniesBenefector2;
	beneficiariesDataVM.data=beneficiariesDataVM.ADD.beneficiariesData;
	beneficiariesDataVM.isSubmited=false;
	beneficiariesDataVM.isSubmited2=false;
	beneficiariesDataVM.flagBen2 = false;
	
	beneficiariesDataVM.beneficiary2 = function(valid){
		beneficiariesDataVM.isSubmited=true;
		if(valid){
			beneficiariesDataVM.flagPane=false;
			beneficiariesDataVM.flagBen2 = true;
			beneficiariesDataVM.ADD.beneficiariesData=beneficiariesDataVM.data;
			ADD.setADD(beneficiariesDataVM.ADD);
			
		}
	}
	beneficiariesDataVM.submit = function(valid){
		console.log(valid);
		
		beneficiariesDataVM.isSubmited=true;
		if(valid){
			beneficiariesDataVM.ADD.beneficiariesData=beneficiariesDataVM.data;
			ADD.setADD(beneficiariesDataVM.ADD);
			if(parseInt(beneficiariesDataVM.data.percentage1)==100){
				$('#proccess').modal();
				beneficiariesDataVM.ADD.beneficiariesData=beneficiariesDataVM.data;
				ADD.setADD(beneficiariesDataVM.ADD);
				beneficiariesDataVM.finalData={
						datGen:beneficiariesDataVM.ADD.generalData,
						datDomi:beneficiariesDataVM.ADD.domiciliaryData,
						datContra:beneficiariesDataVM.ADD.contactData,
						datBene:beneficiariesDataVM.ADD.beneficiariesData
				}
				$http.post("/payroll-agenda/saveAdd",beneficiariesDataVM.finalData)
				.success(function(response) {
					console.log("Respuesta correcta ADD " + JSON.stringify(response));
					$('#proccess').modal('hide');
					document.forms['formADD'].action='/payroll-agenda/globalStandard';
					
					document.forms['formADD'].submit();
				})
				.error(function(response){
					console.log("Respuesta incorrecta ADD " + JSON.stringify(response));
					$('#proccess').modal('hide');
					bootbox.alert({message:"No es posible continuar, intenta nuevamente.",
						buttons:{ ok:{ label:"Aceptar" }}
					});
				}); 
				
			}else{
				bootbox.alert({message:"El porcentaje del beneficiario debe de ser 100%.",
					buttons:{ ok:{ label:"Aceptar" }}
				});
			}
		}
	}
	beneficiariesDataVM.submit2 = function(valid,valid2){
		console.log('entra al submit 2');
		console.log(valid);
		console.log(valid2);
		beneficiariesDataVM.isSubmited2=true;
		if(valid){
			if(valid2){
				if(parseInt(beneficiariesDataVM.data.percentage1)+parseInt(beneficiariesDataVM.data.percentage2)==100){
					$('#proccess').modal();
					beneficiariesDataVM.ADD.beneficiariesData=beneficiariesDataVM.data;
					ADD.setADD(beneficiariesDataVM.ADD);
					beneficiariesDataVM.finalData={
							datGen:beneficiariesDataVM.ADD.generalData,
							datDomi:beneficiariesDataVM.ADD.domiciliaryData,
							datContra:beneficiariesDataVM.ADD.contactData,
							datBene:beneficiariesDataVM.ADD.beneficiariesData
					}
					$http.post("/payroll-agenda/saveAdd",beneficiariesDataVM.finalData)
					.success(function(response) {
						console.log("Respuesta correcta ADD " + JSON.stringify(response));
						$('#proccess').modal('hide');
						document.forms['formADD'].action='/payroll-agenda/globalStandard';
						
						document.forms['formADD'].submit();
					})
					.error(function(response){
						console.log("Respuesta incorrecta ADD " + JSON.stringify(response));
						$('#proccess').modal('hide');
						bootbox.alert({message:"No es posible continuar, intenta nuevamente.",
							buttons:{ ok:{ label:"Aceptar" }}
						});
					}); 
					
				}else{
					bootbox.alert({message:"Revisa los porcentajes de los beneficiarios, ambos deben sumar 100%.",
						buttons:{ ok:{ label:"Aceptar" }}
					});
				}
				
			}else{
				bootbox.alert({message:"El beneficiario 2 no cumple con todos los campos requeridos.",
					buttons:{ ok:{ label:"Aceptar" }}
				});
				
			}
		}else{
			beneficiariesDataVM.flagPane=true;
			bootbox.alert({message:"El beneficiario 1 no cumple con todos los campos requeridos.",
				buttons:{ ok:{ label:"Aceptar" }}
			});
		}
	}
	beneficiariesDataVM.back = function (){
		$('#proccess').modal();
		$state.go('contactData');
	}
	beneficiariesDataVM.searchCP= function(postalCode,benefact){
		$('#proccess').modal();
		console.log(urlCP);
		$http.post(urlCP,'{"cp":"'+postalCode+'"}')
		.success(function(response){
			
			$('#proccess').modal('hide');
			if(response.length >0){
				if(benefact==1){
					beneficiariesDataVM.colonies1=[];
					if(response[0].desCiudad!=null && response[0].desCiudad!=''){
						beneficiariesDataVM.data.city1 = response[0].desCiudad;
					}else{
						beneficiariesDataVM.data.city1=' ';
					}
					beneficiariesDataVM.data.state1= response[0].desEstado;
					beneficiariesDataVM.data.municipality1 = response[0].desDelegMpio;
					for (var cp in response) {
						  temp={localidad:''}
						  temp.localidad=response[cp].desColonia;
						  beneficiariesDataVM.colonies1.push(temp);
					}
					beneficiariesDataVM.data.colony1='';
					beneficiariesDataVM.ADDColonies.coloniesBenefector1 = beneficiariesDataVM.colonies1;
					ADD.setColonies(beneficiariesDataVM.ADDColonies);
				}else{
					beneficiariesDataVM.colonies2=[];
					if(response[0].desCiudad!=null && response[0].desCiudad!=''){
						beneficiariesDataVM.data.city2 = response[0].desCiudad;
					}else{
						beneficiariesDataVM.data.city2=' ';
					}
					beneficiariesDataVM.data.state2= response[0].desEstado;
					beneficiariesDataVM.data.municipality2 = response[0].desDelegMpio;
					for (var cp in response) {
						  temp={localidad:''}
						  temp.localidad=response[cp].desColonia;
						  beneficiariesDataVM.colonies2.push(temp);
					}
					beneficiariesDataVM.data.colony2='';
					beneficiariesDataVM.ADDColonies.coloniesBenefector2 = beneficiariesDataVM.colonies2;
					ADD.setColonies(beneficiariesDataVM.ADDColonies);
				}
					
			}else{
				bootbox.alert({message:"El código postal ingresado no existe.",
					buttons:{ ok:{ label:"Aceptar" }}
				});
				if(benefact==1){
					beneficiariesDataVM.data.city1='';
					beneficiariesDataVM.data.state1= '';
					beneficiariesDataVM.data.municipality1=''
					beneficiariesDataVM.data.colony1='';
				}else{
					beneficiariesDataVM.data.city2='';
					beneficiariesDataVM.data.state2= '';
					beneficiariesDataVM.data.municipality2=''
					beneficiariesDataVM.data.colony2='';
				}
			}
			
		})
		.error(function(response){
				$http.post("/payroll-agenda/codigoPostal/"+postalCode)
					.success(function(response) {
						if(response.respuesta=='Codigo Correcto'){
							if(benefact==1){
								beneficiariesDataVM.data.state1 = response.estado;
								if(response.ciudad!=null){
									beneficiariesDataVM.data.city1 = response.ciudad;
								}else{
									beneficiariesDataVM.data.city1=' ';
								}
								beneficiariesDataVM.data.municipality1= response.municipio;
								beneficiariesDataVM.colonies1 = response.localidad;
								beneficiariesDataVM.data.colony1='';
								beneficiariesDataVM.ADDColonies.coloniesBenefector1 = beneficiariesDataVM.colonies1;
								ADD.setColonies(beneficiariesDataVM.ADDColonies);
							}else{
								beneficiariesDataVM.data.state2 = response.estado;
								if(response.ciudad!=null){
									beneficiariesDataVM.data.city2 = response.ciudad;
								}else{
									beneficiariesDataVM.data.city2=' ';
								}
								beneficiariesDataVM.data.municipality2 = response.municipio;
								beneficiariesDataVM.colonies2 = response.localidad;
								beneficiariesDataVM.data.colony2='';
								beneficiariesDataVM.ADDColonies.coloniesBenefector2 = beneficiariesDataVM.colonies2;
								ADD.setColonies(beneficiariesDataVM.ADDColonies);
							}
							$('#proccess').modal('hide');
					}else{
						$('#proccess').modal('hide');
						bootbox.alert({message:"El código postal ingresado no existe.",
							buttons:{ ok:{ label:"Aceptar" }}
						});
						domiciliaryDataVM.data.city='';
						domiciliaryDataVM.data.state= '';
						domiciliaryDataVM.data.municipality=''
						domiciliaryDataVM.data.colony='';
					}
		
					})
					.error(function(response){
						if(benefact==1){
							beneficiariesDataVM.colonies1=[];
							beneficiariesDataVM.data.city1='';
							beneficiariesDataVM.data.state1= '';
							beneficiariesDataVM.data.municipality1=''
							beneficiariesDataVM.data.colony1='';
						}else{
							beneficiariesDataVM.colonies2=[];
							beneficiariesDataVM.data.city2='';
							beneficiariesDataVM.data.state2= '';
							beneficiariesDataVM.data.municipality2=''
							beneficiariesDataVM.data.colony2='';
						}
						console.log("respuesta E " + JSON.stringify(response));
						$('#proccess').modal('hide');
					});
		});
	
	}
	
	$(function() {
		$('.datepicker').bootstrapMaterialDatePicker({ 
			format : 'DD/MM/YYYY',
			maxDate : moment().subtract(18, 'years'), 
		    clearText: 'Limpar',
			time: false 
		});
	});
	

}

function contactDataControllerFunction($scope,$state,$http,ADD) {
	$('#proccess').modal('hide');
	contactDataVM=this;
	contactDataVM.ADD = ADD.getADD();
	contactDataVM.data=contactDataVM.ADD.contactData;
	contactDataVM.isSubmited=false;
	contactDataVM.back = function(){
		$('#proccess').modal();$state.go('domiciliaryData');
	}
	contactDataVM.submit = function(valid){
		console.log("llega");
		contactDataVM.isSubmited=true;
		if(valid){
			
			contactDataVM.ADD.contactData = contactDataVM.data;
			ADD.setADD(contactDataVM.ADD);
			bootbox.confirm({
				closeButton: false,
				animate:false,
				message: 	'<h3 align="center">¿Deseas agregar beneficiarios a esta cuenta?</h3>',
				buttons: {	
					confirm: { label: '&nbsp;&nbsp;&nbsp;NO&nbsp;&nbsp;&nbsp;', className:'btn btn-primary btn-round-lg marginR25 ' },
					cancel: { label: '&nbsp;&nbsp;&nbsp;SI&nbsp;&nbsp;&nbsp;', className:'btn bcompleto btn-round-lg marginR25'}
				},
				callback: function (result) {
					if (!result) {
						bootbox.hideAll();
						$('#proccess').modal();
						$state.go('beneficiariesData');
					}else{
						$('#proccess').modal();
						contactDataVM.finalData={
								datGen:contactDataVM.ADD.generalData,
								datDomi:contactDataVM.ADD.domiciliaryData,
								datContra:contactDataVM.ADD.contactData,
								datBene:{}
						}
						$http.post("/payroll-agenda/saveAdd",contactDataVM.finalData)
						.success(function(response) {
							console.log("Respuesta correcta ADD " + JSON.stringify(response));
							$('#proccess').modal('hide');
							document.forms['formADD'].action='/payroll-agenda/globalStandard';
							
							document.forms['formADD'].submit();
						})
						.error(function(response){
							console.log("Respuesta incorrecta ADD " + JSON.stringify(response));
							$('#proccess').modal('hide');
							bootbox.alert({message:"No es posible continuar, intenta nuevamente.",
								buttons:{ ok:{ label:"Aceptar" }}
							});
						}); 
					}
			
				}
			});
			
			
		}
	}
}

function domiciliaryDataControllerFunction($scope,$state,$http,ADD) {
	$('#proccess').modal('hide');
	domiciliaryDataVM=this;
	domiciliaryDataVM.ADD = ADD.getADD();
	domiciliaryDataVM.ADDColonies = ADD.getColonies();
	domiciliaryDataVM.data=domiciliaryDataVM.ADD.domiciliaryData;
	domiciliaryDataVM.colonies=domiciliaryDataVM.ADDColonies.coloniesClient;
	domiciliaryDataVM.isSubmited=false;
	domiciliaryDataVM.countries = $('#listCountries').val();
	console.log(domiciliaryDataVM.countries);
	domiciliaryDataVM.countries = domiciliaryDataVM.countries.split("|");
	domiciliaryDataVM.submit = function(valid){
		console.log("llega");
		domiciliaryDataVM.isSubmited=true;
		if(valid){
			$('#proccess').modal();
			domiciliaryDataVM.ADD.domiciliaryData = domiciliaryDataVM.data;
			ADD.setADD (domiciliaryDataVM.ADD);
			$state.go('contactData');
		}
	}
	domiciliaryDataVM.back = function(){
		$('#proccess').modal();$state.go('generalData');
	}
	
	domiciliaryDataVM.searchCP= function(postalCode){
		$('#proccess').modal();
		$http.post(urlCP,'{"cp":"'+postalCode+'"}')
			.success(function(response){
				domiciliaryDataVM.colonies=[];
				$('#proccess').modal('hide');
				if(response.length >0){
					if(response[0].desCiudad!=null && response[0].desCiudad!=''){
						domiciliaryDataVM.data.city = response[0].desCiudad;
					}else{
						domiciliaryDataVM.data.city=' ';
					}
					domiciliaryDataVM.data.state= response[0].desEstado;
					domiciliaryDataVM.data.municipality = response[0].desDelegMpio;
					for (var cp in response) {
						  temp={localidad:''}
						  temp.localidad=response[cp].desColonia;
						  domiciliaryDataVM.colonies.push(temp);
					}
					domiciliaryDataVM.data.colony='';
					domiciliaryDataVM.ADDColonies.coloniesClient = domiciliaryDataVM.colonies;
					ADD.setColonies(domiciliaryDataVM.ADDColonies);
				}else{
					bootbox.alert({message:"El código postal ingresado no existe.",
						buttons:{ ok:{ label:"Aceptar" }}
					});
					domiciliaryDataVM.data.city='';
					domiciliaryDataVM.data.state= '';
					domiciliaryDataVM.data.municipality=''
					domiciliaryDataVM.data.colony='';
				}
				
			})
			.error(function(response){
				alert(response);
				$http.post("/payroll-agenda/codigoPostal/"+postalCode)
				.success(function(response) {
					if(response.respuesta=='Codigo Correcto'){
						domiciliaryDataVM.data.state = response.estado;
						if(response.ciudad!=null){
							domiciliaryDataVM.data.city = response.ciudad;
						}else{
							domiciliaryDataVM.data.city=' ';
						}
						domiciliaryDataVM.data.municipality= response.municipio;
						domiciliaryDataVM.colonies = response.localidad;
						domiciliaryDataVM.data.colony='';
						domiciliaryDataVM.ADDColonies.coloniesClient = domiciliaryDataVM.colonies;
						ADD.setColonies(domiciliaryDataVM.ADDColonies);
						$('#proccess').modal('hide');
					}else{
						$('#proccess').modal('hide');
						bootbox.alert({message:"El código postal ingresado no existe.",
							buttons:{ ok:{ label:"Aceptar" }}
						});
						domiciliaryDataVM.data.city='';
						domiciliaryDataVM.data.state= '';
						domiciliaryDataVM.data.municipality=''
						domiciliaryDataVM.data.colony='';
					}

				})
				.error(function(response){
					console.log("respuesta E " + JSON.stringify(response));
					$('#proccess').modal('hide');
					domiciliaryDataVM.data.city='';
					domiciliaryDataVM.data.state= '';
					domiciliaryDataVM.data.municipality=''
					domiciliaryDataVM.data.colony='';
				});
			});
		
		
		
	
	}
	
	domiciliaryDataVM.searchCPINIT= function(){
		if(domiciliaryDataVM.data.colony!=null || domiciliaryDataVM.data.colony!=undefined){
			domiciliaryDataVM.colonies=[];
			temp={localidad:''}
			temp.localidad=domiciliaryDataVM.data.colony;
			domiciliaryDataVM.colonies.push(temp);
			
		}
	};
}

function ADDFactoryFunction($http){
	var ADD={
			generalData:{},
			contactData:{},
			domiciliaryData:{},
			beneficiariesData:{}
	};
	var colonies ={
			coloniesClient :[],
			coloniesBenefector1:[],
			coloniesBenefactor2:[]
	}
	return {
		getADD:function(){
			return ADD;
		},
		setADD:function(ADDS){
			ADD = ADDS;
		},
		getColonies:function(){
			return colonies;
		},
		setColonies:function(Colonies){
			colonies = Colonies;
		}
	}
}

