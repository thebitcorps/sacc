// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require angular.min
//= require materialism.min
//= require vendors.min
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require react
//= require react_ujs
//= require components
//= require_tree .

$(document).on("page:load",function(){
    $('#phones').on("cocoon:after-insert", function() {
        $('select').material_select();
    });
});

$( document ).ready(function() {
    $('#phones').on("cocoon:after-insert", function() {
        $('select').material_select();
    });
});

