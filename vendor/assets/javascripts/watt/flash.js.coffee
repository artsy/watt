$ ->
  $(".flash-wrap, .flash-wrap a").on('click', (e) ->
    $('.flash-wrap').attr('data-state', 'closed').
    one($.support.transition.end, =>
      $('.flash-wrap').remove()
    )
    false
  )
