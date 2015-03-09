$ ->
  # Sortable tables
  applySortable = ->
    $('.sortable').each (i, element) ->
      self = $(element)

      self.tableDnD
        dragHandle: '.handle',
        serializeParamName: (self.data('param-name') || false),
        onDrop: (table, row) ->
          data = "#{$.tableDnD.serialize()}&_method=patch"
          $.post(self.data('url'), data)

  applySortable()

  $container = $('#images-container')
  $list = $("##{$container.data('list')}")

  uploader = new plupload.Uploader
    runtimes: 'html5'
    browse_button: $container.data('browse-button')
    container: $container.data('id')
    max_file_size: '2mb'
    url: $container.data('url')
    multipart: true
    multipart_params:
      authenticity_token: $('meta[name="csrf-token"]').attr('content')
    filters: [{ title: 'Image files', extensions: 'jpeg,jpg,gif,png' }]

  uploader.bind 'Init', (up, params) ->
    # Empty

  uploader.init()

  uploader.bind 'FilesAdded', (up, files) ->
    $.each files, (i, file) ->
      $list.append("<tr id=\"#{file.id}\"><td colspan=\"4\"><div class=\"progress\"><div class=\"progress-bar progress-bar-info progress-bar-striped\" role=\"progressbar\" aria-valuenow=\"0\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 0%;\">0%</div></div></td></tr>")
    uploader.start()
    up.refresh()


  uploader.bind 'UploadProgress', (up, file) ->
    $("##{file.id} .progress-bar").css('width', "#{file.percent}%")
    $("##{file.id} .progress-bar").html("#{file.percent}%")

  uploader.bind 'Error', (up, err) ->
    $list.append("<tr><td colspan=\"4\">Error: #{err.code}, Message: #{err.message}</td></tr>")
    up.refresh()

  uploader.bind 'FileUploaded', (up, file, response) ->
    $("##{file.id}").replaceWith(response.response)
    applySortable()
