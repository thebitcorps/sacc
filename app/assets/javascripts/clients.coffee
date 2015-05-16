$(document).on "ready page:load", ->
  $('select').material_select()
  $(".button-collapse").sideNav()
  $('.datepicker').pickadate()
    selectMonths: true,
    selectYears: 15

