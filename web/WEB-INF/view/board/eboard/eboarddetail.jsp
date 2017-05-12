<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<form name="frmForm" id="_frmForm" method="post" action="">
    <h1 class="cursive">${login.entname} Detail</h1>
    <div class="row">
        <div class="col-lg-2 col-md-2 col-sm-2"></div>
        <div class="col-lg-8 col-md-8 col-sm-8">
            <table class="table">
                <input type="hidden" name="seq" value="${board.seq}"/>
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
                                   onclick="filedowns('${board.filename}','${board.seq}')"><i class="fa fa-download"></i>${board.filename}</a>
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
                    <td colspan="2"><textarea class="form-control" contenteditable="false"  rows="10" cols="50"
                                              name='content' id="_content">${board.content}</textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="height:50px; text-align:center;">
                        <c:if test="${board.id eq login.id}">
                            <button class="btn black-control" id="_btnUpdate" title="수정" alt="수정하기">수정</button>
                            <button class="btn black-control" id="_btnDelete" title="삭제" alt="삭제">삭제</button>
                        </c:if>
                        <button class="btn black-control" id="_btnReply" title="답글" alt="답글달기">답글</button>
                        <button class="btn black-control" id="_back" title="뒤로가기" alt="뒤로가기">이전</button>

                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</form>
<form name="delfileup" action="fileDownload.do" method="post">
    <input type="hidden" name="filename" value="${board.filename}"/>
    <input type="hidden" name="ent" value="${board.ent}"/>
    <input type="hidden" name="seq"/>
</form>
<script type="text/javascript">
    $("#_btnUpdate").click(function () {
//	alert('글수정하기');
        //submitContents($("#_frmForm"),'boardupdate.do');
        $("#_frmForm").attr({"target": "_self", "action": "eboardupdate.do"}).submit();
    });
    $("#_btnReply").click(function () {
//	alert('답글달기');
        //submitContents($("#_frmForm"),'boardreply.do');
        $("#_frmForm").attr({"target": "_self", "action": "eboardreply.do"}).submit();
    });
    $("#_back").click(function () {
        $("#_frmForm").attr({"method": "post", "action": "eboardlist.do"}).submit();
//        history.back();
    });
    $("#_btnDelete").click(function () {
        $("#_frmForm").attr({"method": "post", "action": "eboardDel.do"}).submit();
//        history.back();
    });
    function filedowns(filename, pdsid) {
        var doc = document.delfileup;
        doc.filename.value = filename;
        doc.seq.value = pdsid;
        doc.submit();
    };
</script>
