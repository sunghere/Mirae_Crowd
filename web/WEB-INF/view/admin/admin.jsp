<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-05-17
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    #two {
        min-height: 600px;
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
        height: 500px;
        position: absolute;
    }

    .menu-tab ul li a {
        font-size: 15px;
    }

    .menu-tab ul li a, .menu-tab a:hover {
        background-color: black;
        color: white;
    }

    #two {
        padding: 0 100px 0;
    }
</style>
<div class="menu-tab">
    <ul id="menu_tab" class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#" data-toggle="tab" role="tab" data-target="#site_tab"
                                                  aria-controls="site_tab" aria-expanded="false">Site</a>
        </li>
        <li role="presentation"><a href="#" data-toggle="tab" role="tab" data-target="#user_tab"
                                   aria-controls="user_tab" aria-expanded="false">User</a></li>
        <li role="presentation"><a href="#" data-toggle="tab" role="tab" data-target="#crowd_tab"
                                   aria-controls="crowd_tab" aria-expanded="false">Crowd</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade active in" role="tabpanel" id="site_tab" aria-labelledby="Site_tab">
        </div>
        <div class="tab-pane fade" role="tabpanel" id="user_tab" aria-labelledby="User_tab">
            <div class="user-table">
                <table class="scroll-table table table-striped table-responsive">
                    <thead class="thead-inverse">
                    <tr>
                        <th class="text-center">번호</th>
                        <th class="text-center col-md-4">계정명</th>
                        <th class="text-center">
                            <div class="dropdown">이름</div>
                        </th>
                        <th class="text-center visible-md visible-lg">포인트</th>
                        <th class="text-center">기업</th>
                    </tr>
                    </thead>
                    <tbody id="user-list" class="table-overflow">
                    <tr>
                        <td class="text-center" colspan="5"></td>
                    </tr>
                    </tbody>

                </table>
            </div>
        </div>
        <div class="tab-pane fade" role="tabpanel" id="crowd_tab" aria-labelledby="Crowd_tab">
            <table class="scroll-table table table-striped table-responsive">
                <thead class="thead-inverse">
                <tr>
                    <th class="text-center visible-md visible-lg">시작일</th>
                    <th class="text-center">마감일</th>
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
</div>

<script>

    $('#menu_tab a').click(function (e) {
        e.preventDefault();
        var item = $(this);
        item.tab('show');

        if (item.attr('aria-controls') == "site_tab") {

        } else if (item.attr('aria-controls') == "user_tab") {

        } else if (item.attr('aria-controls') == "crowd_tab") {
            load_crowd_list();
        }
    });

    /* 내글 불러오기*/
    var load_board_list = function () {

        $.ajax({
            url: "myBoardList.do",
            method: "post",
            data: {"id": myid},
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
            data: {"id": myid},
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
            url: "crowdlist.do",
            method: "post",
            data: {"id": myid},
            success: function (data) {
                var str = "";

                $.each(data, function (index, val) {
                    str += ' <tr class="_hover_tr">'
                        + '<td class="text-center visible-md visible-lg small">' + val.sdate + '</td>'
                        + '<td class="text-center">' + '~' + val.edate.substr(5) + '</td>'
                        + '<td class="col-md-3"><div class="btn crowd-title crowd-detail-btn" data-src="' + val.seq + '">'
                        + val.titleSub + '</div></td>'
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
</script>