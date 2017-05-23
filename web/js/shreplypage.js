(function ($) {
    if (document.body.clientWidth > 800) {
        // 모바일 기기 아닌 화면에서
        $('#content_affix').attr('data-spy', 'affix');
        $('#reply_cotent').attr('data-spy', 'affix');

    }
    var twoheight = 0;
    $(document).scroll(function () {
        var y = $(this).scrollTop();

        if (y > 455) {
            $('.fixed-alram').hide();
        } else {
            $('.fixed-alram').show();

        }
        if (twoheight == 0) {
            twoheight = $('#content_wrap').height();
        }
        if (document.body.clientWidth < 800) {
            // 모바일 기기 관련 작업
            twoheight = $('#content_affix').height() + $('#reply_cotent').height() - 50;

        }
        if (y > twoheight - 400) {
            $('div.margin15.row').hide();
            $('.sh-replybox-bottom').show();
        }
        else {
            $('div.margin15.row').show();
            $('.sh-replybox-bottom').hide();

        }

        if ($('#two').height() < 1200) {
            $('#two').css({
                "height": twoheight
            })
            if ($('#two').height() < 1200) {
                $('#two').css({
                    "height": "1200px"
                })
            }

        }

    });
    if ($('#two').height() < 1200) {
        $('#two').css({
            "height": "1300px"
        })
    }


    $('.replyBt').click(function () {
        var btSelector = 0;
        var commentContent = "";

        if ($(this).attr('datasrc') == "oribt") {
            btSelector = 1;
            commentContent = $('#bot-r-area').val();
        } else {

            commentContent = $('#r-area').val();

        }
        if (commentContent == "" || commentContent == null) {

            alert('내용을 <br>입력해주세요');
            return;

        }
        $.ajax({
            type: "POST",
            url: "replyadd.do",
            data: {
                "id": $('input[name="myid"]').attr('value'),
                "content": commentContent,
                "btype": $('input[name="type"]').attr('value'),
                "bparent": $('input[name="seq"]').attr('value')
            },
            success: function (msg) {


                if (msg.message == "SUCS") {
                    $(".loginexit").click();

                    if (btSelector == 1) { //밑에 쓰기
                        $('#bot-r-area').val("");

                    } else { //위에쓰기.
                        $('#r-area').val("");


                    }
                    replyReload();
                } else {
                    alert("실패");
                }

            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }

        })

    })

    var replyReload = function (data) {
        var str = '';
        $.ajax({
            url: "replylist.do",
            datatype: 'json',
            type: 'post',
            data: {"type": $('input[name="type"]').attr('value'), 'seq': $('input[name="seq"]').attr('value')},

            success: function (data) {
                var myid = $('input[name="myid"]').attr('value');
                $.each(data, function (index, val) {
                    str += '<div class="sh-replybox"><div class="reply-block"><p>' + val.content + '</p>';

                    if (myid == val.id) {
                        str += '<button type="button" id="_replySeq@' + val.seq + '" class="reeditBt btn cursive small">edit&nbsp;<i class="fa fa-reply-all" aria-hidden="true"></i></button>';
                    }
                    if ((myid != null) || myid != "") {
                        str += '<button type="button" id="_replySeq@' + val.seq + '" class="rereplyBt btn cursive small">reply&nbsp;<i class="fa fa-reply-all" aria-hidden="true"></i></button>';
                    }
                    str += '</div><div class="reply-author replybox-footer"><div class="reply-author-nickname">' + val.name + '</div></div></div>';
                })
                $('#replyReload').html(str)


            },
            error: function () {

            }


        })


    }
    /* 리플+리플*/
    $('#replyReload').on('click', ".rereplyBt", function () {

        $('#replyModalBt').click();
    })
    $('#replyReload').on('click', ".reeditBt", function () {

        $('#replyModalBt').click();
    })

    replyReload();

})(jQuery);