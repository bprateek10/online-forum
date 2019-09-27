$(document).on 'turbolinks:load' ,->
  $('.registration-form').validate
    onkeyup: false
    onfocusout: (element) ->
      if !@checkable(element)
        @element element
      return
    rules:
      'user[first_name]': required: true
      'user[last_name]': required: true
      'user[email]': 
        required: true
        email: true
      'user[password]': 
        required: true
        minlength: 8
      'user[password_confirmation]':
        required: true
        equalTo : "#password-field"
    messages:
      'user[first_name]': required: 'Please enter your first name'
      'user[last_name]': required: 'Please enter your last name'
      'user[email]': 
        required: 'Please enter email'
        email: 'Please enter a valid email'
      'user[password]': 
        required: 'Please enter the password'
        minlength: 'Password should be of 8 characters'
      'user[password_confirmation]':
        required: 'Please re-enter the password'
        equalTo : 'Password did not match'