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

    new WOW().init();
    $('#top_scroll').hide();

    $('a.page-scroll').bind('click', function (event) {
        var $ele = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($ele.attr('href')).offset().top - 60)
        }, 1450, 'easeInOutExpo');
        event.preventDefault();
    });
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

    $.fn.filestyle = function(options) {

        /* TODO: This should not override CSS. */
        var settings = {
            width : 250
        };

        if(options) {
            $.extend(settings, options);
        };

        return this.each(function() {

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
                };
            } else {
                $(self).css("margin-left", settings.imagewidth - settings.width + "px");
            };

            $(self).bind("change", function() {
                filename.val($(self).val());
            });

        });


    };
})(jQuery);