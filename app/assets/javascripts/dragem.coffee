class Dragem
  constructor: ->
    @drake = @initializeDragula()
    @drake.on "drop", (el, target) => @_validateMealAssignment(el, target)
    @drake.on "over", (el, container) => @_showProperFeedback(el, container)
    

  initializeDragula: ->
    dragula
      containers: @_draggableContainerElements(),
      copy: true,

  _validateMealAssignment: (el, target) =>
    if target.id and @_isADraggableContainer(target)
      if @_mealAlreadlyAssignedForContainer(target)
        @drake.cancel(document.getElementById("draggable-meals"))
      else
        @_assignMeal(el, target)

  _assignMeal: (meal, weekday) ->
    weekday_id = weekday.getAttribute 'data-weekday-date'
    meal_id = meal.getAttribute 'data-meal-id'

    $.ajax
      method: "POST"
      url: weekday.getAttribute "data-assignment-url"
      data: 
        weekday_id:  weekday_id
        meal_id: meal_id
      succeess: (data) -> console.log data



  _showProperFeedback: (el, container) ->
    console.log $(container).find(".meal").length
      # $(container).find(".gu-transit").hide()

  _isADraggableContainer: (el) ->
    el.id in @_draggableIds

  _mealAlreadlyAssignedForContainer: (target) ->
    return false if target.id is "draggable-meals"
    $(target).find(".meal").length > 1

  _draggableContainerElements: ->
    document.getElementById(id) for id in @_draggableIds

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
