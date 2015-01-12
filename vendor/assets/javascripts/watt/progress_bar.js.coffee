$ ->
  $('.progress-bar').each ->
    $bar = $ @
    $active = $bar.find '.progress-bar-item.is-active'
    # try to scroll to the center of the active item
    center = $active.position().left + $active.width() / 2
    $bar.scrollLeft(center - $bar.width() / 2)

    if $bar.prev().is '.progress-bar-overflow-indicator-left'
      $left = $bar.prev()
      $right = $bar.next()
      fudgeFactor = 20
      scrollWidth = $bar.get(0).scrollWidth - fudgeFactor

      scrollHandler = ->
        if $bar.scrollLeft() < fudgeFactor
          $left.removeClass 'is-active'
          $right.addClass 'is-active'
        else if $bar.width() + $bar.scrollLeft() > scrollWidth
          $left.addClass 'is-active'
          $right.removeClass 'is-active'
        else
          $left.addClass 'is-active'
          $right.addClass 'is-active'

      scrollHandler = _.throttle(scrollHandler, 100) if _?
      $bar.on 'scroll', scrollHandler
      scrollHandler()
