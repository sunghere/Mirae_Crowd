(function ($) {
    if (document.body.clientWidth > 800) {
        // 모바일 기기 아닌 화면에서
        $('#content_affix').attr('data-spy', 'affix');
        $('#reply_cotent').attr('data-spy', 'affix');

    } else {

        $('#reply_cotent').css({"position": "initial", "right": "0"});
        $('#content_affix').css({"position": "initial", "left": "0", "width": "100%", "background-color": "#fff"})
    }
    $(document).scroll(function () {
        var y = $(this).scrollTop();

        if (y > 455) {
            $('.fixed-alram').hide();
        } else {
            $('.fixed-alram').show();

        }

        if (y > $('#two').height() - 400) {
            $('div.margin15.row').hide();
            $('.sh-replybox-bottom').show();

        }
        else {
            $('div.margin15.row').show();
            $('.sh-replybox-bottom').hide();

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
        if ($(this).attr('data-src') == "original-reply-btn") {
            btSelector = 1;
            commentContent = $('#bot-r-area').val();
        } else {

            commentContent = $('#r-area').val();

        }
        if (commentContent == "" || commentContent == null) {

            showMsg('내용을 <br>입력해주세요');
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

    });


    var replyReload = function () {
        var str = '';
        $.ajax({
            url: "replylist.do",
            datatype: 'json',
            type: 'post',
            data: {"type": $('input[name="type"]').attr('value'), 'seq': $('input[name="seq"]').attr('value')},

            success: function (data) {
                var myid = $('input[name="myid"]').attr('value');
                $.each(data, function (index, val) {
                    str += '<div class="sh-replybox"><div class="reply-block"><div class="reply-author replybox-footer"><div class="reply-author-nickname">' + val.name + '</div></div><div class="reply-box-content">' + val.temp + '</div>';

                    if (myid == val.id) {
                        str += '<button type="button" data-src="' + val.seq + '" class="reply-edit-btn btn cursive small"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>';
                        str += '<button type="button" data-src="' + val.seq + '" class="reply-delete-btn btn cursive small"><i class="fa fa-trash" aria-hidden="true"></i></i></button>';

                    }

                    str += '</div></div>';
                });
                $('#replyReload').html(str)


            },
            error: function () {

            }


        })


    };

    /* 리플 수정 버튼 누를시 모달띄우기*/
    $('#replyReload').on('click', ".reply-edit-btn", function () {

        var seq = $(this).attr('data-src');

        $.ajax({
            url: "replyDetail.do",
            method: "post",
            data: {"seq": seq},
            success: function (data) {

                $('.reply-modal-area').html(data.temp);
                $('.reply-modal-btn').attr("data-src", seq);
                $('#reply-modal-btn').click();
            }
        })


        /*  showSelectMsg("reply_edit(" + seq + ")");*/
    });

    /*리플 업데이트 버튼 누를시*/
    $('.reply-modal-btn').click(function () {
        var content = $('.reply-modal-area').val();
        var seq = $(this).attr('data-src');
        if (content.length < 5) {
            showMsg("내용은 5자 이상 입력해주세요");
            return;
        }

        $.ajax({
            url: "replyedit.do",
            method: "post",
            data: {"seq": seq, "content": content},
            success: function () {
                $('#replyModal .close').click();

                replyReload();

            }
        })

    });
    /*리플 삭제*/
    $('#replyReload').on('click', ".reply-delete-btn", function () {

        var seq = $(this).attr('data-src');
        reply_delete_page(seq)
    });
    /*댓글 삭제*/
    reply_delete_page = function (seq) {

        $.ajax({
            url: "replydel.do",
            method: "post",
            data: {"seq": seq},
            success: function (data) {

                if (data.message == "SUCS") {
                    replyReload();
                } else {
                    setTimeout('showMsg("정상적인 처리가 되지 않았습니다.");', 500);

                }


            }
        })
    };
    replyReload();

})(jQuery);