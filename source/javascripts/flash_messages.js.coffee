$ ->
  $('.flash-demo').click( ->
    $(this).addClass('is-loading')
    window.setTimeout (=> $(this).removeClass('is-loading')), 1000
    $($(this).data('target')).removeClass('hidden')
    false
  )

  $(".flash-wrap, .flash-wrap a").on('click', (e) ->
    $('.flash-wrap').parent().parent().addClass('hidden')
    false
  )
