// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  $(".controls.date.start input.datepicker").change(function () {
    console.log("hi");
    var $this = $(this);
    console.log($this);
    $this.closest(".control-group").siblings(".control-group").find(".controls.date.end input.datepicker").val($this.val());
  });

});