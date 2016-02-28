class Dragem
  constructor: ->
    @drake = @initializeDragula()

  initializeDragula: ->
    dragula
      isContainer: (el) => @_validateContainer(el)

  _validateContainer: (el) =>
    if el.id and @_isADraggableContainer(el)
      @_mealNotAssignedForContainer(el)
    else
      false

  _isADraggableContainer: (el) ->
    el.id in @_draggableIds

  _mealNotAssignedForContainer: (target) ->
    return true if target.id is "draggable-meals"
    $(target).find(".meal").length is 0

  _draggableIds:
    [
      "monday",
      "tuesday",
      "wednesday",
      "thursday",
      "friday",
      "saturday",
      "sunday",
      "draggable-meals",
    ]


$(document).on "ready page:load", ->
  new Dragem if $('.meals__available-list').length > 0
