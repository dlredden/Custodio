# app/assets/javascripts/angular/directives/ModelerDirectives.js.coffee

@modelerApp.directive 'resizable', ($window) ->
	($scope) ->
		$scope.initializeWindowSize = ->
			$scope.windowHeight = $window.innerHeight
			$scope.windowHeight -= angular.element('#header').height()
			$scope.windowHeight -= angular.element('#footer').height()
			$scope.windowHeight -= angular.element('#nav').height()
			$scope.windowWidth  = $window.innerWidth

		$scope.initializeWindowSize()

		angular.element($window).bind 'resize', ->
			$scope.initializeWindowSize()
			$scope.$apply()