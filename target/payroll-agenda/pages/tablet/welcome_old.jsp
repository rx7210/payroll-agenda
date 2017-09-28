<!DOCTYPE HTML>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<html lang="es">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="stylesheet" href="/payroll-agenda/statics/css/bootstrap.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/css/signin.css">
	<link rel="stylesheet" href="/payroll-agenda/statics/js/shortcut.js">
	<title>Agenda</title>
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
				$('#noConnection').modal();
			}
		
			setTimeout("isConnected()",1000);
		}
	</script>
</head>
<body onload="isConnected()" style="padding:0px; width: 100%; height: 100%;">
<script src="/payroll-agenda/statics/js/jquery-1.12.4.js"></script>
<script src="/payroll-agenda/statics/js/bootstrap.js"></script>
	<div class="col-xs-12">
	
		<form id="formInicio" class="form-signin " name="loginForm" action="/payroll-agenda/homeAgendaOld" method="post">
			<div class="form-padding2">
				<img alt="HSBC" src="/payroll-agenda/statics/images/tablet/LogoHSBCLogIn.png" class="img-responsive center-block"><br><br>
			</div>
			<div class=" form-signin white shadow">
				<div class="form-padding2">
					<img alt="tablet" src="/payroll-agenda/statics/images/tablet/OnBoarding.png" class="img-responsive center-block">
				</div>
				<div>
					<p class="headstyle" align="center">Tu mejor aliado</p>
					<div class="center-block" style="width: 320px;">
						<p class="textstyle">
							<img alt="" src="/payroll-agenda/statics/images/tablet/CHECK.png">
							&nbsp;Te facilita la vida.<br>
							<img alt="" src="/payroll-agenda/statics/images/tablet/CHECK.png">
							&nbsp;Menos trabajo posterior.<br>
							<img alt="" src="/payroll-agenda/statics/images/tablet/CHECK.png">
							&nbsp;Automatiza tus Reportes.<br>
							<img alt="" src="/payroll-agenda/statics/images/tablet/CHECK.png">
							&nbsp;Menos papel.
						</p>
						<br>
						<div class="text-center nopadding">
							<a align="center" class="btn btn-primary btn-round " href="#" role="button" onclick="$('#spinner').modal();document.forms['formInicio'].submit();">
								&nbsp;&nbsp;&nbsp;&nbsp;Comenzar&nbsp;&nbsp;&nbsp;&nbsp;
							</a>
							<br>
						</div>
					</div>						
				</div>
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
