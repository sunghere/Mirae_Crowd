<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<footer id="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-6 col-sm-3 column">
                <h4>Information</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Products</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Benefits</a></li>
                    <li><a href="#">Developers</a></li>
                </ul>
            </div>
            <div class="col-xs-6 col-sm-3 column">
                <h4>About</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Delivery Information</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms &amp; Conditions</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-3 column">
                <h4>Stay Posted</h4>
                <form>
                    <div class="form-group">
                        <input type="text" class="form-control" title="No spam, we promise!"
                               placeholder="Tell us your email">
                    </div>
                    <div class="form-group">
                        <button class="btn black-control" data-toggle="modal" data-target="#alertModal" type="button">
                            Subscribe for updates
                        </button>
                    </div>
                </form>
            </div>
            <div class="col-xs-12 col-sm-3 text-right">
                <h4>Follow</h4>
                <ul class="list-inline">
                    <li><a href="http://twitter.com/Sunghee____" title="Twitter"><i
                            class="icon-lg ion-social-twitter-outline"></i></a>&nbsp;
                    </li>
                    <li><a href="http://facebook.com/sunghee4" title="Facebook"><i
                            class="icon-lg ion-social-facebook-outline"></i></a>&nbsp;
                    </li>
                    <li><a href="http://github.com/sunghere" title="GitHub"><i
                            class="icon-lg ion-social-github-outline"></i></a>&nbsp;
                    </li>
                </ul>
            </div>
        </div>
        <br/>
        <span class="pull-right text-muted small"><a
                href="http://sunghere.github.io">Github Blog by Sunghere</a> ©2017 Yoon Sung Hee</span>
    </div>
</footer>
<div id="galleryModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <img src="" id="galleryImage" class="img-responsive"/>
                <p>
                    <br/>
                    <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i
                            class="ion-android-close"></i></button>
                </p>
            </div>
        </div>
    </div>
</div>
<div id="aboutModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h2 class="text-center">Landing Zero Theme</h2>
                <h5 class="text-center">
                    A free, responsive landing page theme built by BootstrapZero.
                </h5>
                <p class="text-justify">

                </p>
                <p class="text-center"><a href="http://www.bootstrapzero.com">Download at BootstrapZero</a></p>
                <br/>
                <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true"> OK</button>
            </div>
        </div>
    </div>
</div>
<div id="alertModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body">
                <h2 class="text-center">Nice Job!</h2>
                <p class="text-center">You clicked the button, but it doesn't actually go anywhere because this is only
                    a demo.</p>
                <p class="text-center"><a href="http://www.bootstrapzero.com">Learn more at BootstrapZero</a></p>
                <br/>
                <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">OK <i
                        class="ion-android-close"></i></button>
            </div>
        </div>
    </div>
</div>
<c:if test="${!empty login}">
    <div id="infomodal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                    <h3 class="text-center">${login.id}</h3>
                    <hr>
                    <p class="text-left"><i class="fa fa-user">${login.name}</i></p>
                    <p class="text-left"><i class="fa fa-envelope-o">${login.email}</i></p>
                    <p class="text-left"><i class="fa fa-envelope-o">${login.point}</i></p>
                    <br/>
                    <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">확인 <i
                            class="ion-android-close"></i></button>
                </div>
            </div>
        </div>
    </div>
</c:if>
<c:if test="${empty login}">
    <div class="modal fade" id="shLogin" style="display: none;" aria-hidden="true">
        <div id="login_bg"
             style="background-color: rgba(0,0,0,0.5); position: fixed; top: 0; left: 0; width: 100%; height: 100%;"></div>
        <div class="modal-dialog login_popup" id="login_popup">
            <div class="modal-content login_popup_content">
                <div class="modal-header line_none">
                    <button type="button" class="close" id="login_close" data-dismiss="modal">
                        <span class='loginexit' aria-hidden="true">X</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h2 class="title_Type">
                        SH Crowd Login
                    </h2>
                    <h3 class="subtitle_Type_mb50">
                        Welcome ^ ^ // login plz<i class=""></i>
                    </h3>
                </div>
                <div class="modal-body">
                    <form id="loginform">
                        <input type="text" id="login_userid" data-msg="ID" class="form-control input-sm"
                               placeholder="ID"
                               name="id"
                               size="15">
                        <br>
                        <input type="password" id="login_pwd" data-msg="패스워드" title="패스워드" class="form-control"
                               placeholder="PASSWORD" name="pwd"
                               size="15"><br>

                        <div id='loginErrmsg' class="subtitle_Type_mb50"></div>
                        <br>
                        <button class="btn btn-primary btn-default" type="button" id="login_btnLogin" title="로그인">로그인
                        </button>
                        <button class="btn btn-primary btn-default" type="button" id="login_btnRegi" title="회원가입">회원가입
                        </button>

                    </form>
                </div>
                <div class="modal-footer">
                    <h5 class="subtitle_Type_mb_10">
                        아이디/비밀번호를 잊으셨나요?<br><br>
                    </h5>
                    <div class="btn_group_center">
                        <a href="idfind.do" class="btn_style find">아이디 찾기 / 비밀번호찾기</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</c:if>
<div id="last"></div>
<script>

    $(function () {
        var height = $('#footer').height() + 50;
        $("#content_wrap").css({"margin-bottom": height});
    })
    $(window).resize(function () {
            var height = $('#footer').height() + 50;
            $("#content_wrap").css({"margin-bottom": height});
        }
    );

</script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
<script src="<%=request.getContextPath()%>/js/wow.js"></script>
<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
<script src="<%=request.getContextPath()%>/js/shlogin.js"></script>
