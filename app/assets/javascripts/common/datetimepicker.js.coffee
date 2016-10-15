$(document).on 'ready turbolinks:load', ->
  $('body').on 'focus', '.datetimepicker', ->
    $('.datetimepicker').datetimepicker
      viewMode: 'years'
      format: 'DD/MM/YYYY'
      defaultDate: moment()
      widgetPositioning:
        horizontal: 'left',
        vertical: 'bottom'
