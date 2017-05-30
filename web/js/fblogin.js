(function ($) {
    var idcheck = false;

    /*function showMsg(str) {
        $('#myMsg').html(str);

        $('#showMsgBt').click();
    }*/

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=1920439244897668";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
    $.getScript('//connect.facebook.net/ko_KR/sdk.js', function () {
        FB.init({
            appId: '1920439244897668', // 앱 ID
            version: 'v2.7',
            status: true,          // 로그인 상태를 확인
            cookie: true,          // 쿠키허용
            xfbml: true           // parse XFBML
        });


        FB.Event.subscribe('auth.login', function (response) {


        });
    })

    fb_logininit = function () {
        FB.api('/me', function (user) {

            if (user) {
                fbIdCheck(user.id);
                if (idcheck == false) {

                    fbLogin(user);
                } else {
                    showMsg("계정이 없습니다.<br> <small>지금 새로 만들기 <a class='btn cursive' id='fbRegiBt' href='#'>Go<i class='fa fa-user-plus' aria-hidden='true'></i></a></small>")
                }
                /*   $('#fb_image').html(user.name)
                 $('#fb_image').attr("src", 'http://graph.facebook.com/' + user.id + '/picture');
                 $('#fb_name').html(user.name)
                 $('#fb_id').html(user.id)*/
            }
        });
    }

    $('#myMsg').on("click", '#fbRegiBt', function () {
        $('.modalclose').click();
        FB.getLoginStatus(function (response) {
            if (response.status === 'connected') {
                FB.api('/me', function (user) {
                    if (user) {
                        fbIdCheck(user.id);
                        if (idcheck == false) {

                            showMsg("이미 계정이 있습니다.<br> <small>로그인해주세요.</small>");
                        } else {
                            fbRegi(user);
                        }


                        $('#fb_image').html(user.name)
                        $('#fb_image').attr("src", 'http://graph.facebook.com/' + user.id + '/picture');
                        $('#fb_name').html(user.name)
                        $('#fb_id').html(user.id)
                    }
                });

            } else if (response.status === 'not_authorized') {

            } else {

            }
        });

    });

    function fbIdCheck(fbid) {
        $.ajax({
            type: "POST",
            url: "getID.do",
            data: {"id": fbid},
            async: false,
            success: function (msg) {


                if (msg.message == "FAIL") {

                    idcheck = true;
                } else {
                    idcheck = false;
                }
            },
            error: function (a, b, c) {

                showMsg("통신 Error")
                idcheck = false;
            }


        })
    }

    function fbLogin(data) {
        $.ajax({
            type: "POST",
            url: "loginAf.do",
            data: {"id": data.id, "pwd": "facebook"},
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

    function fbRegi(data) {

        $.ajax({
            type: "POST",
            url: "kakaoRegi.do",
            data: {
                "id": data.id,
                "pwd": "facebook",
                "name": data.name,
                "isent": 0,
                "certi": 1
            },
            success: function (msg) {
                if (msg.message == "SUCS") {
                    showMsg("회원가입에 성공하였습니다. 로그인해주세요");

                } else {
                    showMsg("회원가입에 실패하였습니다.");

                }
            },
            error: function (a, b, c) {

                showMsg("통신 Error <br> 관리자에게 문의해주세요")

            }


        })
    }
})(jQuery);