$ ->
  $('.toggle:not(.toggle-disabled)').click (e) ->
    e.preventDefault()
    $this     = $(this)
    $toggle   = if $this.is '.toggle-label' then $this.prev() else $this.closest 'a.toggle'
    $toggle.attr 'data-state':
      if $toggle.is "[data-state='on']"
        'off'
      else if $toggle.is "[data-state='off']"
        'on'
      else if $toggle.is "[data-state='yes']"
        'no'
      else if $toggle.is "[data-state='no']"
        'yes'
