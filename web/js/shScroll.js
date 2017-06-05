(function ($) {

    var loadList_byScroll = function () {

        var last = $('.list-main').last().attr('last-num');
        alert(last);
        $.ajax({
            url: "crowdList.do",
            method: "post",
            data: {"rnn": last},
            success: function (data) {
                alert("응")
                console.log(data);

            }, error: function (a, b, c) {

            }
        })
    }

    /* 스크롤 이벤트 */
    $(window).scroll(function () {
        if ($(document).height() <= $(window).scrollTop() + $(window).height()) {
            loadList_byScroll();
        }
    });


})(jQuery);