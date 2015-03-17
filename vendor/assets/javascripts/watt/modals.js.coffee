$ ->
  # Remodal
  # Wrap the content in a div for easier styling
  $(document).on 'open', '.remodal', ->
    unless $(this).children().hasClass 'modal-inner'
      $(this).children().wrapAll('<div class="modal-inner"></div>')

  $(document).on 'click', '.remodal .modal-close', ->
    $(this).closest('.remodal').remodal().close()
