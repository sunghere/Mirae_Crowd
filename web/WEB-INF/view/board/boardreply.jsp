<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<form name="frmForm" id="_frmForm" method="post" action="boardreplyAf.do" enctype="multipart/form-data">

    <h1 class="cursive">Reply</h1>
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
                        <button class="btn black-control" id="_btnReply" title="작성" alt="작성하기">작성</button>
                        <button class="btn black-control" id="_back" title="작성" alt="뒤로">이전</button>

                    </td>

                </tr>
                </tbody>
            </table>
        </div>
    </div>
</form>

<script type="text/javascript">
    $("#_back").click(function () {
        var title = $("input[name='title']").val();
        var contents = $("textarea[name='content']").val();

        if (title == "" || title == null) {

            alert("제목을 입력해주세요");
        }
        else if (contents == "" || contents == null) {

            alert("내용을 입력해주세요");
        } else {


            $("#_frmForm").attr({"method": "get", "action": "boarddetail.do"}).submit();
        }
    })
    $("#_btnReply").click(function () {
//        alert('답글달기');
//        submitContents($("#_frmForm"));
        $("#_frmForm").attr({"target": "_self", "action": "boardreplyAf.do"}).submit();
    });

    /* //'저장' 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
     function submitContents(elClickedObj) {
     // 에디터의 내용이 textarea에 적용된다.
     oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);

     // 에디터에 입력된 내용의 검증은 이곳에서
     // document.getElementById("ir1").value 값을 이용해서 처리한다.

     try {
     // 이 라인은 현재 사용 중인 폼에 따라 달라질 수 있다.
     //elClickedObj.form.submit();
     elClickedObj.submit();
     } catch (e) {
     }
     }

     var oEditors = [];
     nhn.husky.EZCreator.createInIFrame({
     oAppRef: oEditors,
     elPlaceHolder: "_content",
     sSkinURI: "./se2/SmartEditor2Skin.html",
     fCreator: "createSEditor2"
     });*/
</script>
