<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-05-17
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="pay-agree"><h4 class="mini-warning-header">경고</h4>
    <div class="text-center mini-warning-body">투자의 위험성을 <br>알고 계신가요?
        <button class="btn" data-toggle="modal" data-target="#aboutModal" type="button">
            알아보기
        </button>
        <br></div>
    <div class="btn-group check-btn" data-toggle="buttons">
        <label class="btn btn-danger"><input type="checkbox"><i class="fa fa-check" aria-hidden="true"></i>확인
        </label></div>
</div>

<div class="pay-type" style="display:none">
    <h4 class="">결제방식을 선택 해 주세요</h4>
    <div class="form-group" data-toggle="buttons">
        <div class="btn-group">
            <label for="kakao-type" class="btn btn-default" active>
                <input type="radio" name="pay-type" id="kakao-type" autocomplete="off"/>
                <span class="glyphicon glyphicon-ok"></span>
                <span>&nbsp;</span>
            </label>
            <label for="kakao-type" id="kakao-label" class="btn btn-default" disabled>
                KaKao
            </label>
        </div>
        <div class="btn-group">
            <label for="app-type" class="btn btn-default">
                <input type="radio" name="pay-type" id="app-type" autocomplete="off"/>
                <span class="glyphicon glyphicon-ok"></span>
                <span>&nbsp;</span>
            </label>
            <label for="app-type" id="app-label" class="btn btn-default" disabled>
                App
            </label>
        </div>
        <div class="btn-group active">
            <label for="point-type" class="btn btn-default">
                <input type="radio" name="pay-type" id="point-type" autocomplete="off" checked/>
                <span class="glyphicon glyphicon-ok"></span>
                <span>&nbsp;</span>
            </label>
            <label for="point-type" class="btn btn-default" id="point-label" disabled>
                Point
            </label>
        </div>
    </div>
</div>
