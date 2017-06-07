<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<div id='content_affix' data-offset-top="455">
    <form name="frmForm" id="_frmForm">
        <h1 class="cursive">${login.entname} Detail</h1>
        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2"></div>
            <div class="col-lg-8 col-md-8 col-sm-8">
                <table class="table">
                    <input type="hidden" name="seq" value="${board.seq}"/>
                    <input type="hidden" name="type" value="${board.type}"/>
                    <thead>
                    <tr class="id">
                        <th>
                            <div class="form-control" style="text-align: center">ID</div>
                        </th>
                        <td>
                            <div class="form-control">${board.id}</div>
                        </td>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <th>
                            <div class="form-control" style="text-align: center">Title</div>
                        </th>
                        <td>
                            <div class="form-control">${board.temp}</div>
                        </td>
                    </tr>

                    <tr>

                        <th>
                            <div class="form-control" style="text-align: center">File</div>
                        </th>
                        <c:if test="${empty board.filename || board.filename eq ''}">
                            <td style="text-align: left"></td>
                        </c:if>

                        <c:if test="${!empty board.filename}">

                            <td style="text-align: left">
                                <div class="form-control">
                                    <a class="btn btn-xs btn-primary"
                                       onclick="filedowns('${board.filename}','${board.seq}')"><i
                                            class="fa fa-download"></i>${board.filename}</a>
                                </div>
                            </td>
                        </c:if>
                    </tr>

                    <tr>
                        <th>
                            <div class="form-control" style="text-align: center">WDate</div>
                        </th>
                        <td style="text-align: left" class="">
                            <div class="form-control">${board.wdate}</div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea class="form-control" contenteditable="false" rows="10" cols="50"
                                                  name='content' id="_content">${board.content}</textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height:50px; text-align:center;">
                            <c:if test="${board.id eq login.id}">
                                <button class="btn black-control" id="_btnUpdate" title="수정" alt="수정하기" type="button">
                                    수정
                                </button>
                                <button class="btn black-control" id="_btnDelete" title="삭제" alt="삭제" type="button">삭제
                                </button>
                            </c:if>
                            <c:if test="${login.auth eq 1}">
                                <button class="btn black-control" id="_btnReply" title="답글" alt="답글달기" type="button">
                                    답글
                                </button>
                            </c:if>
                            <button type="button" class="btn black-control" id="_back" title="뒤로가기" alt="뒤로가기">이전
                            </button>

                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
    <c:if test="${!empty login}">
        <div class="container-fluid">
            <div class="margin15 row">
                <div class="col-xs-12 col-lg-2 col-md-2 col-sm-12"></div>
                <div class="my_reply_cotent col-xs-12 col-lg-8 col-md-8 col-sm-12">
                    <div class="row">
                        <div class="form-group replygroup">
                            <h2 class="cursive underline">Reply Write</h2>
                            <div class="black-control col-xs-4 col-md-3 col-lg-3 col-sm-4 col-xs-offset-1 col-sm-offset-1">${login.name}</div>
                            <br>

                            <textarea class="col-xs-12 col-md-12 col-lg-12 col-sm-12 black-control replyarea"
                                      rows="4" id="r-area"></textarea>
                            <button class="btn btn-primary col-xs-2 col-sm-2 col-md-2 replyBt" type="button">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>쓰기
                            </button>


                        </div>

                    </div>
                </div>

            </div>
        </div>
    </c:if>
</div>
<form name="delfileup" action="fileDownload.do" method="post">
    <input type="hidden" name="filename" value="${board.filename}"/>
    <input type="hidden" name="ent" value="${board.ent}"/>
    <input type="hidden" name="seq"/>
</form>
<script type="text/javascript">
    $("#_btnUpdate").click(function () {
//	alert('글수정하기');
        //submitContents($("#_frmForm"),'boardupdate.do');
        $("#_frmForm").attr({"method": "post", "target": "_self", "action": "boardupdate.do"}).submit();
    });
    $("#_btnReply").click(function () {
//	alert('답글달기');
        //submitContents($("#_frmForm"),'boardreply.do');
        $("#_frmForm").attr({"method": "post", "target": "_self", "action": "boardreply.do"}).submit();
    });
    $("#_back").click(function () {
        $("#_frmForm").attr({"method": "post", "target": "_self", "action": "boardlist.do"}).submit();
//        history.back();
    });
    $("#_btnDelete").click(function () {
        $("#_frmForm").attr({"method": "post", "action": "boarddel.do"}).submit();
//        history.back();
    });
    function filedowns(filename, pdsid) {
        var doc = document.delfileup;
        doc.filename.value = filename;
        doc.seq.value = pdsid;
        doc.submit();
    }
</script>
