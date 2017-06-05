(function ($) {

    var loadList_byScroll = function () {

        var last = $('.list-main').last().attr('last-num');

        if (last.toString() == '9999') {
            return;
        }

        if (last % 12 == 0) { /* 12개씩 불러오므로 나머지가 0인경우는 자료가 더있다.*/


            var search_type = $('.search_type').attr('data-src');
            var search = $('.search').attr('data-src');
            var url = "crowdList.do";

            if (search_type == "tag" || search_type == "search") {
                var url = "cSearch.do";
            }

            $.ajax({
                url: url,
                method: "post",
                data: {"rnn": last, "search_type": search_type, "search": search},
                success: function (data) {
                    console.log(data.length);
                    if (data.length < 1) {
                        var str = '';
                        str = '<div class="center-block scroll-end-btn btn list-main btn-default" data-src="9999"><a href="#two" class="cursive">Top<i class="fa fa-caret-up"></i></a></div>'

                        $('#crowdlist').html($('#crowdlist').html() + str);

                    } else {
                        make_list(data, 1);
                    }
                }, error: function (a, b, c) {

                }
            })

        } else {/*나머지가 0이 아닌경우 자료가 더이상 없다.*/
            var str = '';

            str = '<div class="center-block scroll-end-btn btn list-main btn-default" data-src="9999"><a href="#two" class="cursive">Top<i class="fa fa-caret-up"></i></a></div>'
            $('#crowdlist').html($('#crowdlist').html() + str);
        }
    }

    /* 스크롤 이벤트 */
    $(window).scroll(function () {
        if ($(document).height() <= $(window).scrollTop() + $(window).height()) {
            loadList_byScroll();

        }
    });


})(jQuery);