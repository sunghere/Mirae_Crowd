<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<form name="frmForm" id="_frmForm" method="post" action="eboardreplyAf.do" enctype="multipart/form-data">

    <h1 class="cursive">${login.entname} Reply</h1>
    <div class="row">
        <div class="col-lg-2 col-md-2 col-sm-2"></div>
        <div class="col-lg-8 col-md-8 col-sm-8">
            <table class="table">
                <input type="hidden" name="seq" value="${board.seq}"/>
                <input type="hidden" name="ent" value="${login.ent}">
                <thead>
                <tr class="id">
                    <th>
                        <div class="form-control" style="text-align: center">ID</div>
                    </th>
                    <td>
                        <div class="form-control"><input type="hidden" name="id" value="${login.id}">${login.id}</div>
                    </td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>
                        <div class="form-control" style="text-align: center">Title</div>
                    </th>
                    <td><input class="form-control" type="text" name="title" size="60"/></td>
                </tr>
                <tr>
                    <th>
                        <div class="form-control" style="text-align: center">File</div>
                    </th>
                    <td style="text-align: left">
                        <input type="file" name="fileload"></td>
                </tr>
                <tr>
                    <td colspan="2"><textarea class="form-control" rows="10" cols="50" name='content'
                                              id="_content">




                        * 이전글 *
                제  목 : ${board.title}
                작성자 : ${board.id}
                내  용 : ${board.content}
            </textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="height:50px; text-align:center;">
                        <button type="button" class="btn black-control" id="_btnReply" title="작성" alt="작성하기">작성</button>
                        <button type="button" class="btn black-control" id="_back" title="작성" alt="뒤로">이전</button>

                    </td>

                </tr>
                </tbody>
            </table>
        </div>
    </div>
</form>

<script type="text/javascript">
    $("#_back").click(function () {

        $("#_frmForm").attr({"method": "get", "action": "eboarddetail.do"}).submit();

    })
    $("#_btnReply").click(function () {
        var title = $("input[name='title']").val();
        var contents = $("textarea[name='content']").val();

        if (title == "" || title == null) {

            alert("제목을 입력해주세요");
        }
        else if (contents == "" || contents == null) {

            alert("내용을 입력해주세요");
        } else {

            $("#_frmForm").attr({"target": "_self", "action": "eboardreplyAf.do"}).submit();
        }
    });


</script>
