$ ->
  if $('#partner_search').length != 0
    $('#partner_search').autocomplete(
      source: "/partner_selections/match"
      select: (event,ui) ->
        $( "#partner_id" ).val( ui.item.id )
        $('#partner_selections_form').submit()
      ).data("ui-autocomplete")._renderItem = (ul, item) =>
         $("<li><a>#{item.name}</a></li>")
         .data("item.autocomplete", item)
         .appendTo ul
