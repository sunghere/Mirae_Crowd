<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<form name="frmForm" id="_frmForm" method="post" action="eboardupdateAf.do" enctype="multipart/form-data">

    <h1 class="cursive">${login.entname} Edit</h1>
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
                    <td><input class="form-control" type="text" name="title" value="${board.title}" size="60"/></td>
                </tr>
                <tr>
                    <th>
                        <div class="form-control" style="text-align: center">File</div>
                    </th>
                    <td style="text-align: left">
                        <div class="form-control" style="text-align: center">
                            <input type="file" name="fileload" placeholder="새 파일 등록시 이전파일은 삭제됩니다.">
                            <input type="hidden" name='oldfilename'
                                   value="${board.filename}" size="50"
                                   readonly="readonly"/></div>

                    </td>
                </tr>
                <tr>
                    <td colspan="2"><textarea class="form-control" rows="10" cols="50" name='content'
                                              id="_content">${board.content}</textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="height:50px; text-align:center;">
                        <button type="button"  class="btn black-control" id="_btnUpdate" title="작성" alt="작성하기">작성</button>
                        <button type="button"  class="btn black-control" id="_back" title="작성" alt="뒤로">이전</button>
                        <input type="hidden" name="ent" value="${login.ent}">
                    </td>

                </tr>
                </tbody>
            </table>
        </div>
    </div>
</form>
<script type="text/javascript">
    $("#_btnUpdate").click(function () {
        var title = $("input[name='title']").val();
        var contents = $("textarea[name='content']").val();

        if (title == "" || title == null) {

            alert("제목을 입력해주세요");
        }
        else if (contents == "" || contents == null) {

            alert("내용을 입력해주세요");
        } else {

            $("#_frmForm").attr({"target": "_self", "action": "eboardupdateAf.do"}).submit();
        }
    });
    $("#_back").click(function () {
        $("#_frmForm").attr({"method": "get", "action": "eboarddetail.do"}).submit();

    })
</script>
