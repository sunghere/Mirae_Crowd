<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<style>
    .container {
        margin: 0 0;
    }

    #two {
        min-height: 100%;
        padding: 100px 0;
        margin-top: 60px;

        font-family: "Nanum Gothic", "cursive";
    }
</style>
<div id='content_affix' data-offset-top="255">
    <form name="frmForm" id="_frmForm">
        <h1 class="cursive">Detail</h1>
        <div class="row">
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
                        <c:if test="${board.id eq login.id}"> <%--본인인경우--%>
                            <button class="btn black-control" id="_btnUpdate" title="수정" alt="수정하기" type="button">
                                수정
                            </button>
                        </c:if>
                        <c:if test="${board.id eq login.id || login.auth eq 1}"> <%-- 관리자 이거나 본인일경우--%>

                            <button class="btn black-control" id="_btnDelete" title="삭제" alt="삭제" type="button">삭제
                            </button>
                        </c:if>

                        <c:if test="${login.auth eq 1}"> <%--관리자인경우--%>
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
    </form>
</div>


<form name="delfileup" action="fileDownload.do" method="post">
    <input type="hidden" name="filename" value="${board.filename}"/>
    <input type="hidden" name="seq"/>
</form>
<script type="text/javascript">
    $("#_btnUpdate").click(function () { /* 글수정 */
        $("#_frmForm").attr({"method": "post", "target": "_self", "action": "boardupdate.do"}).submit();
    });
    $("#_btnReply").click(function () { /* 답글 */
        $("#_frmForm").attr({"method": "post", "target": "_self", "action": "boardreply.do"}).submit();
    });
    $("#_back").click(function () { /* 글 목록*/
        $("#_frmForm").attr({"method": "post", "target": "_self", "action": "boardlist.do"}).submit();
//        history.back();
    });
    $("#_btnDelete").click(function () { /* 글 삭제*/
        $("#_frmForm").attr({"method": "post", "action": "boarddel.do"}).submit();
//        history.back();
    });

    /* 파일 다운로드 함수*/
    function filedowns(filename, pdsid) {
        var doc = document.delfileup;
        doc.filename.value = filename;
        doc.seq.value = pdsid;
        doc.submit();
    }

</script>
