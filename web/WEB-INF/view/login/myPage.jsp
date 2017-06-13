<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-05-29
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    #point-group {
        width: 10px;
    }

    .input-group .black-control {
        border-radius: 0;
    }

    .scroll-table tr {
        width: 100%;
        display: inline-table;
        table-layout: fixed;
    }

    .scroll-table table {
        height: 600px;
        display: -moz-groupbox;
    }

    .scroll-table tbody {
        overflow-y: scroll;
        height: 600px;
        padding-right: 3%;
        position: absolute;
    }

    .input-group-addon.black-control {
        border-radius: 290px;
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }

    #pad-5-30 {
        padding: 5% 30%;
    }

    body {
        background-color: #f0f0f0;
    }

    footer {
        background-color: #fff;

    }

    #two {
        min-height: 100%;
        padding: 100px 0;
        margin-top: 60px;
        background-color: #f0f0f0;

        font-family: "Nanum Gothic", "cursive";
    }

    .margin-top-25 {
        margin-top: 25px;
    }

    .white-box {
        background-color: #fff;
        margin: 10px;
        padding: 20px;
        z-index: 8;
        min-height: 80%;

    }

    .table-overflow {
        max-height: 500px;
        overflow: scroll;
    }

    .main-top-navbar {
        background-color: #fff;
    }

    .side-bar {
        min-height: 80%;
    }

    .side-bar-title {
        font-size: 25px;
        font-family: "Nanum Gothic", "cursive";
        font-weight: 500;
        border-bottom: solid 2px midnightblue;
        margin-bottom: 30px;
        padding-bottom: 25px;
    }

    .side-bar-text {

        font-size: 16px;
        font-family: "Nanum Gothic", "cursive";
        font-weight: 300;

    }

    .nav-pills > li.active > a, .nav-pills > li.active > a:focus, .nav-pills > li.active > a:hover {
        color: #fff;
        background-color: midnightblue;
    }

    .main-title {
        font-size: 30px;
        font-family: "Nanum Gothic", "cursive";
        font-weight: 600;
        border-bottom: 2px solid midnightblue;
        margin-bottom: 30px;
        padding: 10px;
        overflow: scroll;
    }

    .main-text {
        font-size: 15px;
        font-family: "Nanum Gothic", "cursive";
        font-weight: 300;
        font-stretch: expanded;
        padding: 5% 20%;

    }

    .sub-text {
        font-weight: 200;
        padding: 0 5px;
        width: 100px;
        display: inline-block;
    }

    .crowd-title > button {
        opacity: 0;
    }

    .crowd-title {
        cursor: text;
        box-shadow: none;
        text-shadow: none;
    }

    .crowd-title:hover > button {
        opacity: 1;
    }

</style>
<div class="col-md-3 white-box margin-top-25 side-bar">
    <div class="side-bar-title"><i class="fa fa-user-circle fa-4x" aria-hidden="true"></i></div>
    <div class="side-bar-title">마이페이지</div>
    <ul class="nav nav-pills nav-stacked">
        <li data-toggle="pill" class="active side-info-btn"><a href="#" class="side-bar-text">내 정보 열람</a></li>
        <li data-toggle="pill" class="dropdown">
            <a class="dropdown-toggle side-bar-text" data-toggle="dropdown" href="#" aria-expanded="false">내 펀딩
                <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li class="side-fund-btn"><a href="#" class="side-bar-text">투자</a></li>
                <li class="side-crowd-btn"><a href="#" class="side-bar-text">진행 내역</a></li>
            </ul>
        </li>
        <li data-toggle="pill" class="side-point-btn"><a href="#" class="side-bar-text">포인트 충전</a></li>
        <li data-toggle="pill" class="side-board-btn"><a href="#" class="side-bar-text">내 글 모아보기</a></li>
        <li data-toggle="pill" class="side-reply-btn"><a href="#" class="side-bar-text">나의 댓글</a></li>
        <c:if test="${login.ent ne 0}">
            <li data-toggle="pill" class="side-ent-btn"><a href="#" class="side-bar-text">기업</a></li>

        </c:if>
    </ul>

</div>


<div class="col-md-8 white-box margin-top-25" id="myinfo">
    <div class="col-md-12 main-title text-left">개인정보 조회</div>

    <div class="col-md-12 main-text text-left">
        <span class="text-center sub-text">아 이 디</span> <input type="email" class="black-control" value="${login.id}"
                                                               disabled></div>

    <div class="col-md-12 main-text text-left">
        <span class="text-center sub-text">비밀번호</span><input type="password" class="black-control"
                                                             value="********"
                                                             disabled>&nbsp;
        <c:if test="${login.isSNS eq '0'}">
            <button type="button" class="pwd-edit-btn btn btn-danger">
                변경
            </button>
        </c:if>
    </div>

    <div class="col-md-12 main-text text-left">
        <span class="text-center sub-text">포 인 트</span> <input type="text" class="black-control mypoint"
                                                               value="${login.point}" disabled>
    </div>

    <div class="col-md-12 main-text text-left">
        <span class="text-center sub-text">이 름</span><input type="text" class="black-control" value="${login.name}"
                                                            disabled>
    </div>
    <c:if test="${login.ent ne 0}">
        <div class="col-md-12 main-title text-left">기업 회원</div>

        <div class="col-md-12 main-text text-left">
            <span class="text-center sub-text">소 속</span> <input type="text" class="black-control"
                                                                 value="${login.entname}" disabled>
        </div>
    </c:if>
    <%--
        <input type="password" id="serti_pwd" class="black-control form-inline" placeholder="PassWord">
        <p class="text-danger">패스워드를 입력해주세요.</p>--%>

</div>


<div class="col-md-8 white-box margin-top-25" id="myfund-list" hidden="hidden">
    <div class="col-md-12 main-title text-left">내 투자내역</div>

    <div id="fund-list-container">
        <table class="scroll-table table table-striped table-responsive">
            <thead class="thead-inverse">
            <tr>
                <th class="text-center">마감일</th>
                <th class="text-center col-md-4">제목</th>
                <th class="text-center col-md-3 small">투자/현재/목표(원)</th>
                <th class="text-center visible-md visible-lg">카테고리</th>
                <th class="text-center visible-md visible-lg">투자일</th>
            </tr>
            </thead>
            <tbody id="fund-list" class="table-overflow">
            <tr>
                <td class="text-center" colspan="5">작성목록이 없습니다.</td>
            </tr>
            </tbody>

        </table>

    </div>

</div>

<div class="col-md-8 white-box margin-top-25" id="mycrowd-list" hidden="hidden">
    <div class="col-md-12 main-title text-left">My Crowd List</div>

    <div id="crowd-list-container">

        <table class="scroll-table table table-striped table-responsive">
            <thead class="thead-inverse">
            <tr>
                <th class="text-center visible-md visible-lg">Start</th>
                <th class="text-center">End</th>
                <th class="text-center col-md-3">제목</th>
                <th class="text-center">현재/목표(원)</th>
                <th class="text-center ">승인여부</th>
                <th class="text-center">마감/보상</th>
            </tr>
            </thead>
            <tbody id="crowd-list" class="table-overflow">
            <tr>
                <td class="text-center" colspan="6">작성목록이 없습니다.</td>
            </tr>
            </tbody>

        </table>

    </div>

</div>

<div class="col-md-8 white-box margin-top-25" id="mypoint" hidden="hidden">
    <div class="col-md-12 main-title text-left">포인트 관리</div>


    <div class="col-md-12 main-text text-left" id="pad-5-30">
        <div class="input-group" id="point-group">
            <span class="input-group-addon text-center black-control">잔액</span>
            <input type="search" class="black-control mypoint" value="${login.point}" disabled>
            <span class="btn btn-info input-group-addon cash-charge-btn">충전</span>
            <span class="btn btn-danger input-group-addon cash-discharge-btn">출금</span>
        </div>

    </div>
    <div class="cash-charge" hidden="hidden">

        <p>결제 시스템에서 발급받은 코드를 입력해주세요.</p>
        <div class="col-md-12 main-text text-center">
            <input type="search" class="black-control" id="code-input" value="">
            <button type="button" class="btn btn-info cash-charge-ok-btn">확인</button>

        </div>


    </div>
    <div class="cash-discharge" hidden="hidden">

        <p>출금할 포인트를 입력해 주세요.</p>
        <p class="danger-text">* 수수료는 1000원입니다. 코드 형식으로 지급되며 24시간안에<br>
            카카오톡 결제시스템에 입력해주세요</p>
        <div class="col-md-12 main-text text-center">
            <input type="search" class="black-control" id="point-input"
                   value="" placeholder="ex) 1000">
            <button type="button" class="btn btn-info cash-discharge-ok-btn">확인</button>

        </div>


    </div>
</div>

<div class="col-md-8 white-box margin-top-25" id="myboard" hidden="hidden">
    <div class="col-md-12 main-title text-left">My Board List</div>
    <div id="board-list-container">

        <table class="scroll-table table table-striped table-responsive">
            <thead class="thead-inverse">
            <tr>
                <th class="text-center">번호</th>
                <th class="text-center col-md-4">제목</th>
                <th class="text-center">조회수</th>
                <th class="text-center visible-md visible-lg">작성일</th>
                <th class="text-center visible-md visible-lg">기업여부</th>
            </tr>
            </thead>
            <tbody id="board-list" class="table-overflow">
            <tr>
                <td class="text-center" colspan="5">작성목록이 없습니다.</td>
            </tr>
            </tbody>

        </table>
    </div>

</div>

<div class="col-md-8 white-box margin-top-25" id="myreply" hidden="hidden">
    <div class="col-md-12 main-title text-left">My Reply List</div>
    <div id="reply-list-container">

        <table class="scroll-table table table-striped table-responsive">
            <thead class="thead-inverse">
            <tr>
                <th class="text-center visible-md visible-lg">종류</th>
                <th class="text-center">번호</th>
                <th class="text-center col-md-4">내용</th>
                <th class="text-center visible-md visible-lg">작성일</th>
                <th class="text-center">Delete</th>
            </tr>
            </thead>
            <tbody id="reply-list" class="table-overflow">
            <tr>
                <td class="text-center" colspan="5">작성목록이 없습니다.</td>
            </tr>
            </tbody>

        </table>
    </div>

</div>

<div class="col-md-8 white-box margin-top-25" id="myent" hidden="hidden">
    <div class="col-md-12 main-title text-left">내 기업정보</div>


</div>


<script>
    /*촉*/
    $('.side-info-btn').click(function () {
        all_hide();

        $('#myinfo').show();

    });
    $('.side-fund-btn').click(function () {
        all_hide();

        $('#myfund-list').show();
        load_fund_list();
    });

    $('.side-crowd-btn').click(function () {
        all_hide();

        $('#mycrowd-list').show();
        load_crowd_list();

    });

    $('.side-point-btn').click(function () {
        all_hide();

        $('#mypoint').show();

    });

    $('.side-board-btn').click(function () {
        all_hide();

        $('#myboard').show();
        load_board_list();

    });
    $('.side-reply-btn').click(function () {
        all_hide();

        $('#myreply').show();
        load_reply_list();

    });
    $('.side-ent-btn').click(function () {
        all_hide();

        $('#myent').show();

    });
    var all_hide = function () {

        $('#myinfo').hide();
        $('#myfund-list').hide();
        $('#mycrowd-list').hide();
        $('#mypoint').hide();
        $('#myboard').hide();
        $('#myreply').hide();
        $('#myent').hide();

        $('.cash-charge').hide();

        $('.cash-discharge').hide();
    };

    /*포인트 충전 관련*/

    $('.cash-charge-btn').click(function () {
        $('.cash-charge').show();
        $('.cash-discharge').hide();

        /*충전화면을 보여줌*/
    });
    $('.cash-discharge-btn').click(function () {
        $('.cash-charge').hide();
        $('.cash-discharge').show();

        /*충전화면을 보여줌*/
    });
    $('.cash-charge-ok-btn').click(function () {
        point_charge_system();

    });
    $('.cash-discharge-ok-btn').click(function () {
        point_discharge_system();


    });
    $('#code-input').keydown(function (key) {

        if (key.keyCode == 13) {/*엔터인경우 실행*/
            point_charge_system();
        }

    });
    $('#point-input').keydown(function (key) {

        if (key.keyCode == 13) {/*엔터인경우 실행*/
            point_discharge_system();
        }

    });
    /* 포인트 출금 fun */
    var point_discharge_system = function () {
        var point = 0;
        var point_val = $('#point-input').val();
        if (point_val != null && point_val != "") {
            point = parseInt(point_val);

        }
        var mypoint = parseInt($('.mypoint').val());

        if (point != null && point != "") {

            if (mypoint < point + 1000) {
                showMsg("출금 가능한 금액을 초과하였습니다.");


            } else {
                point_dischager(point + 1000);
            }

        } else {
            showMsg("출금할 금액을 입력해 주세요");


        }
    };
    /*포인트 충전 fun*/
    var point_charge_system = function () {
        var point_code = $('#code-input').val();

        if (point_code != null && point_code != "") {


            if (point_code == "P1000000") {
                point_chager(1000000);
            } else if (point_code == "P500000") {
                point_chager(500000);

            } else if (point_code == "P100000") {
                point_chager(100000);

            } else if (point_code == "P50000") {
                point_chager(50000);

            } else if (point_code == "P30000") {
                point_chager(30000);

            } else if (point_code == "P10000") {
                point_chager(10000);

            } else if (point_code == "P5000") {
                point_chager(5000);

            } else if (point_code == "P1000") {
                point_chager(1000);

            } else if (point_code == "P500") {
                point_chager(500);

            } else {
                showMsg("유효한 코드가 아닙니다.")

            }


        } else {
            showMsg("코드를 입력해주세요");


        }
    };

    /*포인트 충전 fun을 부르기전 인증처리*/
    var point_chager = function (num) {

        $.ajax({
            url: "pointIn.do",
            data: {
                "epoint": num
            },
            method: "post",
            success: function (data) {


                if (data.message == "SUCS") {


                    $('.cash-charge').hide();
                    $('.mypoint').val(data.resultNum);
                    $('#code-input').val("");
                    showMsg("충전 되었습니다");

                } else {


                    showMsg("충전 실패하였습니다. 관리자에게 문의주세요");

                }
            }

            ,
            error: function () {
                showMsg("통신 Error , 잠시후에 다시 시도해주세요");

            }
        })


    };

    /*포인트 출금을 하기전 인증처리*/
    var point_dischager = function (num) {

        $.ajax({
            url: "pointOut.do",
            data: {
                "epoint": num
            },
            method: "post",
            success: function (data) {


                if (data.message == "SUCS") {


                    $('.cash-discharge').hide();
                    $('.mypoint').val(data.resultNum);
                    $('#code-input').val("");
                    showMsg("출금 되었습니다");

                } else {


                    showMsg("출금 실패하였습니다. 관리자에게 문의주세요");

                }
            }

            ,
            error: function () {
                showMsg("통신 Error , 잠시후에 다시 시도해주세요");

            }
        })


    };


    /* 내글 불러오기*/
    var load_board_list = function () {

        $.ajax({
            url: "myBoardList.do",
            method: "post",
            data: {"id": "${login.id}"},
            success: function (data) {
                var str = "";
                $.each(data, function (index, val) {
                    var temp_date = new Date(val.wdate).format("yyyy-MM-dd");
                    str += ' <tr class="_hover_tr">'
                        + '<td class="text-center visible-md visible-lg">' + val.seq + '</td>'
                        + '<td class="col-md-4"><div class="btn detail-btn"><a href="boarddetail.do?seq=' + val.seq + '">'
                        + val.tempSub + '</a></div></td>'
                        + '<td class="text-center">' + val.readcount + '</td>'
                        + '<td class="text-center  visible-md visible-lg">' + temp_date + '</td>';
                    if (val.ent == 0) {
                        str += '<td class="text-center  visible-md visible-lg">X</td>';

                    } else {
                        str += '<td class="text-center  visible-md visible-lg">O</td>';
                    }
                    str += +'</tr>';
                });


                $('#board-list').html(str);

            }
        })
    };
    /* 내 펀드(투자내역) 불러오기*/
    var load_fund_list = function () {
        $.ajax({
            url: "mFundList.do",
            method: "post",
            data: {"id": "${login.id}"},
            success: function (data) {
                var str = "";

                $.each(data, function (index, val) {
                    str += ' <tr class="_hover_tr">'
                        + '<td class="text-center">' + val.edate.substr(5) + '</td>'
                        + '<td class="col-md-4"><div class="btn crowd-detail-btn" data-src="' + val.seq + '">'
                        + val.titleSub + '</div></td>'
                        + '<td class="text-center col-md-3">' + money_setComma(val.money) + '/' + money_setComma(val.curMoney) + '/' + money_setComma(val.goalMoney) + '</td>';

                    if (val.type == 2) {
                        str += '<td class="text-center visible-md visible-lg">' + '일반' + '</td>';

                    } else {
                        str += '<td class="text-center visible-md visible-lg">' + '보상' + '</td>';

                    }
                    str += '<td class="text-center  visible-md visible-lg">' + val.wdate + '</td>';
                    +'</tr>';
                });


                $('#fund-list').html(str);

            }
        })
    };
    /* 내 크라우드펀딩 모집 신청내역 불러오기*/
    var load_crowd_list = function () {
        $.ajax({
            url: "myReq.do",
            method: "post",
            data: {"id": "${login.id}"},
            success: function (data) {
                var str = "";

                $.each(data, function (index, val) {
                    str += ' <tr class="_hover_tr">'
                        + '<td class="text-center visible-md visible-lg small">' + val.sdate + '</td>'
                        + '<td class="text-center">' + '~' + val.edate.substr(5) + '</td>'
                        + '<td class="col-md-3"><div class="btn crowd-title crowd-detail-btn" data-src="' + val.seq + '">'
                        + val.titleSub + '<button class="crowd-edit-btn btn btn-default"  data-src="' + val.seq + '">수정</button></div></td>'
                        + '<td class="text-center">' + money_setComma(val.curMoney) + '/' + money_setComma(val.goalMoney) + '</td>';

                    if (val.req == 2) {
                        str += '<td class="text-center visible-md visible-lg">' + '<div class="btn btn-danger">거절</div>' + '</td>';

                    } else if (val.req == 1) {
                        str += '<td class="text-center visible-md visible-lg">' + '<div class="btn btn-info">승인</div>' + '</td>';

                    } else {
                        str += '<td class="text-center visible-md visible-lg ">' + '<div class="btn btn-warning">대기</div>' + '</td>';

                    }
                    if (val.endflag == "1" && val.reward == "0")
                        str += '<td class="text-center  visible-md visible-lg">' + '<button type="button" class="btn btn-info reward-btn" data-src="' + val.seq + '">지급받기</button>' + '</td>';
                    else if (val.endflag == "1" && val.reward == "1")
                        str += '<td class="text-center  visible-md visible-lg">' + '<button type="button" class="btn black-control" disabled>지급완료</button>' + '</td>';
                    else if (val.endflag == "0" && val.req == 0)
                        str += '<td class="text-center  visible-md visible-lg">' + '<button type="button" class="btn btn-warning" disabled>미진행</button>' + '</td>';
                    else {
                        str += '<td class="text-center  visible-md visible-lg">' + '<button type="button" class="btn btn-info" disabled>진행중</button>' + '</td>';
                    }
                    str += '</tr>';
                });


                $('#crowd-list').html(str);

            }
        })
    };
    /* 내 댓글 불러오기*/
    var load_reply_list = function () {

        $.ajax({
            url: "myReplylist.do",
            method: "post",
            data: {"id": "${login.id}"},
            success: function (data) {
                var str = "";
                $.each(data, function (index, val) {
                    str += ' <tr class="_hover_tr">';

                    if (val.btype == 1) {
                        str += '<td class="text-center visible-md visible-lg">' + '문의' + '</td>';

                    } else if (val.btype == 2) {
                        str += '<td class="text-center visible-md visible-lg">' + '일반펀드' + '</td>';

                    } else {
                        str += '<td class="text-center visible-md visible-lg">' + '보상' + '</td>';

                    }
                    str += '<td class="text-center">' + val.seq + '</td>'
                        + '<td class="col-md-4"><div class="btn">';
                    if (val.btype == 1) {

                        str += '<a href="boarddetail.do?seq=' + val.bparent + '">'

                    } else {
                        str += '<a class="crowd-detail-btn" data-src="' + val.bparent + '">'

                    }
                    str += val.tempSub + '</a></div></td>'
                        + '<td class="text-center  visible-md visible-lg">' + val.wdate + '</td>'
                        + '<td class="text-center">'
                        + '<button type="button" class="btn btn-danger re-remove-btn" data-src="' + val.seq + '">삭제</button></td>'
                        + '</tr>';
                });


                $('#reply-list').html(str);

            }
        })
    };
    /*댓글 삭제*/
    var reply_delete = function (seq) {

        $.ajax({
            url: "replydel.do",
            method: "post",
            data: {"seq": seq},
            success: function (data) {

                if (data.message == "SUCS") {
                    load_reply_list();
                } else {
                    setTimeout('showMsg("정상적인 처리가 되지 않았습니다.");', 500);

                }


            }
        })
    };
    /* 비밀번호 변경 2단계창 클릭*/
    var pwd_check_one = function () {
        var cur_pwd = $('#cur-pwd').val();
        if (cur_pwd.length < 2) {
            alert("비밀번호를 입력해주세요");

        } else {
            $('.showMsg-close').click();

            $.ajax({
                url: "pwdCheck.do",
                method: "post",
                data: {"id": "${login.id}", "pwd": cur_pwd},
                success: function (data) {


                    if (data.message == "SUCS") {
                        setTimeout("showMsg(\"변경할 비밀번호를 입력하세요<br> <input type='password' class='black-control' id='edit-pwd'><button type='button' class='btn btn-danger' id='pwd-edit-btn3' onclick='pwd_check_two()'>확인</button>\");", 500)


                    } else {
                        alert("비밀번호가 일치하지않습니다.");

                    }
                }
            })
        }
    };
    var pwd_check_two = function (edit_pwd) {
        if (edit_pwd.length < 5) {
            alert("비밀번호를 제대로 입력해주세요 (6자이상)");

        } else {
            $('.showMsg-close').click();

            $.ajax({
                url: "pwdUpdate.do",
                method: "post",
                data: {"id": "${login.id}", "pwd": edit_pwd},
                success: function (mes) {


                    if (mes.message == "SUCS") {
                        $('.showMsg-close').click();

                        setTimeout(" showMsg('변경 되었습니다.')", 500);

                    } else {
                        setTimeout(" showMsg('실패.')", 500);
                    }
                }
            })
        }

    };


    /*비밀번호 변경 1단계창 띄우기*/
    $('.pwd-edit-btn').click(function () {


        setTimeout("showMsg(\"현재 비밀번호를 입력하세요<br><br> <input type='password' class='black-control' id='cur-pwd'><button type='button' class='btn btn-danger' id='pwd-edit-btn2' onclick='pwd_check_one()'>확인</button>\");", 100)


    });

    /* 리플 삭제 버튼*/
    $('#reply-list').on("click", ".re-remove-btn", function () {
        var seq = $(this).attr('data-src');

        showSelectMsg("reply_delete(" + seq + ")");
    });

    /* 크라우드 상세보기*/
    $('#fund-list,#reply-lis').on("click", ".crowd-detail-btn", function () {
        var seq = $(this).attr('data-src');

        detail_load(seq, 0);

    });
    $('#crowd-list').on("click", ".crowd-edit-btn", function () {
        var seq = $(this).attr("data-src");

        alert(seq + "수정하기로")

    });
    /*크라우드 보상받기 모달*/

    $('#crowd-list').on('click', '.reward-btn', function () {


        var seq = $(this).attr("data-src");
        showSelectMsg("crowd_reward(" + seq + ")");


    });
    /* 크라우드 펀딩 보상받기 이벤트*/
    var crowd_reward = function (seq) {

        $.ajax({
            url: "cfinish.do",
            data: {"id": "${login.id}", "seq": seq},
            method: "post",
            success: function (data) {

                if (data.message == "SUCS") {

                    load_crowd_list();
                    setTimeout('showMsg("재 로그인시 반영됩니다.")', 500);

                } else {
                    setTimeout('showMsg("잠시후 다시 시도해주세요")', 500);

                }
            }
        })

    }
</script>