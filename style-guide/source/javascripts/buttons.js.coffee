$ ->
  $('.btn').click (e) ->
    e.preventDefault()
    $(this).addClass('is-loading')
    window.setTimeout (=> $(this).removeClass('is-loading')), 1000
