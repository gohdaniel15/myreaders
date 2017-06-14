$(document).on 'ready turbolinks:load', ->
  $('#selectAll').click ->
    if @checked
      console.log('hi')
      $(':checkbox').each ->
        @checked = true
        return
    else
      $(':checkbox').each ->
        @checked = false
        return
    return
