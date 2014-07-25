$ ->
  updateSelectionsForm = (selection) ->
    $( "#partner_selections_form #partner_id" ).val( selection.id )
    $( "#partner_selections_form #partner_search" ).val( selection.name )

  if $('#partner_selections_form').length != 0
    $('#partner_selections_form #partner_search').autocomplete(
      source: "/partner_selections/match"
      focus: (event, ui) ->
        updateSelectionsForm(ui.item)
        false
      select: (event, ui) ->
        updateSelectionsForm(ui.item)
        $('#partner_selections_form').submit()
        false
    )
