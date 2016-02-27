class Dragem
  constructor: ->
    @drake = @initializeDragula()

  initializeDragula: ->
    dragula( @_draggableElements() )

  _draggableElements: =>
    @_draggableIds().map (id) ->
      document.getElementById(id)

  _draggableIds: ->
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


$(document).on "ready page:change", ->
  new Dragem if $('.meals__available-list').length > 0
