<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-05-29
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    body {
        background-color: #f0f0f0;
    }

    #two {
        min-height: 90%;
        padding: 100px 0;
        margin-top: 60px;
        background-color: #f0f0f0;;

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
        margin-bottom: 20px;
        padding-bottom: 20px;
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
        font-size: 20px;
        font-family: "Nanum Gothic", "cursive";
        font-weight: 600;
        border-bottom: 2px solid midnightblue;
        margin-bottom: 20px;
        padding: 10px;
    }

    .main-text {
        font-size: 15px;
        font-family: "Nanum Gothic", "cursive";
        font-weight: 300;
        font-stretch: expanded;
        padding: 5% 25%;

    }
</style>
<div class="col-md-3 white-box margin-top-25 side-bar">
    <div class="side-bar-title"><i class="fa fa-user-circle fa-4x" aria-hidden="true"></i></div>
    <div class="side-bar-title">마이페이지</div>
    <ul class="nav nav-pills nav-stacked">
        <li data-toggle="pill" class="active" class="side-info-btn"><a href="#" class="side-bar-text">내 정보 열람</a></li>
        <li data-toggle="pill" class="dropdown">
            <a class="dropdown-toggle side-bar-text" data-toggle="dropdown" href="#" aria-expanded="false">내 펀딩
                <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li class="side-fund-btn"><a href="#" class="side-bar-text">투자</a></li>
                <li class="side-crowd-btn"><a href="#" class="side-bar-text">진행 내역</a></li>
            </ul>
        </li>
        <li data-toggle="pill" class="side-fund-btn"><a href="#" class="side-bar-text">포인트 충전</a></li>
        <li data-toggle="pill" class="side-board-btn"><a href="#" class="side-bar-text">문의글</a></li>
    </ul>

</div>


<div class="col-md-8 white-box margin-top-25" id="myinfo">
    <div class="col-md-12 main-title text-left">개인정보 조회</div>

    <div class="col-md-12 main-text text-left">
        아 이 디&nbsp; <input type="email" class="black-control" value="${login.id}" disabled></div>

    <div class="col-md-12 main-text text-left">
        비밀번호 <input type="password" class="black-control" value="********" disabled>
    </div>

    <div class="col-md-12 main-text text-left">
        포 인 트&nbsp; <input type="text" class="black-control" value="${login.point}" disabled>
    </div>

    <input type="password" id="serti_pwd" class="black-control form-inline" placeholder="PassWord">
    <p class="text-danger">패스워드를 입력해주세요.</p>

</div>


<div class="col-md-8 white-box margin-top-25" id="myfund-list" hidden="hidden">


</div>

<div class="col-md-8 white-box margin-top-25" id="mycrowd-list" hidden="hidden">


</div>

<div class="col-md-8 white-box margin-top-25" id="mypoint" hidden="hidden">


</div>

<div class="col-md-8 white-box margin-top-25" id="myboard" hidden="hidden">


</div>