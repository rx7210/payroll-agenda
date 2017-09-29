<div id="msg-black-shadow" class="right-black-shadow"></div>
<section id="message-cont-conexion" class="row s12 message-content white-square-bloq 	">
			<div class=" msg-text ">
				<p class="h4 fond-red">No hay conexión a internet</p>
				<p class="h5">Se trabajará en modo offline y los datos capturados se enviarán cuando este dispositivo esté conectado a la red 
			</div>
<!-- 			<div id="msg-close" class="col s3 msg-close "> -->
<!-- 				<i class="icon icon-logo-close"></i> -->
<!-- 			</div> -->
</section>
<section id="loading"class="loading">
	<div class="loading-block">
		<div class="img-container">
			<img class="img"src="/payroll-agenda/statics/images/tablet/HSBC_loading.png">
		</div>
		<p class="h3 loading-text">Cargando todos tus datos...</p>
	</div>
</section>
		

<script>
var messages = {		
		  openMessageFailConnection : function (){
			$("#msg-black-shadow").animate({width:"100%"},0);
			$("#message-cont-conexion").animate({top:"0"},50);	
			setTimeout(messages.validateConnection,1000); 
		},closeMessageFailConnection: function () {
			$("#msg-black-shadow").animate({width:"0%"},0);
	        $("#message-cont-conexion").animate({top:"-165px"},50);
	        setTimeout(messages.validateConnection,1000); 
	    },validateConnection : function (){
	    	if(navigator.onLine){
	    		messages.closeMessageFailConnection();
	    	}else{
	    		messages.openMessageFailConnection(); 
	    	}
	    },openLoading: function (){
	    	$("#loading").animate({width:"100%"},0);
	    }
};



$("#msg-close").click(messages.closeMessageFailConnection);
$("#msg-black-shadow").click(messages.closeMessageFailConnection);
setTimeout(messages.validateConnection,1000); 
</script>