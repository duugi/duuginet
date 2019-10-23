# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$.getScript '//cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js', (data, textStatus, jqxhr) ->
  options = valueNames: [
    'name'
    'country_code'
    'description'
    'state_code'
    'timezone_code'
    'is_active'
  ]
  locationsList = new List('locations', options)
