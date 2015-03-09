#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require select2
#= require plupload.dev
#= require images
#

$ ->
  # Select2 settings
  $('select.select2').select2
    allowClear: true