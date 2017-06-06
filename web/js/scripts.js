(function ($) {
    /* 사이즈 초기화 */
    /*글쓰기*/

    $('body').scrollspy({
        target: '.navbar-fixed-top, #myScrollspy',
        offset: 120
    });

    $('#topNav').affix({
        offset: {
            top: 200
        }
    });
    /* 모바일 초기화 */
    if (document.body.clientWidth < 800) {
        /* 글쓰기에 따라다니는것 모바일에서 숨김*/
        $('.writeListAffix').hide();
        $('.writeListAffix ul li').hide();
    }
    $('#top_scroll').hide();

    $('a.page-scroll').bind('click', function (event) {
        var $ele = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($ele.attr('href')).offset().top - 60)
        }, 1450, 'easeInOutExpo');
        event.preventDefault();
    });
    /* 스크롤 이벤트*/
    $(document).scroll(function () {


        if (!$('.writeListAffix').hasClass('affix')) {
            $('.writeListAffix').show();
        }
    });
    $('.navbar-collapse ul li a').click(function () {
        /* always close responsive nav after click */
        $('.navbar-toggle:visible').click();
    });

    $('#galleryModal').on('show.bs.modal', function (e) {
        $('#galleryImage').attr("src", $(e.relatedTarget).data("src"));
    });

    $.fn.filestyle = function (options) {

        /* TODO: This should not override CSS. */
        var settings = {
            width: 250
        };

        if (options) {
            $.extend(settings, options);
        }
        ;

        return this.each(function () {

            var self = this;
            var wrapper = $("<div>")
                .css({
                    "width": settings.imagewidth + "px",
                    "height": settings.imageheight + "px",
                    "background": "url(" + settings.image + ") 0 0 no-repeat",
                    "background-position": "right",
                    "display": "inline",
                    "position": "absolute",
                    "overflow": "hidden"
                });

            var filename = $('<input class="file">')
                .addClass($(self).attr("class"))
                .css({
                    "display": "inline",
                    "width": settings.width + "px"
                });

            $(self).before(filename);
            $(self).wrap(wrapper);

            $(self).css({
                "position": "relative",
                "height": settings.imageheight + "px",
                "width": settings.width + "px",
                "display": "inline",
                "cursor": "pointer",
                "opacity": "0.0"
            });

            if ($.browser.mozilla) {
                if (/Win/.test(navigator.platform)) {
                    $(self).css("margin-left", "-142px");
                } else {
                    $(self).css("margin-left", "-168px");
                }
                ;
            } else {
                $(self).css("margin-left", settings.imagewidth - settings.width + "px");
            }
            ;

            $(self).bind("change", function () {
                filename.val($(self).val());
            });

        });


    };
    /* footer 자연스럽게 slide 식으로 보이게 처리*/
    var height = $('#footer').height() + 50;
    $("#content_wrap").css({"margin-bottom": height});
    $(window).resize(function () {
            var height = $('#footer').height() + 50;
            $("#content_wrap").css({"margin-bottom": height});

        }
    );

    $("#_sildebtn div img").on("click", function () {
            if ($(this).attr("src") == "image/shall.png") {
                $(".sh-out-remote img").attr("src", "image/shexit.png");
                $(".sh-in-talk").css("bottom", $(".sh-out-remote").height() * 1.6).css("transition", ".3s");
                $(".sh-in-search").css("bottom", $(".sh-out-remote").height() * 2.7).css("transition", ".3s");
            } else if ($(this).attr("src") == "image/shexit.png") {
                $(".sh-out-remote img").attr("src", "image/shall.png");
                $(".sh-in-talk").css("bottom", "2.7%").css("transition", ".3s");
                $(".sh-in-search").css("bottom", "2.7%").css("transition", ".3s");
            }
        }
    );


    $("#_sildebtn").attr({
        "data-offset-top": $('#two').height() + $('header').height() - $('#footer').height() - 550,
        "data-spy": "affix"
    });
    Date.prototype.format = function (f) {
        if (!this.valueOf()) return " ";

        var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
        var d = this;

        return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function ($1) {
            switch ($1) {
                case "yyyy":
                    return d.getFullYear();
                case "yy":
                    return (d.getFullYear() % 1000).zf(2);
                case "MM":
                    return (d.getMonth() + 1).zf(2);
                case "dd":
                    return d.getDate().zf(2);
                case "E":
                    return weekName[d.getDay()];
                case "HH":
                    return d.getHours().zf(2);
                case "hh":
                    return ((h = d.getHours() % 12) ? h : 12).zf(2);
                case "mm":
                    return d.getMinutes().zf(2);
                case "ss":
                    return d.getSeconds().zf(2);
                case "a/p":
                    return d.getHours() < 12 ? "오전" : "오후";
                default:
                    return $1;
            }
        });
    };

    String.prototype.string = function (len) {
        var s = '', i = 0;
        while (i++ < len) {
            s += this;
        }
        return s;
    };
    String.prototype.zf = function (len) {
        return "0".string(len - this.length) + this;
    };
    Number.prototype.zf = function (len) {
        return this.toString().zf(len);
    };


    /* 금액 000 마다 콤마 찍어주는 function*/

    money_setComma = function (inNum) {
        //[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자
        //[0-9] => \d , [^0-9] => \D
        var rgx2 = /(\d+)(\d{3})/;
        var outNum = "";
        outNum = '' + inNum;
        while (rgx2.test(outNum)) {
            outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
        }
        return outNum;

    }
    /*이미지를 파싱해주는부분*/
    imageCarrier = function (content) {
        var contentArray = new Array();
        contentArray = content.split('alt="" src="');
        if (contentArray[1] != null && contentArray[1] != "") {
            var src = contentArray[1].split('"')

            return src[0];
        } else {

        }
        return "";
    }
    /* 현재금액과 목표금액을 매개변수로 퍼센트를 계산*/
    toGoal = function (goalmoney, curmoney) {
        var per = (curmoney / goalmoney) * 100;
        return Math.floor(per);
    }
    /* 일자를 계산해 몇일남은지를 계산해준다.*/
    dateCountdown = function (edate) {
        var today = new Date();
        var edateArray = edate.split("-");

        var edateObj = new Date(edateArray[0], Number(edateArray[1]) - 1, edateArray[2]);

        var between = Math.floor((edateObj.getTime() - today.getTime()) / 1000 / 60 / 60 / 24);
        if (between < 0) return 0;
        else return between;
    }


})(jQuery);