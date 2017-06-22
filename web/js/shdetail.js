(function ($) {
    /* 돈관련 정규식*/
    //[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자
    //[0-9] => \d , [^0-9] => \D
    var rgx1 = /\D/g;
    var rgx2 = /(\d+)(\d{3})/;

    getNumber_comma = function (obj) {

        var num01;
        var num02;
        num01 = obj.value;
        num02 = num01.replace(rgx1, "");
        num01 = setComma(num02);
        obj.value = num01;

    };


    setComma = function (inNum) {

        var outNum;
        outNum = inNum;
        while (rgx2.test(outNum)) {
            outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
        }
        return outNum;

    };
    replaceAll = function (str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    };


    /* 검색결과 이미지 넣기*/
    searchImageInput = function (src_list, data) {
        $.each(data, function (index, val) {

            var src = src_list[index];
            $('#search-list-img' + val.seq).css({
                "background-image": 'url("' + src + '")',
                "-webkit-background-size": "cover",
                "-moz-background-size": "cover",
                "-o-background-size": "cover",
                "background-size": "cover",
                "background-position": "center"
            });
        })
    };

    /* search 버튼 클릭 */
    $(".search-remote").click(function () {
        $("#search-btn").click();
        setTimeout('$("#modal-search-text").focus()', 500);
    });

    $("#crowdlist").on("click", ".list-main", function () {


        var seq = $(this).attr('data-src');

        if (seq != 9999 && seq != '9999') {
            detail_load(seq, 0);
        }
    });
    var check_like = function (pseq) {

        $.ajax({
            url: "checkLike.do",
            data: {"id": myid, "pseq": pseq},
            method: "post",
            success: function (data) {

                if (data.message == "Over") {
                    $('.detail-like').html("<i class='fa fa-heart' aria-hidden='true'></i>");

                } else {
                    $('.detail-like').html("<i class='fa fa-heart-o' aria-hidden='true'></i>");

                }

            }
        })
    };
    $(".detail-summary").on("click", ".detail-like", function () {
        var pseq = $(this).attr('data-src');

        var id = myid;

        if (id == "" || id == null) {
            showMsg("로그인 해주세요<br> <button type='button' class='btn cbox btn-default'onclick='login_open()'>여기</button> 를 눌러 바로 로그인하기");
            return;
        }

        $.ajax({
            url: "crowdLike.do",
            method: "POST",
            data: {
                "pseq": pseq,
                "id": myid
            }, success: function (data) {

                if (data.message == "FAIL") {
                    showMsg("잠시후 다시 시도해주세요")
                } else {

                    $('.like-num[data-src="' + pseq + '"]').html(data.message);
                }
                check_like(pseq);


            }, error: function () {

                showMsg("잠시후 다시 시도해주세요")
            }
        })
    });


    /* 디테일 로드 */
    detail_load = function (seq, sel) {
        $.ajax({
            url: "detailCrowd.do",
            method: "POST",
            data: {"seq": seq},
            success: function (data) {
                if (data.endflag == "1") {
                    showMsg("이미 종료되었습니다");
                    return;
                }

                var src = imageCarrier(data.content);
                var str_title = "<span class='cbox detail-cat'>" + data.category + "</span>" + data.titleTemp;

                var str_summary = "<div class='detail-img'><img class='center-block' src='" + src + "'></div>" +
                    "<div class='detail-like btn btn-default' data-src='" + data.seq + "'><i class='fa fa-heart-o' aria-hidden='true'></i></div>" +
                    "<div>" + data.id + "</div>" +
                    "<div class='detail-date'>" + data.sdate + " ~ " + data.edate + "</div>" +
                    "<div class='detail-goalMoney'>목표금액 : " + money_setComma(data.goalMoney) + "원</div>" +
                    "<div class='progress'>" +
                    "<div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='" + toGoal(data.goalMoney, data.curMoney) + "' " +
                    "aria-valuemin='0' aria-valuemax='100' style='width:" + toGoal(data.goalMoney, data.curMoney) + "%'></div>" +
                    "</div>" +
                    "<div class='progress-info'><span class='card-block info-curMoney float-left'><span class='c-money'>" + money_setComma(data.curMoney) + "</span>원 달성 (" + toGoal(data.goalMoney, data.curMoney) + "%)</span>" +
                    "<span class='card-block info-date float-right'>" + dateCountdown(data.edate) + "일 남음</span></div>" +
                    "<div style='width: 100%; height:300px'>" + "<span class='detail-fund-btn center-block btn btn-info' data-src='" + data.seq + "'>펀딩하기</span>" + "<div class='center-block'><div id='detail-map' style='height: 300px; width: 300px; margin: 0 auto;'></div></div></div>";

                var str_detail = "<div class='detail-content'>" + data.content + "</div>" +
                    "<input type='hidden' name='seq' data-src='" + data.seq + "'>" +
                    "<input type='hidden' name='type' data-src='" + data.type + "'>" +
                    "<div class='detail-tag float-right tagbox'>" + data.tag + "</div>" +
                    "<div class='detail-addr tagbox'>" + data.address + "</div>" +
                    "<div class='detail-reply div-clear'>" +
                    "<h2 class='cursive underline'>Reply</h2>" +
                    "<div class='crowd-reply-list'></div>" +
                    "<input type='text' class='black-control crowd-reply-text col-sm-10'>" +
                    "<button class='btn btn-default crowd-reply-btn col-sm-2'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>쓰기</button>" +
                    "</div>";

                $(".detail-title").html(str_title);
                $(".detail-summary").html(str_summary);
                $(".detail-detail").html(str_detail);
                var detail_latlng = data.latlng.split('*');
                if (detail_latlng.length > 1) {
                    map_load('detail-map', detail_latlng[0], detail_latlng[1]);
                }

                $('.detail-content img').css({"width": "100%", "height": "auto"});
                $('.detail-content iframe').css({"width": "100%"});
                check_like(seq);
                reply_load(seq, data.type);
                $('.fund-btn').attr('data-src', data.seq);
                /* 펀드를 위한 값 넣어주는작업*/

                if (sel == 0) {
                    $('#detail-modal-btn').click();

                }
                var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',');
                $('.detail-summary .c-money').animateNumber(
                    {
                        number: data.curMoney,
                        numberStep: comma_separator_number_step
                    },2500
                );
            }
        })
    };


    /* 디테일 댓글입력 */
    var reply_add = function () {
        var btype = $("input[name='type']").attr("data-src");
        var bparent = $("input[name='seq']").attr("data-src");
        var text = $.trim($(".crowd-reply-text").val());

        if (text == "" || text == null) {
            showMsg("내용을 입력해주세요");
            return;
        }
        $.ajax({
            url: "replyadd.do",
            method: "POST",
            data: {
                "id": myid,
                "btype": btype,
                "content": text,
                "bparent": bparent
            },
            success: function (data) {
                if (data.message == "SUCS") {
                    reply_load(bparent, btype);
                    $(".crowd-reply-text").val("");
                    setTimeout("$('.detail-detail').scrollTop($('.detail-detail').prop('scrollHeight'))", 500);
                } else {
                    alert("실패");
                }
            }
        })
    };

    $(".detail-detail").on("click", ".crowd-reply-btn", function () {
        if (myid != null && myid != "") {
            reply_add();

        } else {
            showMsg("로그인 해주세요<br> <button type='button' class='btn cbox btn-default'onclick='login_open()'>여기</button> 를 눌러 바로 로그인하기");

        }

    });

    $(".detail-detail").on("keydown", ".crowd-reply-text", function (key) {
        if (key.keyCode == 13) {
            reply_add();
        }
    });

    /* 디테일 댓글 불러오기 */
    reply_load = function (seq, type) {

        $.ajax({
            url: "replylist.do",
            data: {"seq": seq, "type": type},
            method: "post",
            success: function (data) {
                var str_reply = "";
                $.each(data, function (i, val) {
                    str_reply += "<div class='crowd-reply'>" +
                        "<input type='hidden' name='seq' data-src='" + val.bparent + "'>" +
                        "<input type='hidden' name='type' data-src='" + val.btype + "'>" +
                        "<div class='crowd-reply-content' data-src='" + val.seq + "'>" + val.content +
                        "<span class='float-right crowd-reply-del' hidden='hidden'><i class='fa fa-times' aria-hidden='true'></i></span>" +
                        "</div><div class='crowd-reply-id' data-src='" + val.id + "'>" + val.id + "</div>" +
                        "</div>";
                });
                $(".crowd-reply-list").html(str_reply);
            }
        })
    };

    /* 로그인창 띄우기*/
    login_open = function () {
        $('.showMsg-close').click();
        setTimeout("$('a[data-target=\"#shLogin\"]').click()", 500);
    };
    /* 디테일 댓글 삭제 */
    $(".detail-detail").on("mouseover", ".crowd-reply", function () {
        if (myid == $(this).find(".crowd-reply-id").attr("data-src")) {
            $(this).find(".crowd-reply-del").show().css("cursor", "pointer");
        }
    });
    $(".detail-detail").on("mouseleave", ".crowd-reply", function () {
        $(this).find(".crowd-reply-del").fadeOut();
    });
    $(".detail-detail").on("click", ".crowd-reply-del", function () {
        $.ajax({
            url: "replydel.do",
            method: "POST",
            data: {"seq": $(".crowd-reply-content").attr("data-src")},
            success: function (data) {
                if (data.message == 'SUCS') {
                    var btype = $("input[name='type']").attr("data-src");
                    var bparent = $("input[name='seq']").attr("data-src");
                    reply_load(bparent, btype);
                }
            }
        })
    });
    /*지도를 불러오는 함수*/
    map_load = function (tagId, lat, lng) {


        var mylatlng = new naver.maps.LatLng(lat, lng);

        var mapOptions = {
            center: mylatlng,
            zoom: 13,
            scaleControl: false,
            logoControl: false,
            mapDataControl: false,
            mapTypeControl: true,
            zoomControl: true,
            minZoom: 1
        };


        var map = new naver.maps.Map(tagId, mapOptions);

        var marker = new naver.maps.Marker({
            position: mylatlng,
            map: map
        });

    };
    /* 펀딩하기 버튼*/
    $('.detail-summary').on("click", ".detail-fund-btn", function () {

        if (myid != "" && myid != null) {
            $('#fund-modal-btn').click();

        } else {
            showMsg("로그인 해주세요<br> <button type='button' class='btn cbox btn-default'onclick='login_open()'>여기</button> 를 눌러 바로 로그인하기");

        }

    });

    /*펀드 제출*/
    $('.fund-btn').click(function () {
        var seletor = $('.pay-type-select.active').attr("for");
        var seq = $(this).attr('data-src');

        if (seletor == "kakao-type") {
        } else if (seletor == "app-type") {


        } else if (seletor == "point-type") {
            point_fund(seq);
        }

    });

    point_fund = function (seq) {

        var point = 0;
        var money_filed = $('input[name="fund-money"]');
        var point_val = $('input[name="fund-money"]').val();
        point_val = replaceAll(point_val, ",", "");
        if (point_val != null && point_val != "") {
            point = parseInt(point_val);

        }
        var mypoint = parseInt($('.mypoint').val().split(":")[1]);
        if (point != null && point != "") {

            if (mypoint < point) {
                showMsg("포인트 잔액이 부족합니다.");


            } else {
                $.ajax({
                    url: "fundCrowd.do",
                    data: {"pseq": seq, "money": point_val, "id": myid},
                    method: "post",
                    success: function (data) {
                        money_filed.val("");

                        if (data.message == "FAIL") {


                        } else {
                            $('.mypoint').val("잔액 :" + data.resultNum);
                            $('.detail-fund-btn').click();
                            detail_load(seq, 1);
                            setTimeout("showMsg('" + point_val + "원 등록 성공하였습니다.')", 500);

                            var item = $('.list-main[data-src="' + seq + '"]');
                            /*해당게시물*/
                            var curMoney_tag = item.find(".info-curMoney");
                            var eindex =curMoney_tag.html().indexOf("원");
                            var curmoney = parseInt(curMoney_tag.html().substring(0,eindex).replace(",","")) + point;
                            /* 원래돈 + 투자핟논*/
                            var per = Math.floor(curmoney / parseInt(curMoney_tag.attr('goal')) * 100);
                            /* 변한돈 / 목표금액 * 100*/
                            var probar = item.find('.progress-bar');
                            /* 내부 진행바*/
                            curMoney_tag.html(money_setComma(curmoney) + "원 달성" + "(" + per + "%)");

                            /*현재금액 업데이트*/
                            probar.attr('aria-valuenow', per);
                            /*퍼센트 업데이트*/
                            probar.css('width', per + "%");
                            /*css적용 */
                        }

                    }
                })
            }

        } else {
            showMsg("출금할 금액을 입력해 주세요");


        }
    };

    /*포인트 결제타입 선택*/
    $(".pay-type-select").click(function () {
        var seletor = $(this).attr("for");
        var app_area = $('.app-content');
        var kakao_area = $('.kakao-content');
        var point_area = $('.point-content');
        app_area.hide();
        kakao_area.hide();
        point_area.hide();
        if (seletor == "kakao-type") {
            kakao_area.show();
        } else if (seletor == "app-type") {
            app_area.show();


        } else if (seletor == "point-type") {
            point_area.show();

        }

    });
    /* 펀딩 모달 애니메이션*/
    var animating = false;

    $('#fund-modal').on("click", ".check-btn", function () {

        if (animating) return false;
        animating = true;

        var cur_page = $(this).parent();
        var next_page = $(this).parent().next();


        //다음페이지 보여주기
        next_page.fadeIn(800);
        cur_page.hide();

        cur_page.animate({opacity: 0}, {
            step: function (now, mx) {
                //다음페이지 크기를 80 ~ 100%로 만들기위해사용
                var scale = 0.8 + (1 - now) * 0.2;
                //2. take current_fs to the right(50%) - from 0%

                var opacity = 1 - now;
                next_page.css({'transform': 'scale(' + scale + ')', 'opacity': opacity});
            },
            duration: 800,
            complete: function () {
                animating = false;
            },
            easing: 'easeInOutBack'
        });
    });
})(jQuery);