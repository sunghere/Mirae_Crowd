<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-04-18
  Time: 오후 2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>

<script>
    $(function () {

        $("#fancy-checkbox-default").change(function () {
            if ($(this).prop("checked") == 1) {
                $(this).prop("checked", 1);
                $("#hidden").attr("value", 1);
                $("#lockchk").html("Lock");
            } else {
                $(this).prop("checked", 0);
                $("#hidden").attr("value", 0);
                $("#lockchk").html("UnLock");
            }
        })
    })

</script>

<h1 class="cursive">Write</h1>
<div class="row">
    <div class="col-lg-2 col-md-2 col-sm-2"></div>
    <div class="col-lg-8 col-md-8 col-sm-8">
        <table class="table">
            <form name="frmForm" id="_frmForm" method="post" action="boardwriteAf.do" enctype="multipart/form-data">

                <input type="hidden"
                       name="hidden"
                       value="0"
                       id="hidden">
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
                                              id="_content"></textarea></td>
                </tr>
            </form>

            <tr>
                <td colspan="2">

                    <div class="form-group checkbox-inline">
                        <input type="checkbox" name="fancy-checkbox-default" id="fancy-checkbox-default"
                               autocomplete="off"/>
                        <div class="btn-group">
                            <label for="fancy-checkbox-default" class="btn black-control">
                                <span class="ion-ios-locked">&nbsp;</span>
                                <span class="ion-ios-unlocked">&nbsp;</span>
                            </label>
                            <label for="fancy-checkbox-default" class="btn black-control active" id="lockchk">
                                UnLock
                            </label>
                        </div>

                    </div>
                    <div class="pull-right">
                        <button class="btn black-control" id="_btnWrite" title="작성" alt="작성하기">작성</button>
                        <button class="btn black-control" id="_back">뒤로가기</button>

                    </div>
                </td>


            </tr>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
    $("#_btnWrite").click(function () {
//            submitContents($("#_frmForm"));
        var title = $("input[name='title']").val();
        var contents = $("textarea[name='content']").val();

        if (title == "" || title == null) {

            alert("제목을 입력해주세요");
        }
        else if (contents == "" || contents == null) {

            alert("내용을 입력해주세요");
        } else {

            $("#_frmForm").attr({"target": "_self", "action": "/boardwriteAf.do"}).submit();
        }

    });
    $("#_back").click(function () {
        history.back();
//            $("#_frmForm").attr({"method": "post", "action": "boardlist.do"}).submit();
    });

</script>
