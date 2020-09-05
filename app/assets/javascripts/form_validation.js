$( document ).on('turbolinks:load', function() {
    submitSignUpForm();
    validateAuthor();
 });

function submitSignUpForm(){
    $('#new_admin').validate({
        rules: {
            'admin[email]':{
                required: true
            },
            'admin[password]': {
                required: true,
                minlength: 6
            },
            'admin[password_confirmation]': {
                equalTo: "#admin_password"
            }
        },
        messages: {
            'admin[password_confirmation]': "Enter Confirm Password Same as Password"
        }
    });
}

function validateAuthor(){
    $('#new_author, #edit_author').validate({
        rules: {
            'author[first_name]':{
                required: true
            },
            'author[last_name]': {
                required: true
            },
            'author[date_of_birth]': {
                required: true
            },
        },
    });
}