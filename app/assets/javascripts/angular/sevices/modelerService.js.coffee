# app/assets/javascripts/angular/services/modelerService.js.coffee

@modelerApp.factory 'modelerService', ['Restangular', (Restangular) ->
	new class modelerService
		constructor: ->
			@restAngular = Restangular.withConfig((Configurer) -> Configurer.setBaseUrl('/api/v1'))

		getTables: () ->
			@restAngular.all('tables').getList()

		getDiagrams: () ->
			@restAngular.all('diagrams').getList()
]