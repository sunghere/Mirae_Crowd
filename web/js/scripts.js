(function ($) {
    "use strict";

    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 60
    });

    $('#topNav').affix({
        offset: {
            top: 200
        }
    });

    /*new WOW().init();*/
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
        var y = $(this).scrollTop();
        if (y > $(window).height() / 4) {
            $('#top_scroll').show();
            $('#last_scroll').hide();
        } else {
            $('#top_scroll').hide();
            $('#last_scroll').show();
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
            if ($(this).attr("src") == "image/shall.gif") {
                $(".sh-out-remote img").attr("src", "image/shexit.gif");
                $(".sh-in-talk").css("bottom", $(".sh-out-remote").height() * 1.5).css("transition", ".3s");
                $(".sh-in-search").css("bottom", $(".sh-out-remote").height() * 2.7).css("transition", ".3s");
            } else if ($(this).attr("src") == "image/shexit.gif") {
                $(".sh-out-remote img").attr("src", "image/shall.gif");
                $(".sh-in-talk").css("bottom", "2.7%").css("transition", ".3s");
                $(".sh-in-search").css("bottom", "2.7%").css("transition", ".3s");
            }
        }
    );

    $("#_sildebtn").attr({"data-offset-top": $('#two').height()+$('header').height()-$('#footer').height()-550, "data-spy": "affix"});
})(jQuery);