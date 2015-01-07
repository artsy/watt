$ ->
  # Show the loading spinner on a button when it is used to make an AJAX call.
  $('body').on('ajax:send', '[data-remote="true"]', (event, xhr) ->
    tagName = event.target.tagName.toLowerCase()
    # The button is either a submit button in a form or a link with data-remote=true
    $btn = if tagName is 'form' then $(event.target).find('[type="submit"]') else $(event.target)
    $btn.addClass 'is-loading'
  )

  # Restore the button state after the AJAX call is complete.
  $('body').on('ajax:complete', '[data-remote="true"]', (event, xhr, status) ->
    tagName = event.target.tagName.toLowerCase()
    $btn = if tagName is 'form' then $(event.target).find('[type="submit"]') else $(event.target)
    $btn.removeClass 'is-loading'
  )
