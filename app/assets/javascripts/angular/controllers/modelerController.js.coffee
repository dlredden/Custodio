# app/assets/javascripts/angular/controllers/ModelerController.js.coffee

@modelerApp.controller 'modelerController', ['$scope', 'modelerService', ($scope, modelerService) ->
    modelerService.getTables().then((tables) -> $scope.tables = tables)
    modelerService.getDiagrams().then((diagrams) -> $scope.diagrams = diagrams)
    $scope.current_diagram_id = 1

    $scope.startItemCallback = (event, ui) ->
        console.log('You started draggin')

    $scope.stopItemCallback = (event, ui) ->
        console.log('Why did you stop draggin me?')

    $scope.dragItemCallback = (event, ui) ->
        console.log('hey, look I`m flying')

    $scope.dropItemCallback = (event, ui) ->
        console.log(event)
        console.log(ui)
    
    $scope.stopCanvasCallback = (event, ui) ->
        console.log('Why did you stop draggin me?')

    $scope.dragCanvasCallback = (event, ui) ->
        if (ui.position.top > 0)
            ui.position.top = 0
        
        maxtop = ui.helper.parent().height() - ui.helper.height()
        if ( ui.position.top < maxtop)
            ui.position.top = maxtop
        
        if ( ui.position.left > 0)
            ui.position.left = 0
        
        maxleft = ui.helper.parent().width() - ui.helper.width()
        if ( ui.position.left < maxleft)
            ui.position.left = maxleft

    $scope.dropCanvasCallback = (event, ui) ->
        console.log(event)
        console.log(ui)
        
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