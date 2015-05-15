$(document).on "ready page:change", ->
  $('select').material_select()
  $(".button-collapse").sideNav()
  $('.datepicker').pickadate()
    selectMonths: true,
    selectYears: 15

