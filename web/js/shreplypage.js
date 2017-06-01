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
            twoheight = $('#content_wrap').height() - 550;
        }
        if (document.body.clientWidth < 800) {
            // 모바일 기기 관련 작업
            twoheight = $('#content_affix').height() + $('#reply_cotent').height() - 200;

        }
        if (y > twoheight+200) {
            $('div.margin15.row').hide();
            $('.sh-replybox-bottom').show();

        }
        else {
            $('div.margin15.row').show();
            $('.sh-replybox-bottom').hide();

        }
        if (document.body.clientWidth > 800) {
            if ($('#two').height() < twoheight) {
                $('#two').css({
                    "height": twoheight
                })
                if ($('#two').height() < 1000) {
                    $('#two').css({
                        "height": "1000px"
                    })
                }

            }
        } else {

            $('#two').css({
                "padding-bottom": twoheight + $('#reply_cotent').height() + 400 + $('#footer').height()
            })
        }

    });
    if (document.body.clientWidth > 800) {
        if ($('#two').height() < 1000) {
            $('#two').css({
                "height": "1000px"
            })
        }
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
                    $('#reply_cotent').scrollTop($('#reply_cotent').prop('scrollHeight'))

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
                    str += '<div class="sh-replybox"><div class="reply-block"><div class="reply-author replybox-footer"><div class="reply-author-nickname">' + val.name + '</div></div><div class="reply-box-content">' + val.content + '</div>';

                    if (myid == val.id) {
                        str += '<button type="button" id="_replySeq@' + val.seq + '" class="reply-edit-btn btn cursive small"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>';
                    }
                    if ((myid != null) || myid != "") {
                        str += '<button type="button" id="_replySeq@' + val.seq + '" class="reply-delete-btn btn cursive small"><i class="fa fa-trash" aria-hidden="true"></i></i></button>';
                    }
                    str += '</div></div>';
                })
                $('#replyReload').html(str)


            },
            error: function () {

            }


        })


    }
    /* 리플 삭제*/
    $('#replyReload').on('click', ".rereplyBt", function () {

        $.ajax({
            url: "",
            method: "post",
            data: {"id":"${login.id}",},
            success: function () {

            }
        })
    })
    /*리플 수정*/
    $('#replyReload').on('click', ".reeditBt", function () {

        $('#replyModalBt').click();
    })

    replyReload();

})(jQuery);