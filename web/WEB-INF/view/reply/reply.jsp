<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-05-11
  Time: 오전 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="visible-md visible-lg">
    <div class="fixed-alram ">
        <p>
        <p>스크롤하면 댓글이 보여요.</p></p>
        <p>When You scroll,<br> You see the comment.</p>
        <h2><i class="fa fa-arrow-circle-down" aria-hidden="true"></i></h2>
    </div>
</div>
<div id='reply_cotent' class="col-md-5 col-lg-5 col-sm-12 col-xs-12" data-offset-top="455">
    <div class="container-fluid">
        <div class="row">

            <div class="col-xs-12 col-md-12 col-lg-12">
                <div id="replyReload"></div>
                <c:if test="${!empty login}">
                    <div class="sh-replybox sh-replybox-bottom">
                        <div class="col-xs-12 col-lg-2 col-md-2 col-sm-12"></div>
                        <div class="my_reply_cotent col-xs-12 col-lg-8 col-md-8 col-sm-12">
                            <div class="row">
                                <div class="form-group">
                                    <h2 class="cursive underline">Reply Write</h2>
                                    <div class="black-control col-xs-4 col-md-3 col-lg-3 col-sm-4 col-xs-offset-1 col-sm-offset-1">${login.name}</div>
                                    <br>

                                    <textarea
                                            class="col-xs-12 col-md-12 col-lg-12 col-sm-12 black-control replyarea"
                                            rows="4" id="bot-r-area"></textarea>
                                    <button class="btn btn-primary col-xs-3 col-sm-3 replyBt" datasrc="oribt">
                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>쓰기
                                    </button>


                                </div>


                            </div>
                        </div>
                    </div>
                </c:if>
            </div>

        </div>
    </div>
</div>













