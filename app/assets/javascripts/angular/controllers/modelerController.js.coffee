# app/assets/javascripts/angular/controllers/ModelerController.js.coffee

@modelerApp.controller 'modelerController', ['$scope', 'modelerService', ($scope, modelerService) ->
    modelerService.getTables().then((tables) -> $scope.tables = tables)
    modelerService.getDiagrams().then((diagrams) -> $scope.diagrams = diagrams)
    $scope.current_diagram_id = 1

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

    # Changes the Diagram displayed to be the one selected by the active tab
    $scope.changeActiveDiagram = (ind) ->
        angular.forEach($scope.diagrams, (value, key) ->
            if (key == ind)
                $scope.diagrams[key].active = true
                $("#diagram-" + ind).tab('show')
            else
                scope.diagrams[key].active = false
        )
]