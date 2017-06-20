/**
 * Created by Administrator on 2017-06-20.
 */
(function ($) {
    $(function () {
        /* 모달 검색 */
        $("#modal-search-text").keydown(function (key) {
            if (key.keyCode == 13) {
                $.ajax({
                    url: "searchCategory.do",
                    method: "POST",
                    data: {"search": $("#modal-search-text").val()},
                    success: function (data) {
                        var str = "";
                        $.each(data, function (i, val) {
                            str += "<div class='search-category btn-default' data-src='" + val.category + "'>" + val.category + "<span class='badge'>" + val.cnt + "</span></div>";
                        });
                        $("#searchlist").html(str);

                        $("#searchlist").show();
                        $("#searchresult").hide();
                    }
                })
            }
        });

        /* 서치 모달 카테고리 클릭 시 리스트 */
        $("#searchlist").on("click", ".search-category", function () {
            var cat = $(this).attr('data-src');
            $.ajax({
                url: "cSearch.do",
                method: "POST",
                data: {
                    "rnn": "9999",
                    "search_type": "category",
                    "category": cat,
                    "search": $("#modal-search-text").val()
                },
                success: function (data) {
                    var str="";
                    str = "<div class='btn btn-default go-back-search black-control cbox center-block'>뒤로 가기</div>";
                    var src_list = [];
                    $.each(data, function (i, val) {
                        str += "<div class='crowd-detail-btn list-search' data-src='" + val.seq + "'>" +
                            "<div class='search-img-section' id='search-list-img" + val.seq + "'></div>" +
                            "<div class='search-info-section'>" +
                            "<div><strong>" + val.titleTemp + "</strong></div>" +
                            "<div>목표금액 : " + money_setComma(val.goalMoney) + "원</div>" +
                            "<div>현재 " + money_setComma(val.curMoney) + "원 달성 (" + toGoal(val.goalMoney, val.curMoney) + "%)</div>" +
                            "</div></div>";
                        var src = imageCarrier(val.content);
                        src_list.push(src);
                    });
                    $("#searchresult").html(str);
                    searchImageInput(src_list, data);

                    $("#searchlist").hide();
                    $("#searchresult").show();
                }
            })
        });

        /* 모달 - 검색리스트 뒤로가기 */
        $("#searchresult").on("click", ".go-back-search", function () {
            $("#searchlist").show();
            $("#searchresult").hide();

        });

        /*모달 - 검색결과 클릭시*/
        $("#searchresult").on("click", ".list-search", function () {
            var seq = $(this).attr("data-src");
            detail_load(seq, 0);
        });
    })
})(jQuery);