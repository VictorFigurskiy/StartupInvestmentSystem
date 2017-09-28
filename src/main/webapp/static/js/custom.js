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

    var team_info = $('.team_info_item');
$('.team_btn').click(function () {
    var number_click = $('.team_btn').index(this);
    if ( $(team_info[number_click]).css('display') == 'none' ) {
        var team_info_state = false;
        for ( var i = 1; i <= $(team_info).length; i++ ) {
            if ( $(team_info[i]).css('display') != 'none' ) {
                team_info_state = true;

            }
        }

        if (team_info_state) {
            $(team_info).slideUp(500);

            setTimeout( function() {
                $(team_info[number_click]).slideDown(500);
            } ,500);
        } else {
            $(team_info[number_click]).slideDown(500);
        }
    } else {
        $(team_info[number_click]).slideUp(500);
    }
});
}