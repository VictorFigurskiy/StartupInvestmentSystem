document.body.onload = function () {


    $('#sector_list').slideUp();
    var state_list = false;
    $('#sector_btn').click(function () {
        if(state_list) {
            $('#text_form_list').html('Открить');
            state_list = false;
            $('#sector_list').slideUp();
        } else {
            $('#text_form_list').html('Закрить');
            state_list = true;
            $('#sector_list').slideDown();
        }
    });
}