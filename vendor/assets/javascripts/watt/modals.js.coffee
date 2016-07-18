# Global configs for remodal.js. Available since v1.0.0.
window.REMODAL_GLOBALS = {
  DEFAULTS: {
    modifier: 'artsy-modal'
  }
}

$ ->
  # Remodal

  # Wrap the modal content in a div for easier styling.
  wrapChildren = ($modal) ->
    return if $modal.children().hasClass 'modal-inner'
    $modal.children().wrapAll '<div class="modal-inner"></div>'

  closeModal = ($close) ->
    $close.closest('.remodal').remodal().close()

  $(document).on 'opening', '.remodal.artsy-modal', -> wrapChildren($(this))
  $(document).on 'click', '.remodal .modal-close', -> closeModal($(this))

  # DEPRECATED
  # The following can be removed after we retire the old remodal.js (0.5.0).
  $(document).on 'open', '.remodal', -> wrapChildren($(this))
