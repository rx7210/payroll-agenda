<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>HSBC</title>
    <link rel="shortcut icon" 	href="/payroll-agenda/statics/images/tablet/favicon.ico">
    <link rel="stylesheet" 		href="/payroll-agenda/statics/css/style.css">
    <link rel="stylesheet" href="/payroll-agenda/statics/css/keyboard.css">
    <link rel="stylesheet" href="/payroll-agenda/statics/css/jquery-ui.css">
    <script src="/payroll-agenda/statics/js/vendors.min.js"></script>
    <script src="/payroll-agenda/statics/js/main.min.js"></script>
    <script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
    <script src="/payroll-agenda/statics/js/jquery.keyboard.js"></script>
    <script src="/payroll-agenda/statics/js/jquery-ui.js"></script>
    <script src="src/main/webapp/statics/js/angular/angular-ui-router.js"></script>
    <script>
		$(document).ready(function() {
			var agent=navigator.userAgent;
			if (agent.indexOf('Android')==-1) {
				$('#userId').keyboard();
				$('#password').keyboard(); 
			}
		});
	</script>
  </head> 
  <body class="login background-city-back" onload=""> <!-- isConnected() -->
    <main class="main-login container">
      <section class="row">

        <div class="col s12 start-logo">
          <h1 title="HSBC">
            <div class="box-logo">
              <img class="responsive-img" src="/payroll-agenda/statics/images/tablet/logo-hsbc.png" alt="">
            </div>
          </h1>
        </div>

        <div class="white-square-bloq login-bloq">
          <p class="h2">Bienvenido</p>
          <p class="h5">Para iniciar sesión, ingresa tus datos de acceso</p>
          
          <form id="loginForm" novalidate="novalidate" name="loginForm" action="/payroll-agenda/loginValid" method="post">
            <div class="row">
              <div class="col m8 offset-m2 col s10 offset-s1">
              
                <div class="data-write">
                  <div class="input-field">
                    <input 	id="userId" class="input-box-login" type="text" name="userId" tabindex="1" maxlength="10" required placeholder="Número de registro">
                  </div>
                </div>

                <div class="data-write">
                  <div class="input-field">
                    <input id="password" class="input-box-login password-type" type="text" name="password" tabindex="2" required placeholder="Contraseña">
                  </div>
                </div>
                <div class="message-error">
                	<p class="font-red">${error}</p>
                </div>
                <div class="cont-btn">
                  <button class="btn-login btn regular" onclick="" id="btnSend" tabindex="3">Iniciar sessión</button>
                </div>
              </div>
              
            </div>
          </form>
        </div>
      </section>
    </main>
  </body>
</html>