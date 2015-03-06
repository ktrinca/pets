#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require select2
#= 
#

$ ->
  # Select2 settings
  $('select.select2').select2
    allowClear: true