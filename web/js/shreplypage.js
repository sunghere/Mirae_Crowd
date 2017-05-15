(function ($) {

    if (document.body.clientWidth > 800) {
        // 모바일 기기 관련 작업
        $('#content_affix').attr('data-spy', 'affix');
        $('#reply_cotent').attr('data-spy', 'affix');

    }
    $(document).scroll(function () {
        var y = $(this).scrollTop();

        if (y > $('#two').height() - $('#footer').height()) {
            $('div.margin15.row').hide();
            $('.sh-replybox-bottom').show();
        } else {
            $('div.margin15.row').show();

            $('.sh-replybox-bottom').hide();

        }

    });
    if ($('#two').height() < 1200) {
        $('#two').css({
            "height": "1200px"
        })
    }
    $(document).scroll(function () {
        var twoheight = $('#two').height() + $('#reply_cotent').height() - 200;
        if ($('#two').height() < 1200) {
            $('#two').css({
                "height": twoheight
            })
        }
    })
})(jQuery);