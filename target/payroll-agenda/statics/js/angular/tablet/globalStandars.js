var app = angular.module('globalStandars', []);
app.controller('globalStandarsController', function($scope,$http) {
	globalStandarsVM=this;
	globalStandarsVM.data={};
	globalStandarsVM.data.deposito="0";
	globalStandarsVM.data.txnInter="0";
	globalStandarsVM.data.cambioPais="0";
	globalStandarsVM.isSubmited=false;
	globalStandarsVM.submit = function(valid){
		console.log("llega");
		globalStandarsVM.isSubmited=true;
		if(valid && globalStandarsVM.data.deposito!=undefined && globalStandarsVM.data.txnInter!=undefined && 
				globalStandarsVM.data.cambioPais!=undefined){
			if((globalStandarsVM.data.txnInter=='1' && globalStandarsVM.data.txnInterSancion!=undefined ) || 
					globalStandarsVM.data.txnInter=='0'){
				send();
			}
		}
	};
	function send(){
		$('#spinner').modal();
		document.forms['globalStandarsForm'].submit(); 
	}
});