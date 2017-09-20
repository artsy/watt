$ ->
  $(document).on 'click', '.btn.is-loading', (e) ->
    e.preventDefault()
    e.stopImmediatePropagation()
    false
