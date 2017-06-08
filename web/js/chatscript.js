(function ($) {
    scroll_bottom = function () {
        $('#chatlist').scrollTop($('#chatlist').prop('scrollHeight'));
    };

    function adminlist() {
        $.ajax({
            url: "adminmessagelist.do",
            method: "POST",
            data: {},
            success: function (data) {
                var str = "";
                $.each(data, function (index, val) {
                    str += "<div class='chat_list btn-default' datasrc='" + val.fromid + "'>" + val.fromid + "<span class='badge'>" + val.cnt + "</span></div>";
                });
                $("#chatlist").html(str);
                $("#chat-text").hide();
            }
        });
    }

    $("#chatlist").on('click', '.chat_list', function () {
        go_chatlist("admin", $(this).attr('datasrc'));
        setTimeout("scroll_bottom()", 100);
        setTimeout("scroll_bottom()", 200);
        setTimeout("scroll_bottom()", 300);
        chat_interval=setInterval(function (){chatlist();},1000);
    });

    function go_chatlist(myid, fromid) {
        $.ajax({
            url: "messagelist.do",
            method: "POST",
            data: {"toid": fromid, "fromid": fromid},
            success: function (data) {
                chatlist_load(myid, fromid, data);
            },
            error: function (a, b, c) {

            }
        })
    }

    var sendtouser;

    function chatlist_load(myid, fromid, data) {
        var str = "";
        var temp_chk = 0;
        $.each(data, function (index, val) {
            if (myid == val.fromid) {
                str += "<div class='text-right'><div class='chat_text'>" + val.temp;
            } else {
                if (temp_chk == 0) {
                    if ($('input[name="myauth"]').attr('value') != 1) {

                    } else {
                        $('#chat-title').html("<span id='go-back'><</span>" + val.fromid);
                        sendtouser = val.fromid;

                    }
                    temp_chk = 1;
                }
                str += "<div class='text-left'><div class='chat_text'>" + val.temp;
            }
            str += "</div></div>"

        });
        $("#chatlist").html(str);
        $("#chat-text").show();
//        setTimeout("scroll_bottom()", 100);
//        setTimeout("scroll_bottom()", 200);
//        setTimeout("scroll_bottom()", 300);
    }

    function chatlist() {
        var myid = $("input[name='myid']").attr("value");
        $.ajax({
            url: "messagelist.do",
            method: "POST",
            data: {"toid": myid, "fromid": myid},
            success: function (data) {
            	chatlist_load(myid, "admin", data);
            },
            error: function (a, b, c) {

            }
        });
    }
    
    var chat_interval;

    var sendMessage = function () {
        var fromid = $("input[name='myid']").attr("value");

        var toid;
        if ($('input[name="myauth"]').attr('value') != 1) {
            toid = "admin";
        } else {
            toid = sendtouser;
            fromid = "admin";
        }
        $.ajax({
            url: "sendmessage.do",
            method: "POST",
            data: {
                "toid": toid,
                "fromid": fromid,
                "content": $("#chat-text").val()
            },
            success: function (msg) {
                if (msg.message == "SUCS") {
                    if ($('input[name="myauth"]').attr('value') != 1) {

                        chatlist();
                    } else {
                        go_chatlist("admin", toid, msg);
                    }
                    $("#chat-text").val("");
                } else {
                    showMsg("실패");
                }
            },
            error: function (a, b, c) {

            }
        })
    };
    $("#_btnSend").click(function () {
        sendMessage();
    });

    $(function () {

        $(".chat").click(function () {
            var id = $('input[name="myid"]').attr('value');
            if (id == "" || id == null) {
                showMsg("로그인이 필요합니다.");

            } else {
                $("#chatbtn").click();
                if ($('input[name="myauth"]').attr('value') == 1)
                    adminlist();
                
                else {
                	if($("input[name='myid']").attr("value") != null && $("input[name='myid']").attr("value") !="") {
                		chat_interval=setInterval(function (){chatlist();},1000);
                		setTimeout("scroll_bottom()", 1200);
                	}
            	}
            }
        });

        $('#chatModal').on('hidden.bs.modal', function () {
           clearInterval(chat_interval);
        })
        $("#chat-text").keydown(function (key) {
            if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
                sendMessage();
                setTimeout("scroll_bottom()", 100);
            }
        });

        $("#chat-title").on("click", "#go-back", function () {
            adminlist();
            clearInterval(chat_interval);
            $('#chat-title').html("1:1 문의");
        })

    })
})(jQuery);