# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if true != $('body').data('user-can-signup')
    $('a.btn.signup').addClass("disabled").attr 'href', 'javascript:void(0)'

  if true != $('body').data('user-can-cancel')
    $('a.btn.cancel').addClass("disabled").data('confirm', '').attr 'href', 'javascript:void(0)'