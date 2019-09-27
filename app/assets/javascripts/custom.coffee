$(document).on 'turbolinks:load', ->
  $('.alert').fadeOut 7000

  $('.comment-text').on 'keyup', ->
    submitButton = $(this).closest('form').find('.btn')
    if this.textLength > 0 && submitButton.is(":disabled")
      submitButton.prop('disabled', false);
    else if this.textLength < 1 && submitButton.is(":enabled")
      submitButton.prop('disabled', true);

    