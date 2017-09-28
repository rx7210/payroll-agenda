(function () {
    'use strict';
	angular.module('app', ['ui.router']);
	angular.module('app')
	.config(['$stateProvider','$urlRouterProvider', function($stateProvider, $urlRouterProvider){
		$urlRouterProvider.otherwise('/generalData');
		$stateProvider
			.state('generalData',{
				url:'/generalData',
				templateUrl : 'pages/tablet/generalData.jsp',
				controller : 'generalDataController',
				controllerAs : 'generalDataVM' 
			})
			.state('contactData',{
				url:'/contactData',
				templateUrl : 'pages/tablet/contactData.jsp',
				controller : 'contactDataController',
				controllerAs : 'contactDataVM' 
			})
			.state('beneficiariesData',{
				url:'/beneficiariesData',
				templateUrl : 'pages/tablet/beneficiariesData.jsp',
				controller : 'beneficiariesDataController',
				controllerAs : 'beneficiariesDataVM' 
			})
			.state('domiciliaryData',{
				url:'/domiciliaryData',
				templateUrl : 'pages/tablet/domiciliaryData.jsp',
				controller : 'domiciliaryDataController',
				controllerAs : 'domiciliaryDataVM' 
			})
			;
	}]);
	angular.module('app')
		.controller('addController',['$scope','$state','ADD',addControllerFunction ])
		.controller('generalDataController',['$scope','$state','$http','ADD',generalDataControllerFunction])
		.controller('domiciliaryDataController',['$scope','$state','$http','ADD',domiciliaryDataControllerFunction])
		.controller('contactDataController',['$scope','$state','$http','ADD',contactDataControllerFunction])
		.controller('beneficiariesDataController',['$scope','$state','$http','ADD',beneficiariesDataControllerFunction]);
	angular.module('app')
		.factory('ADD', ['$http',ADDFactoryFunction]);
})();