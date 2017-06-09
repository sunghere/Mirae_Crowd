(function ($) {
    var idcheck = false;

    $(function () {
        $("#login_btnLogin").click(function () {
            if ($("#login_userid").val() == "") {
                alert($("#login_userid").attr("data-msg") + " 입력해 주십시요.");
                $("#login_userid").focus();
            } else if ($("#login_pwd").val() == "") {
                alert($("#login_pwd").attr("data-msg") + " 입력해 주십시요.");
                $("#login_pwd").focus();
            } else {
                //$("#_frmForm").attr("target","ifrmSpace").submit();
//                $("#loginform").attr({"target": "_self", "action": "loginAf.do", "method": "post"}).submit();
                $.ajax({
                    type: "POST",
                    url: "loginAf.do",
                    async: false,
                    data: {"id": $("input[id='login_userid']").val(), "pwd": $("input[id='login_pwd']").val()},
                    success: function (msg) {


                        if (msg.message == "SUCS") {
                            $(".loginexit").click();
                            location.href = "this.do";
                        } else {
                            $('#loginErrmsg').html("<i class='icon ion-ios-close'></i>아이디 혹은 비밀번호를 확인해 주세요").css({
                                "color": "red"
                            });
                        }
                    },

                    error: function (a, b, c) {
                        $('#loginErrmsg').html("<i class='icon ion-ios-close'></i>로그인 인증 실패").css({
                            "color": "red"
                        });

                    }
                })
            }
        });

        $("#login_pwd").keypress(function (event) {
            if (event.which == '13') {
                event.preventDefault();
                $("#login_btnLogin").click();
            }
        });

    });
    $("#login_btnRegi").click(function () {
        location.href = 'regi.do';
    });
    $("#login_userid").keypress(function (event) {
        if (event.which == '13') {
            event.preventDefault();
            $("#login_pwd").focus();
        }
    });
    /*    //id저장 쿠키부분
     var user_id = $.cookie("user_id");
     //alert(user_id);
     if (user_id != null) {
     $("#login_userid").val(user_id);
     $("#login_chk_save_id").prop("checked", true);
     }*/


    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('9722eb00c23ea017214101975e874dcf');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function (authObj) {
            // 로그인 성공시, API를 호출합니다.
            Kakao.API.request({
                url: '/v1/user/me',
                success: function (res) {


                    if (res.kaccount_email_verified == "false") {
                        showMsg("이메일 인증이 안된 계정입니다.");
                        Kakao.Auth.logout();
                        return;
                    }
                    kakaoIdCheck(res.kaccount_email);
                    if (idcheck == false) {

                        kakaoLogin(res);
                    } else {
                        showMsg("계정이 없습니다.<br> <small>지금 새로 만들기 <a class='btn cursive' id='kakaoRegiBt' href='#'>Go<i class='fa fa-user-plus' aria-hidden='true'></i></a></small>", res)
                    }

                },
                fail: function (error) {
                    // alert(JSON.stringify(error));
                }
            });
        },
        fail: function (err) {
            // alert(JSON.stringify(err));
        }
    });
    $('#myMsg').on("click", '#kakaoRegiBt', function () {
        $('.modalclose').click();
        Kakao.Auth.login({
            success: function (authObj) {
                // 로그인 성공시, API를 호출합니다.
                Kakao.API.request({
                    url: '/v1/user/me',
                    success: function (res) {


                        if (res.kaccount_email_verified == "false") {
                            showMsg("이메일 인증이 안된 계정입니다.");
                            Kakao.Auth.logout();
                            return;
                        }
                        kakaoIdCheck(res.kaccount_email);

                        if (idcheck == false) {

                            showMsg("이미 계정이 있습니다.<br> <small>로그인해주세요.</small>");
                        } else {
                            kakaoRegi(res);
                        }

                    },
                    fail: function (error) {
                        // alert(JSON.stringify(error));
                    }
                });
            },
            fail: function (err) {
                // alert(JSON.stringify(err));
            }
        });
    });
    function kakaoIdCheck(kakaoid) {
        $.ajax({
            type: "POST",
            url: "getID.do",
            data: {"id": kakaoid},
            async: false,
            success: function (msg) {


                if (msg.message == "FAIL") {

                    idcheck = true;
                } else {
                    idcheck = false;
                }
            },
            error: function (a, b, c) {

                showMsg("통신 Error");
                idcheck = false;
            }


        })
    }

    function kakaoLogin(data) {
        $.ajax({
            type: "POST",
            url: "loginAf.do",
            data: {"id": data.kaccount_email, "pwd": data.id},
            success: function (msg) {
                if (msg.message == "SUCS") {
                    $(".loginexit").click();
                    location.href = "this.do";
                } else {
                    $('#loginErrmsg').html("<i class='icon ion-ios-close'></i>아이디 혹은 비밀번호를 확인해 주세요").css({
                        "color": "red"
                    });
                }
            },
            error: function (a, b, c) {


            }


        })
    }

    function kakaoRegi(data) {

        $.ajax({
            type: "POST",
            url: "kakaoRegi.do",
            data: {
                "id": data.kaccount_email,
                "pwd": data.id,
                "name": data.properties.nickname,
                "ent": 0,
                "isSNS": "1",
                "certi": 1
            },
            success: function (msg) {
                if (msg.message == "SUCS") {
                    showMsg("회원가입에 성공하였습니다. 로그인해주세요");

                } else {
                    showMsg("회원가입에 실패하였습니다.");
                    Kakao.Auth.logout();

                }
            },
            error: function (a, b, c) {

                showMsg("통신 Error <br> 관리자에게 문의해주세요");
                Kakao.Auth.logout();

            }


        })
    }

    showMsg = function (str) {
        $('#myMsg').html(str);

        $('#showMsgBt').click();
    };


    showSelectMsg = function (func) {
        showMsg("정말 그렇게 하시겠습니까? <br><br><div class='text-center'> <button data-dismiss='modal' class='btn btn-info' onclick='" + func + "'>Yes</button><button data-dismiss='modal' class='btn btn-danger' data-dismiss='modal'>No</button></div>")

    }
})(jQuery);