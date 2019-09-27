$(document).on 'turbolinks:load' ,->
  $('.login-form').validate
    onkeyup: false
    onfocusout: (element) ->
      if !@checkable(element)
        @element element
      return
    rules:
      'user[email]': 
        required: true
        email: true
      'user[password]': required: true
    messages:
      'user[email]': 
        required: 'Please enter email'
        email: 'Please enter a valid email'
      'user[password]': required: 'Please enter the password'