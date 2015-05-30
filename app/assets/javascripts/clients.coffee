$(document).on "ready page:load", ->
  selected = $('#client_marital_status option').filter(':selected').text()
  if selected != 'married'
    $('#spuse-group').hide()

  $('#client_marital_status').change ->
    selected = $('#client_marital_status option').filter(':selected').text()
    if selected == 'married'
      $('#spuse-group').show()
    else
      $('#spuse-group').hide()
