class UnassignMeal
  constructor: (@meal) ->
    @assignmentId = @meal.parents(".weekday-meals").data("assignment-id")
    @_unassignMeal()

  _unassignMeal: =>
    request = $.post "/meal_assignments/#{@assignmentId}", _method: "delete"
    request.success @_removeMealFromHTML
    request.error @_renderErrorMsg

  _removeMealFromHTML: =>
    console.log "REMOVED?"
    console.log @meal
    @meal.remove()

  _renderErrorMsg: ->
    alert "Oops... there was an error encountered during that action.
      Please refresh the page and try again"


$(document).on "click", ".js-unassign", (e) ->
  new UnassignMeal($(e.target).parent('.meal'))
