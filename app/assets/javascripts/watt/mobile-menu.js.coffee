$ ->
  $('#menu-link a').click ->
    $('#nav-wrap').toggle()
    return false

$(window).resize (e) ->
  if ( $(window).width() > 767 )
    $('#nav-wrap').show()
  else
    $('#nav-wrap').hide()