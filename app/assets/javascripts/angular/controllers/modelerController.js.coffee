# app/assets/javascripts/angular/controllers/ModelerController.js.coffee

@modelerApp.controller 'modelerController', ['$scope', 'modelerService', ($scope, modelerService) ->
	modelerService.getTables($scope)

	$scope.startCallback = (event, ui) ->
        console.log('You started draggin')

    $scope.stopCallback = (event, ui) ->
        console.log('Why did you stop draggin me?')

    $scope.dragCallback = (event, ui) ->
        console.log('hey, look I`m flying')

    $scope.dropCallback = (event, ui) ->
        console.log(event)
        console.log(ui)

    $scope.overCallback = (event, ui) ->
        console.log('Look, I`m over you')

    $scope.outCallback = (event, ui) ->
        console.log('I`m not, hehe')

    $scope.top = "100px"
    $scope.left = "5px"


]