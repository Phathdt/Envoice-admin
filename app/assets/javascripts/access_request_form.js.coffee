class @AccessRequestForm

  constructor: ->
    @validateImagePresent() if $('.image_persisted').length != 1

  validateImagePresent: ->
    self = @

    self.disableSubmit(true)

    $('.file-upload').on 'change', ->
      totalPresent = 0
      $('.file-upload').each ->
        input = @

        if (input.files && input.files[0])
          totalPresent += 1

      if totalPresent == 4
        self.disableSubmit(false)
      else
        self.disableSubmit(true)


  disableSubmit: (disable) ->
    $('input[type="submit"]').prop('disabled', disable);
