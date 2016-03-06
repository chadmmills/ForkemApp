class UnassignMeal
  constructor: (@meal) ->
    @assignmentId = @meal.parents(".weekday-meals").data("assignment-id")
    @_unassignMeal()

  _unassignMeal: =>
    request = $.post "meal_assignments", id: @assignmentId, _method: "delete"
    request.error @_renderErrorMsg

  _renderErrorMsg: ->
    alert "Oops... there was an error encountered during that action.
      Please refresh the page and try again"


$(document).on "click", ".js-unassign", (e) -> new UnassignMeal($(e.target).parent('.meal'))
