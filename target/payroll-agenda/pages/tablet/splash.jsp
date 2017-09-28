<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<script src="/payroll-agenda/statics/js/vendors.min.js"></script>
		<script src="/payroll-agenda/statics/js/main.min.js"></script>
		<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
		<script>
			$(document).ready(function() {
				setTimeout(function(){$("#formSplash").submit();},4000); 
			});
		</script> 
	</head>
	<body class="splash background-city-back">
		<main class="container">
			<section class="splash-block">
				<form id="formSplash" name="formSplash" action="/payroll-agenda/loginTabletAfter" method="post"></form>
				<div class=" splash-content">
		            <div class="box-logo">
		              <img class="responsive-img" src="/payroll-agenda/statics/images/tablet/logo-hsbc.png">
		            </div>
		            <p class="h3 splash-text">Payroll Digital Onboarding</p>
		        </div>
			</section>
		</main>
	</body>
</html>