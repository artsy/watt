$ ->
  $('#flash-notice').fadeIn('slow', ->
    $('#flash-notice').delay(1500).fadeOut('slow')
  ) if $('#flash-notice').html() != '<p></p>'