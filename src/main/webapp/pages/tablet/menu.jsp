<div id="left-white-shadow" class="left-white-shadow" ></div>
  	
<section id="left-menu" class="left-menu"> 
	<div id="lm-dark-cont" class="lm-dark-cont">
	<form id="menu-form" method="post">  
		<div class="lm-up">
			<div id="lm-close" class="lm-close">
				<i class="icon icon-error"></i>
			</div>
			<div class="lm-logo">
				<img src="/payroll-agenda/statics/images/tablet/logo-hsbc-white.png">
			</div>
		</div>
		<div class="lm-middle">
			<ul class="lm-list">
				<li>
					<a id="lm-link-agenda" class="lm-link">
						<i class="icon icon-today"></i>
						<span>Mi agenda y actividades</span>
					</a>
				</li>
				<li>
					<a class="lm-link">
						<i class="icon icon-twins"></i>
						<span>Mi perfil</span>
					</a>
				</li>
				<li>
					<a class="lm-link">
						<i class="icon icon-graduate"></i>
						<span>Mis cursos y capacitaciones</span>
					</a>
				</li>
				<li>
					<a class="lm-link">
						<i class="icon icon-help"></i>
						<span>Ayuda y soporte</span>
					</a>
				</li>
				<li>
					<a class="lm-link">
						<i class="icon icon-notifications"></i>
						<span>Notificaciones</span>
					</a>
				</li>
			</ul>
		</div>
		<div id="lm-down" class="lm-down" >
			<ul class="lm-list">
				<li>
					<a class="lm-link">
						<i class="icon icon-logout-1"></i>
						<span>Cerrar sesión</span> 
					</a>
				</li>
			</ul>
		</div>
		</form>	
	</div>
</section>
<script>
	menu_form = $("#menu-form");
	left_white_shadow=$('#left-white-shadow');	
   	left_menu=$('#left-menu');
   	lm_close=$("#lm-close");
   	
   	var openLeftMenu = function (){
   		left_white_shadow.animate({width:"100%"},0);
		left_menu.animate({left:'0px'},50);	
   	}
   	
   	var closeLeftMenu = function (){
		left_white_shadow.animate({width:"0"},0);
		left_menu.animate({left:'-340px'},0);
	}
   	
	left_white_shadow.click(closeLeftMenu);
	lm_close.click(closeLeftMenu);
   	
   	$("#lm-down").click(function (){
		messages.openLoading();
		menu_form.attr('action', '/payroll-agenda/exitAgenda');
		menu_form.submit();
	});
	
	$("#lm-link-agenda").click(function (){
		messages.openLoading();
		closeLeftContent();
		menu_form.attr('action', '/payroll-agenda/homeAgenda');
		menu_form.submit();
	});
</script>