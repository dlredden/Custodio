# app/assets/javascripts/angular/services/modelerService.js.coffee

@modelerApp.factory 'modelerService', ['Restangular', (Restangular) ->
	new class modelerService
		constructor: ->
			@restAngular = Restangular.withConfig((Configurer) -> Configurer.setBaseUrl('/api/v1'))

		getTables: ($scope) ->
			@restAngular.all('tables').getList().then((results) -> $scope.tables = results)
]