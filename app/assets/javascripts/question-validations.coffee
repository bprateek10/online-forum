$(document).on 'turbolinks:load' ,->
  $('.question-form').validate
    onkeyup: false
    onfocusout: (element) ->
      if !@checkable(element)
        @element element
      return
    rules:
      'question[content]': required: true
    messages:
      'question[content]': required: 'Please enter the question'