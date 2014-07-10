$ ->
  $('.btn').click( ->
    $(this).addClass('is-loading')
    window.setTimeout (=> $(this).removeClass('is-loading')), 1000
    false
  )
