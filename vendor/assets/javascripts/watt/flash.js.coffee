$ ->
  $(document).on 'click', '.flash-wrap, .flash-wrap a', (e) ->
    $wrap = $(this).closest '.flash-wrap'
    $wrap.attr('data-state', 'closed')
      .one($.support.transition.end, -> $wrap.remove())
    false
