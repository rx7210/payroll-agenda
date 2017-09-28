var wrapper = document.getElementById("signature-pad"),
    clearButton = document.getElementById("clear"),
    cancelButton = document.getElementById("cancel"),
    acceptButton = document.getElementById("accept"),
    saveButton = document.getElementById("save"),
    canvas = wrapper.querySelector("canvas"),
    
    signaturePad;

signaturePad = new SignaturePad(canvas);

function resizeCanvas() {
	signaturePad.clear();
	var ratio =  Math.max(window.devicePixelRatio || 1, 1);
    canvas.width = canvas.offsetWidth * ratio;
    canvas.height = canvas.offsetHeight * ratio;
    canvas.getContext("2d").scale(ratio, ratio);
}

window.onresize = resizeCanvas;
resizeCanvas();

clearButton.addEventListener("click", function (event) {
    signaturePad.clear();
});

acceptButton.addEventListener("click", function (event) {
	if (signaturePad.isEmpty()) {
		bootbox.alert({
			message:'<div class="alert alert-dismissible alert-danger alert-hsbc">'+
			  			'<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">'+
			  			'<span>&nbsp;&nbsp;&nbsp;La firma no ha sido capturada</span>'+
		  			'</div>Por favor captura la firma e intenta nuevamente.'
				,
			buttons:{
				ok:{
					label:"Aceptar"
				}
			}
		});	
	}else{
		data = signaturePad.toDataURL('image/png');
		document.getElementById("previewimage").src=data;
		$("#encodedImage").val(signaturePad.toDataURL());
		document.getElementById("signButton").innerHTML= "Volver a Firmar";
		$('#previewimage').css('border','1px solid #56D27E');
		$('#signPad').modal('hide');
	}
});

saveButton.addEventListener("click", function (event) {
	var processing = $("#processing").val();
	if (processing){
		bootbox.alert({message:"Hay una solicitud en proceso, por favor espere",
			buttons:{ ok:{ label:"Aceptar" }}
		});
		
	} else {
		
		if (document.getElementById("previewimage").src=='') {
			bootbox.alert({
				message:'<div class="alert alert-dismissible alert-danger alert-hsbc">'+
				  			'<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">'+
				  			'<span>&nbsp;&nbsp;&nbsp;La firma no ha sido capturada</span>'+
			  			'</div>Por favor captura la firma e intenta nuevamente.'
					,
				buttons:{
					ok:{
						label:"Aceptar"
					}
				}
			});	
		}else{
			if(document.getElementById('termsAndConditions').checked){
				if(document.getElementById('globalStandars').checked){
					confirmSign ();
				}else{
					bootbox.alert({
						message:'<div class="alert alert-dismissible alert-danger alert-hsbc">'+
			  			'<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">'+
			  			'<span>&nbsp;&nbsp;&nbsp;No es posible continuar.</span>'+
		  			'</div><p align="center" style="font-size: 90%;">Formato de Global Standards de Cuentas Nómina no aceptado.</p>'
			  			,
						buttons:{ ok:{ label:"Aceptar" } }
					});
				}
			}else{
				bootbox.alert({
					message:'<div class="alert alert-dismissible alert-danger alert-hsbc">'+
		  			'<img src="/payroll-agenda/statics/images/errorsCritical.gif" style=" width: 45px;">'+
		  			'<span>&nbsp;&nbsp;&nbsp;No es posible continuar.</span>'+
	  			'</div>Terminos y condiciones no aceptados.',
					buttons:{ ok:{ label:"Aceptar" } }
				});	
			}
						
		}
		
	}

		
});

function confirmSign (){
	
	var before = '<div class="row nopadding" align="left">'+
	'<input type="checkbox" checked disabled"/>'+
	'<label>';
	var after ='</label><br>';
	
	var header 	=	'<img class="img-responsive center-block" alt="HSBC" src="/payroll-agenda/statics/images/tablet/HSBC_header_logo.png"><br>'+
					'<h4><b>CONFIRMACIÓN: FIRMAS</b></h4>Confirmo que el cliente ha aceptado el uso de sus firmas para los siguientes fines:<br><br>';
	var terms 	=	before+'Aceptación de Términos y Condiciones.'+after;
	var creditInfo 	=	before+'Autorización de Consulta de Información Crediticia.'+after;
	var marketing 	=	before+'Autorización de Mercadeo.'+after;
	var add			=	before+'Mantenimiento de Datos.'+after;
	var globalStandars =	before+'Aceptación Global Standards de Cuentas Nómina.'+after;
	
	var text = header+terms;
	if(document.getElementById('verifyInfo').checked){
		text = text+creditInfo;
	}
	if(document.getElementById('marketingAndPublicity').checked){
		text = text + marketing;
	}
	try{
		if(document.getElementById('add').checked){
			text = text + add;
		}
	}catch(exception){
		console.log("error ADD id no encontrado");
	}
	
	text = text+globalStandars;	
	
	bootbox.confirm({
		closeButton: false,
		animate:false,
		message: 	'<div align="center">'+ text+ '</div><br>',
		buttons: {	
			confirm: { label: '&nbsp;&nbsp;&nbsp;Regresar&nbsp;&nbsp;&nbsp;', className:'btn-lg btn-primary btn-round-lg marginR25 ' },
			cancel: { label: '&nbsp;&nbsp;&nbsp;Confirmar&nbsp;&nbsp;&nbsp;', className:'btn-lg bcompleto btn-round-lg marginR25'}
		},
		callback: function (result) {
			if (!result) {
				bootbox.hideAll();
				$('#spinner').modal();
      			var encodedSignature = signaturePad.toDataURL();
      			//Firma capturada para el contrato
      			$("#processing").val("true");
      			$("#saveSnapshotBtn").css({"opacity":"0.4","cursor": "not-allowed"});
      			$("#cleanSnapshotBtn").css({"opacity":"0.4","cursor": "not-allowed"});
      			$('#spinner').modal();
      			document.forms["formSignature"].submit();
			}
	
		}
	});
	
	
}
