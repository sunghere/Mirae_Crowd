<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>

<c:if test="${!empty login}">
    <script type="text/javascript">
        alert("이미 로그인 하셨습니다.");
        location.href = "main.do";
    </script>
    <%
        if (true) return;
    %>
</c:if>

<div class="mb-3">
    <div class="col-lg-2 col-md-2 col-sm-1">

    </div>
    <div class="col-lg-3 col-md-3 text-center">
        <div class="feature">
            <i class="icon-lg ion-android-laptop wow fadeIn" data-wow-delay=".3s"
               style="visibility: visible; animation-delay: 0.3s; animation-name: fadeIn;"></i>
            <h3>회원가입</h3>
            <p class="text-muted">정보를 입력해주세요</p>
        </div>
    </div>
    <form action="regiAf.do" method="post" id="_frmForm" name="frmForm">

        <div class="col-md-5 text-center">
            <div class="text-center">

                <table class="table">

                    <tr>
                        <td colspan="2">
                            <label></label>
                            <input type="search" data-msg="ID" id="_userid" class="form-control input-sm"
                                   placeholder="ID"
                                   name="id"
                                   size="15" onkeyup="check(this)"/>

                        </td>
                        <td class="text-center cursive">
                            <h4>
                                <div id="checkr"></div>
                            </h4>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" colspan="2">
                            <label></label>
                            <input type="search" data-msg="이름" id="_name" class="form-control input-sm"
                                   placeholder="NAME"
                                   name="name"
                                   size="15"/>
                        </td>
                        <td class="text-center"></td>

                    </tr>

                    <tr>
                        <td style="text-align: left" colspan="2">
                            <label></label>
                            <input type="password" data-msg="패스워드" id="_pwd" class="form-control input-sm"
                                   placeholder="PWD"
                                   name="pwd"
                                   size="30"/>
                        </td>
                        <td></td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="email" data-msg="이메일" id="_email" required data-form-field="Email"
                                   class="form-control input-sm"
                                   placeholder="E-MAIL"
                                   name="email" onkeyup="checkEmailf(this)"
                                   size="30"/>
                        </td>
                        <td class="text-center cursive">
                            <h4>
                                <div id="emailcheckr"></div>
                            </h4>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="btn-group" data-toggle="buttons">
                                <label class="entbt btn btn-info active" value="nomal">
                                    <input type="radio" name="options" checked>일반회원
                                </label>
                                <label class="entbt btn btn-info" value="ent">
                                    <input type="radio" name="options"> 기업회원
                                </label>
                            </div>
                            <input type="hidden" id="_isent" name="isent" value="0">
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr id="_entHidden" hidden="hidden">
                        <td colspan="2">
                            <label></label>
                            <input type="search" data-msg="ENTNAME" id="_entname" class="form-control input-sm"
                                   placeholder="ENTNAME"
                                   name="entname"
                                   size="15" onkeyup="entcheck(this)"/>

                        </td>
                        <td class="text-center cursive">
                            <h4>
                                <div id="entcheckr"></div>
                            </h4>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" colspan="2">
                            <button class="btn btn-primary btn-default" type="submit" id="_btnRegi" title="회원가입"
                                    disabled="disabled">회원가입
                            </button>
                        </td>

                        </button>
                        <td style="text-align: left;">
                            <button class="btn btn-primary btn-default" type="button" id="_btnLogin" title="이전">이전
                            </button>
                        </td>

                    </tr>
                </table>
            </div>
        </div>

    </form>
</div>

<script type="text/javascript">
    var checkEnt = true;
    var checkID = false;
    var checkEmail = false;

    function checkRegi() {

        if (checkEnt == true && checkID == true && checkEmail == true) {
            $("#_btnRegi").attr("disabled", false);

        } else {
            $("#_btnRegi").attr("disabled", "disabled");
        }

    }


    $("#_btnLogin").click(function () {
        location.href = 'login.do';
    });
    $("#_btnRegi").click(function () {
        if ($("#_userid").val() == "") {
            alert($("#_userid").attr("data-msg") + " 입력해 주십시요.");
            $("#_userid").focus();
        } else if ($("#_name").val() == "") {
            alert($("#_name").attr("data-msg") + " 입력해 주십시요.");
            $("#_name").focus();
        } else if ($("#_email").val() == "") {
            alert($("#_email").attr("data-msg") + " 입력해 주십시요.");
            $("#_email").focus();
        }
        else if ($("#_pwd").val() == "") {
            alert($("#_pwd").attr("data-msg") + " 입력해 주십시요.");
            $("#_pwd").focus();
        }
        else {
            $('_frmForm').submit();
        }


    });
    $(".entbt").click(function () {
        var bt = this;
        if ($(this).attr("value") == "ent") {
            $("#_entname").val("");

            checkEnt = false;
            $("#_isent").attr("value", 1);
            $("#_entHidden").show();
            checkRegi();

        } else if ($(this).attr("value") == "nomal") {
            checkEnt = true;
            $("#entcheckr").html("");
            $("#_entname").val("");
            $("#_isent").attr("value", 0);

            $("#_entHidden").hide();
            checkRegi();

        }

    });

    function checkEmailf(textid) {
        var text = $(textid).val();
        var email_pattern = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        if (text.lenght == 0) {

            checkEmail = false;
            checkRegi();

            return;
        }

        if (email_pattern.test(text) == true) {
            $("#emailcheckr").html("<i class='icon ion-ios-checkmark-outline'></i>");
            checkEmail = true;
            checkRegi();
            return;
        } else {
            checkEmail = false;
            checkRegi();


            $("#emailcheckr").html("<div class='help-tip'><p>잘못된<br>이메일 형식입니다.</p></div>");
            return;

        }
    }
    function check(textid) {


        var text = $(textid).val();
        //공백 금지
        //var blank_pattern = /^\s+|\s+$/g;(/\s/g
        var blank_pattern = /[\s]/g;
        if (blank_pattern.test(text) == true) {
            checkID = false;
            checkRegi();
            $("#checkr").html("<div class='help-tip'><p>공백은<br>사용할수 없습니다.</p></div>").css({
                "display": "inline-block",
                "color": "red"
            });
            return;
        }


        var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

        if (special_pattern.test(text) == true) {
            $("#checkr").html("<div class='help-tip'><p>특수문자는<br>사용할수 없습니다.</p></div>").css({});
            checkID = false;
            checkRegi();

            return;
        }


        if (!(text == "") && !(text == null))
            $.ajax({
                type: "POST",
                url: "getID.do",
                data: {"id": text},
                success: function (msg) {


                    if (msg.message == "FAIL") {
                        checkID = true;
                        checkRegi();
                        $("#checkr").html("<i class='icon ion-ios-checkmark-outline'></i>").css({
                            "display": "inline-block",
                            "color": "blue"
                        });
                    } else {
                        $("#checkr").html("<i class='icon ion-ios-close'></i>").css({
                            "display": "inline-block",
                            "color": "red"
                        });
                        checkID = false;
                        checkRegi();

                    }
                },
                error: function (a, b, c) {

                    checkID = false;
                    checkRegi();
                    $("#checkr").html("ERROR").css({"display": "inline-block", "color": "red"});

                }


            })
        else {
            $('input[name=id]').focus();
            $("#checkr").html("<i class='icon ion-android-create'></i>").css({"color": "red"});
            checkID = false;
            checkRegi();

        }
    }

    function entcheck(textid) {


        var text = $(textid).val();
        if (!(text == "") && !(text == null))
            $.ajax({
                type: "POST",
                url: "checkEntName.do",
                data: {"entname": text},
                success: function (msg) {


                    if (msg.message == "FAIL") {
                        $("#entcheckr").html("<i class='icon ion-ios-close'></i>").css({
                            "display": "inline-block",
                            "color": "red"
                        });
                        checkEnt = false;
                        checkRegi();
                    } else {


                        checkEnt = true;
                        checkRegi();
                        $("#entcheckr").html("<i class='icon ion-ios-checkmark-outline'></i>").css({
                            "display": "inline-block",
                            "color": "blue"
                        });
                    }
                },
                error: function (a, b, c) {

                    checkEnt = false;
                    checkRegi();

                    $("#entcheckr").html("ERROR").css({"display": "inline-block", "color": "red"});

                }


            })
        else {
            $('#_entname').focus();
            $("#entcheckr").html("<i class='icon ion-android-create'></i>").css({"color": "red"});
            checkEnt = false;
            checkRegi();
        }
    }
</script>
