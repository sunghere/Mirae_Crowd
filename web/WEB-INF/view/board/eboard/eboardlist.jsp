<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>

<input type="hidden" name="ent" value="${login.ent}"/>

<div class="row mb-3">
    <div class="col-lg-3 col-md-4">s
        <div class="card">
            <img class="card-img-top img-responsive" src="//placehold.it/740x180/bbb/fff?text=..." alt="Card image cap">
            <div class="card-block">
                <c:if test="${login.ent ne 0}">
                    <h4 class="card-title">${login.entname}</h4>
                    <p class="card-text"><a href="/eboardlist.do?entcheck=1" class="btn btn-info">Enterprise Board</a>
                    </p>
                </c:if>
                <c:if test="${login.ent ne 0}">
                    <h3 class="card-title">${login.entname} 기업 회원님 환영합니다.</h3>
                    <p class="card-text">이곳은 ${login.entname} 기업회원내의 게시물만 보입니다. </p>
                    <p class="card-text">
                        Try the corporate bulletin board now.</p>
                    <p class="card-text">기업회원만의 게시판!</p>
                </c:if>
            </div>
        </div>

        <div class="card card-inverse bg-inverse">
            <div class="card-block">
                <blockquote>
                    <h3 class="card-title">지금 투자해보세요.</h3><br>

                    <p class="card-text">
                        당신의 도움으로 <br>프로젝트가 완성됩니다.</p>
                    <p class="card-text">

                        This project needs your help.<cite title="Source Title"> - SH Crowd</cite></p>
                    <a href="main.do" class="btn btn-warning">후원하러가기</a>
                </blockquote>
            </div>
        </div>

    </div>
    <jsp:useBean id="uboard" class="com.sung.hee.help.BoardBean"/>

    <div class="col-lg-9 col-md-8 col-xs-12">
        <div class="box_border" style="margin-top:5px; margin-bottom: 10px;">
            <form name="frmForm1" id="_frmFormSearch" method="post" action="" role="search">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1" aria-expanded="true">
                                <span class="sr-only"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                                <li style="vertical-align: middle"><select class="selectpicker" data-width='100%'
                                                                           id="_s_category"
                                                                           name="s_category">
                                    <option value="title" <c:if
                                            test="${s_category eq 'title' ||(s_category eq '') or empty s_category} }"> selected="selected" </c:if>>
                                        제목
                                    </option>
                                    <option value="contents" <c:if
                                            test="${s_category eq 'contents'}"> selected="selected" </c:if>>
                                        내용
                                    </option>
                                    <option value="titlecon" <c:if
                                            test="${s_category eq 'titlecon'}"> selected="selected" </c:if>>
                                        제목+내용
                                    </option>
                                </select></li>
                                <li class="form-inline" style="vertical-align: middle">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="black-control form-control"
                                                   placeholder="Search"
                                                   id="_s_keyword"
                                                   name="s_keyword" value="${s_keyword}"/>
                                            <span id="_btnSearch" class="input-group-addon black-control">&nbsp;<i
                                                    class="icon ion-search"></i>&nbsp;
                                            </span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <input type="hidden" name="pageNumber" id="_pageNumber"
                           value="${(empty pageNumber)?0:pageNumber}"/>
                    <input type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
                           value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
                </nav>
            </form>
        </div>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead class="thead-inverse">
                <tr>
                    <th class="text-center">글번호</th>
                    <th class="text-center">제목</th>
                    <th class="text-center">작성자</th>
                    <th class="text-center visible-md visible-lg">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty boardlist}">
                    <tr>
                        <td class="text-center" colspan="4">첫글을 작성해 보세요.</td>
                    </tr>
                </c:if>
                <c:forEach items="${boardlist}" var="board" varStatus="vs">
                    <jsp:setProperty property="depth" name="uboard"
                                     value="${board.depth}"/>
                    <tr class="_hover_tr">
                        <td class="text-center">${boardlist.size()-board.rnn+1}</td>
                        <td style="text-align: left">
                            <jsp:getProperty property="reply"
                                             name="uboard"/>
                            <c:if test="${board.del eq 1}">
                                <s>삭제된 글입니다.</s>
                            </c:if>
                            <c:if test="${board.del eq 0}">
                                <c:if test="${board.hidden  eq 1}">
                                    <c:if test="${login.name eq board.id || login.auth eq 1}">
                                        <a href='eboarddetail.do?seq=${board.seq}'>
                                            <i class="icon ion-ios-unlocked"></i>${board.tempSub}</a>

                                    </c:if>
                                    <c:if test="${login.name != board.id && login.auth ne 1}">
                                        <i class="icon ion-ios-locked"></i>비밀글

                                    </c:if>
                                </c:if>
                                <c:if test="${board.hidden eq 0}">
                                    <a href='eboarddetail.do?seq=${board.seq}'>
                                            ${board.tempSub}</a>
                                </c:if>
                                <c:if test="${board.filename ne '' && !empty board.filename}">
                                    <i class="fa fa-file-archive-o"></i>
                                </c:if>
                            </c:if>
                        </td>
                        <td class="text-center">${board.id}</td>
                        <td class="text-center visible-md visible-lg">${board.readcount}</td>
                    </tr>
                </c:forEach>
                </tbody>
                <tr>
                    <td colspan="3" class="text-center">
                    </td>
                    <td>
                        <c:if test="${!empty login }">
                            <a id="_btnAdd" class="btn black-control">글쓰기</a>
                        </c:if>
                    </td>
                </tr>
                <tr class="text-center">
                    <td colspan="4">
                        <div id="paging_wrap">
                            <jsp:include page="/WEB-INF/view/common/paging.jsp" flush="false">
                                <jsp:param value="${pageNumber}" name="pageNumber"/>
                                <jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen"/>
                                <jsp:param value="${recordCountPerPage}" name="recordCountPerPage"/>
                                <jsp:param value="${totalRecordCount}" name="totalRecordCount"/>
                            </jsp:include>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<!-- <a href='boardwrite.do'>글쓰기</a> -->

<form name="frmForm2" id="_frmForm" method="get" action="eboardwrite.do">
</form>
<!-- <hr/> -->
<!-- <hr/> -->
<!-- <p><input type="text" maxlength="6" size="6" id="colorpickerField1" value="00ff00" /></p> -->
<!-- <p><input type="text" maxlength="6" size="6" id="colorpickerField3" value="0000ff" /></p> -->
<!-- <p><input type="text" maxlength="6" size="6" id="colorpickerField2" value="ff0000" /></p> -->

<script type="text/javascript">
    $(function () {
        $("._hover_tr").mouseover(function () {
            $(this).children().css("background-color", "#F0F5FF");
        });

        $("._hover_tr:nth-child(odd)").mouseout(function () {
            $(this).children().css("background-color", "#f9f9f9");

        });

        $("._hover_tr:nth-child(even)").mouseout(function () {
            $(this).children().css("background-color", "#FFFFFF");
        });
    });
    $("#_btnAdd").click(function () {
//        alert('글쓰기');
        $("#_frmForm").attr({"target": "_self", "action": "eboardwrite.do"}).submit();
    });
    $("#_btnSearch").click(function () {
        //alert('search');
        $("#_frmFormSearch").attr({"target": "_self", "action": "eboardlist.do"}).submit();
    });
    function goPage(pageNumber) {
        $("#_pageNumber").val(pageNumber);
        $("#_frmFormSearch").attr("target", "_self").attr("action", "eboardlist.do").submit();
    }
</script>