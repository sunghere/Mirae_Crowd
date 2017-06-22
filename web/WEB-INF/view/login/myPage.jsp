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
    .crowd-update-title {
        width: 60%;
    }

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
        height: 100%;
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
<!-- CK EDITOR -->
<script type="text/javascript"
        src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

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
                <th class="text-center col-md-3 small visible-md visible-lg">투자/현재/목표</th>
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
                <th class="text-center small visible-md visible-lg">현재/목표</th>
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
    /*var update_crowd; /!*크라우드 수정후 업데이트*!/
    var crowd_reward_modal;/!*크라우드 보상받기 확인창*!/
    var crowd_reward;/!* 크라우드 펀딩 보상받기 이벤트*!/
    var update_load; /!*크라우드 업데이트창 불러오기*!/
    var pwd_check_one; /!*비밀번호 변경-현재 비밀번호 확인창*!/
    var pwd_check_two; /!*비밀번호 변경창*!/
    var reply_delete; /!*마이페이지 리플 삭제*!/
    var load_reply_list; /!*마이페이지 내댓글 불러오기*!/
    var load_crowd_list; /!*마이페이지 내펀딩모집 신청내역 불러오기*!/
    var load_fund_list; /!*마이페이지 내 투자내역 불러오기*!/
    var load_board_list;/!*마이페이지 내 글 리스트 불러오기*!/
    var point_dischager; /!* 포인트 출금하기전 인증*!/
    var point_chager; /!* 포인트 충전하기전 인증*!/
    var point_charge_system;/!*포인트 충전 시스템*!/
    var point_discharge_system;/!*포인트 출금 시스템*!/
    var all_hide; /!*마이페이지 모든창 숨김(init)*!/*/

    var myid='${login.id}';
</script>
<script src="<%=request.getContextPath()%>/js/shmypage.js" rel="script"></script>