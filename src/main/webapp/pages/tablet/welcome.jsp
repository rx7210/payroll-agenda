<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<title>HSBC</title>
		<link rel="shortcut icon" 	href="/payroll-agenda/statics/images/tablet/favicon.ico">
		<link rel="stylesheet" 		href="/payroll-agenda/statics/css/style.css">
		<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
		<script src="/payroll-agenda/statics/js/vendors.min.js"></script>
		<script src="/payroll-agenda/statics/js/main.min.js"></script>
		<script>
		$(document).ready(function() {
			$("#btn-welcome").click(function (){
				messages.openLoading();
				$("#formInicio").submit();
			});
		});
		</script>
	</head>
	<body class="welcome background-city-back" onload=""> <!-- isConnected() -->
		<form id="formInicio"  name="loginForm" action="/payroll-agenda/homeAgenda" method="post">
			<main class="main-welcome container">
				<section class="row">

					<div class="col white-square-bloq z-depth-2 welcome-square">
						<div class="row on-w-box">
							<div class="col m7 l-side">
						     	
								<div class="r-box-logo">
									<img class="responsive-img" src="/payroll-agenda/statics/images/tablet/logo-hsbc.png" alt="">
								</div>
								<p class="h2">Tu mejor aliado</p>
								<p class="h4">Al utilizar Payroll encontrarás enormes beneficios en tu trabajo diario con menos preocupaciones.</p>
								       	
								<div class="r-box-btn cont-btn">
									<a id="btn-welcome" class="btn-welcome btn regular" onclick="document.forms['formInicio'].submit();"><span>Comienza a utilizarlo</span></a>
								</div>
							     	
							</div>
							<div class="col m5 r-side">
								<p class="h4">Tu trabajo siempre disponible y respaldado en línea</p>
								<img src="/payroll-agenda/statics/images/tablet/hand-tablet-welcome.png" class="responsive-img">	
							</div>
						</div>
					</div>
	    
				</section>
			</main>
		</form>
		<%@ include file="messages.jsp" %>
	</body>
</html>