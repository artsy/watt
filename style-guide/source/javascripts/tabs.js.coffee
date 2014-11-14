# Determine if the overflow indicators exist to reveal overflow indicators
# when the scroll position is not at an edge.
#
# Assumes markup looks like this:
# (see: style-guide/source/interface/item.html.haml)
#
#  .tab-overflow-indicator-left
#  .tabs
#    %ul.tabs-overflow><
#      %li.tab-item><
#        %a{href: '/interface/item'}< Overview
#      ...
#      %li.tab-item><
#        %a{href: '/interface-form'}< Documents
#  .tab-overflow-indicator-right
#
# The indicators must live outside the clipping .tabs element
#
$ ->
  $('.tabs').each ->
    $tab = $ @
    if $tab.prev().is '.tabs-overflow-indicator-left'
      $left = $tab.prev()
      $right = $tab.next()
      fudgeFactor = 10
      scrollWidth = $tab.get(0).scrollWidth - fudgeFactor

      scrollHandler = ->
        if $tab.scrollLeft() < fudgeFactor
          $left.removeClass 'is-active'
          $right.addClass 'is-active'
        else if $tab.width() + $tab.scrollLeft() > scrollWidth
          $left.addClass 'is-active'
          $right.removeClass 'is-active'
        else
          $left.addClass 'is-active'
          $right.addClass 'is-active'

      scrollHandler = _.throttle(scrollHandler, 100) if _?
      $tab.on 'scroll', scrollHandler
      scrollHandler()
