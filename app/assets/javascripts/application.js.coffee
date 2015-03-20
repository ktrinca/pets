#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require bootstrap-sprockets
#= require select2
#= require jquery.tablednd
#= require moxie
#= require plupload.dev
#= require images
#= require bind_with_delay
#= require waypoints
#= require pagination
#

$ ->
  # Select2 settings
  $('select.select2').select2
    allowClear: true
  
  $('.dashboard-group').each (i, fieldset) ->
    max_height = 0
    $(fieldset).find('.row .panel').each (j, box) ->
      max_height = $(box).height() if max_height < $(box).height()
    $(fieldset).find('.row .panel').height(max_height)  