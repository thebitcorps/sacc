$(document).on "ready page:load", ->
  selected_status = $('#client_marital_status option').filter(':selected').val()
  if selected_status != 'married'
    $('#spouse-group').hide()

  selected_credit = $('#client_credit_type option').filter(':selected').val()
  if selected_credit != 'bank'
    $('#credit-group').hide()

  $('#client_marital_status').change ->
    selected_status = $('#client_marital_status option').filter(':selected').val()
    if selected_status == 'married'
      $('#spouse-group').show()
    else
      $('#spouse-group').hide()

  $('#client_credit_type').change ->
    selected_credit = $('#client_credit_type option').filter(':selected').val()
    if selected_credit == 'bank'
      $('#credit-group').show()
    else
      $('#credit-group').hide()

