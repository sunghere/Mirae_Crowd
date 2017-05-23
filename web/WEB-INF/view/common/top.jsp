<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="nows" class="java.util.Date"/>
<nav id="topNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" title="메인" href="main.do"><img src="image/logo/7.png" class="mylogo img-responsive"></a>
        </div>
        <div class="navbar-collapse collapse" id="bs-navbar">
            <ul class="nav navbar-nav">
                <li>
                    <a title="메인" href="main.do"><i class="fa fa-home"></i>Main</a>
                </li>
                <li>
                    <a title="일정" href="boardlist.do"><i class="fa fa-list-alt"></i>Board</a>
                </li>
                <li>
                    <a title="회원가입" href="mycal.do"><i class="fa fa-calendar"></i>Calendar</a>
                </li>
                <c:if test="${ !empty login && login.auth eq 3 }">
                    <li>
                        <a title="투표" href="/polllist.do">Vote</a>
                    </li>
                </c:if>
                <c:if test="${!empty login && login.auth eq 1}">

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a title="관리자메뉴" href="/crowdAdd.do">Manage</a>
                            </li>
                            <li>
                                <a title="투표생성" href="/pollmake.do">Vote</a>
                            </li>
                            <li>
                                <a title="관리자메뉴" href="/admin.do">Manage</a>
                            </li>
                        </ul>
                    </li>

                </c:if>
                <li id="last_scroll">
                    <a title="화면내리기" class="page-scroll" href="#last">Last<span class="caret"></span></a>
                </li>
                <li id="top_scroll">
                    <a title="화면올리기" class="page-scroll" href="header">Top<span class="dropup">
    <span class="caret"></span>
</span></a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <c:if test="${ !empty login  && login.name ne ''}">
                    <li>
                        <a class="" data-toggle="modal" data-target="#infomodal" title="내정보"
                           href="#"><i class="fa fa-info-circle"></i>${login.name}</a>
                    </li>
                </c:if>
                <c:if test="${ !empty login  && login.id ne ''}">
                    <li>
                        <input type="hidden" name="myid" value="${login.id}">
                        <a href="/logout.do" title="로그아웃"><i class="fa fa-sign-out"></i>logout</a>
                    </li>

                </c:if>

                <c:if test="${empty login}">
                    <li>
                        <a title="회원가입"
                           href="regi.do"><i class="fa fa-user-plus"></i>Sign up</a>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal" title="로그인" data-target="#shLogin" class="icon06">
                            <i class="fa fa-sign-in"></i>Login
                        </a>
                    </li>
                </c:if>

            </ul>
        </div>
    </div>
</nav>
