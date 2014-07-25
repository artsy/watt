$ ->
  # TODO: We may show attributes other than name in future cases.
  $.ui.autocomplete.prototype._renderItem = (ul, item) ->
    $("<li><a>#{item.name}</a></li>").data("item.autocomplete", item).appendTo ul

  # Resize the menu width to be the same as the input width.
  $.ui.autocomplete.prototype._resizeMenu = ->
    ul = this.menu.element
    ul.outerWidth this.element.outerWidth()

  # On search, show the loading spinner and clear the hint.
  $('body').on 'autocompletesearch', '.ui-autocomplete-input', (event, ui) ->
    $(this).closest('.reactive-input').find('.form-control-help')
      .removeClass('panel').html ''
    $(this).closest('.reactive-input')
      .removeClass('no-result').addClass('is-loading')

  # On response, clear the loading spinner and show hint if no result.
  $('body').on 'autocompleteresponse', '.ui-autocomplete-input', (event, ui) ->
    if ui.content.length == 0 and $(this).closest('.reactive-input').hasClass 'is-loading'
      $(this).closest('.reactive-input').addClass 'no-result'
    $(this).closest('.reactive-input').removeClass 'is-loading'

  # On blur, clear the loading spinner and no result hint.
  $('body').on 'autocompletechange', '.ui-autocomplete-input', (event, ui) ->
    $(this).closest('.reactive-input').removeClass 'is-loading no-result'
