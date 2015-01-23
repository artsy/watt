$ ->
  $('.dropdown-toggle').on 'click', ->
    $menu = $(@).find('.dropdown-menu')
    $menu.toggle()
    $('.dropdown-menu').not($menu).hide()
