$ ->
  $('.file-upload').on 'change', ->
    input = @

    if (input.files && input.files[0])
      reader = new FileReader()

    reader.onload = (e) ->
      $(input).parent().parent().find('.fancy-box-image').attr('src', e.target.result)
      $(input).parent().parent().find('.fancy-box-link').attr('href', e.target.result)

    reader.readAsDataURL(input.files[0]);

