# Submits the filter form when any of the form parameters change
#
# Assumes filter form markup looks like this:
# (see: style-guide/source/elements/lists.html.haml)
#
#  .list-controls
#    %form.simple_form.watt-filters{ id: 'elements-filters', action: 'elements_controller_index', method: 'get' } // 'watt_filters' class required on the form
#      .list-controls-row
#        .list-control-filter
#          .form-group.select.filter_state
#            %select.select.required.form-control{ name: 'filter[state]', id: 'filter_state' } // change event fires for each select element undet 'watt-filters' form
#              %option{ value: 'all', selected: 'selected' } Select State
#              %option{ value: 'active' } Active
#              %option{ value: 'completed' } Completed
#              %option{ value: 'failed' } Failed
#        .list-control-filter
#          .form-group.select.filter_visibility
#            %select.select.required.form-control{ name: 'filter[visibility]', id: 'filter_visibility' } // change event fires for each select element undet 'watt-filters' form
#              %option{ value: 'all', selected: 'selected' } Filter by visibility
#              %option{ value: '1' } Visible
#              %option{ value: '0' } Invisible
#      .list-controls-row
#        .list-control-counts
#          Viewing 1 - 5 of 37 Artists
#        .list-control-sorting.hidden-xs Sorted by:
#          %span.sort_option{ value: 'az' } // 'sort_option' class and valid sort value required for sorting to work properly
#            A-Z
#          .sort_separator /
#          %span.active.sort_option{ value: 'most_recent' } // 'sort_option' class and valid sort value required for sorting to work properly
#            Most Recent
#          %input{ value: 'most_recent', type: 'hidden', name: 'filter[sort]', id: 'filter_sort' } // hidden input with id 'filter_sort' is required for sorting to work properly
#

$ ->
  $('.list-controls').on 'change', '.watt-filters select', ->
    $form = $(this).closest('form')
    Pace.restart() if Pace
    $form.submit()

  $('.list-controls').on 'click', '.watt-filters .sort_option', ->
    $sort_option = $(this)
    $form = $sort_option.closest('form')
    $form.find('.sort_option').removeClass('active')
    $sort_option.addClass('active')
    $form.find('#filter_sort').val $sort_option.attr('value')
    Pace.restart() if Pace
    $form.submit()
