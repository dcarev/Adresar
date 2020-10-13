$(document).ready(function () {
    $('#ContactForm').validate({
        errorClass: 'help-block animation-slideDown',
        errorElement: 'div',
        errorPlacement: function (error, e) {
            e.parents('.form-group > div').append(error);
        },
        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
            $(e).closest('.help-block').remove();
        },
        success: function (e) {
            e.closest('.form-group').removeClass('has-success has-error');
            e.closest('.help-block').remove();
        },
        rules: {
            'Ime': {
                required: true,
                minlength: 2,
                maxlength: 50
            },

            'Prezime': {
                required: true,
                minlength: 2,
                maxlength: 50
            },

            'Telefon': {
                required: true,
                minlength: 2,
                maxlength: 50
            },

            'Email': {
                email: true
            }
        },
    });
});   