<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="es">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="stylesheet" href="/payroll-agenda/statics/css/jquery-ui.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/signin.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/keyboard.css">
	<title>Single Sign On</title>
	<script type="text/javascript">
		function isConnected() {
			var urlLoc = window.location.href;
			var idx = urlLoc.search("payroll-agenda/") + 15;
			var url = urlLoc.substring(0, idx) + "statics/js/jquery-ui.js";

			try {
				var http = new XMLHttpRequest();
				http.open('HEAD', url, false);
				//http.send();
				$('#noConnection').modal('hide');
			} catch(err) {
				
				console.log("ya no hay conexion");
				$('#noConnection').modal();
			}
		
			setTimeout("isConnected()",1000);
		}
	</script>
</head>
<body onload="isConnected()" style="padding:0px; width: 100%; height: 100%;">
<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
<script src="/payroll-agenda/statics/js/jquery-ui.js"></script>
<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
<script src="/payroll-agenda/statics/js/jquery.keyboard.js"></script>
<script>
	$(document).ready(function() {
		var agent=navigator.userAgent;
		if (agent.indexOf('Android')==-1) {
			$('#userId').keyboard();
			$('#password').keyboard();
		}
	});
</script> 
	<div class="col-xs-12">
		<form class="form-signin " name="loginForm" action="/payroll-agenda/loginValidOld" method="post">
			<div class="form-padding2">
				<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoHSBCLogIn.png" class="img-responsive center-block">
				<h3 align="center">ACTIVA TU CLIENTE</h3><br><br>
			</div>
			<div class=" form-signin white shadow" >	
				<p class="headstyle" align="center">Bienvenido.</p>
				<p class="textstyle" align="center">Para iniciar sesión, ingresa tus datos de acceso</p>
				<br>
				<div class="form-group form-padding">
				    <label for="userId" class="textstyle form-focus">Tu número de registro</label>
				    
				    <div class="inner-addon left-addon">
				    	<span class="img-inside ">
				    		<img src="/payroll-agenda/statics/images/tablet/Iconousuario.png" style="height:25px;">
				    	</span>
				        <input style="font-size:100%" class="form-control form-focus" type="text" id="userId" name="userId" value=""
				             tabindex="1" maxlength="10" required  />
			         </div>	    
				</div>
				<div class="form-group form-padding">
				    <label for="password" class="textstyle form-focus">Escribe tu contraseña</label>
				    <div class="inner-addon left-addon">
				    	<span class="img-inside "> 
				    		<img src="/payroll-agenda/statics/images/tablet/Iconocontrasena.png" style="height:25px;">
				    	</span>
				        <input style="font-size:100%" class="form-control form-focus" type="password" id="password" name="password" value=""
				             tabindex="2" required />
				    </div>
				</div>
				<p class="headstyle-red" align="center">${error}</p>
				<br>
				<div class="text-center nopadding">
					<a align="center" class="btn btn-primary btn-round " href="#" role="button" onclick="$('#spinner').modal(); document.forms['loginForm'].submit();" tabindex="3">
						&nbsp;&nbsp;&nbsp;&nbsp;Iniciar&nbsp;&nbsp;&nbsp;&nbsp;
					</a>
				</div>
				<input type="hidden" name="origen" value="2">
				<br>
			</div>
		</form>
	</div>
	<div class="modal" id="spinner" data-backdrop="static"
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
    <%@ include file="modal.jsp" %>
</body>
</html>