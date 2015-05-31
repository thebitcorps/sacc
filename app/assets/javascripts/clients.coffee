$(document).on "ready page:load", ->
  selected_status = $('#client_marital_status option').filter(':selected').val()
  if selected_status != 'married'
    $('#spuse-group').hide()

  selected_creit = $('#client_credit_type option').filter(':selected').val()
  if selected_creit != 'bank'
    $('#credit-group').hide()

  $('#client_marital_status').change ->
    selected_status = $('#client_marital_status option').filter(':selected').val()
    if selected_status == 'married'
      $('#spuse-group').show()
    else
      $('#spuse-group').hide()

  $('#client_credit_type').change ->
    selected_credit = $('#client_credit_type option').filter(':selected').val()
    if selected_credit == 'bank'
      $('#credit-group').show()
    else
      $('#credit-group').hide()

