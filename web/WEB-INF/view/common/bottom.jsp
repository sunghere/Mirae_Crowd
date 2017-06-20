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
                <form>

                    <div class="form-group">
                        <div id="showMsgBt" data-toggle="modal" data-target="#alertModal"
                             type="button" hidden="hidden">
                            Subscribe for updates
                        </div>

                    </div>
                </form>
                <span class="pull-right text-muted"><a
                        href="http://sunghere.github.io">Github Blog by Sunghere</a> ©2017 Yoon Sung Hee</span>

            </div>
            <div class="col-xs-12 col-sm-3 column">
                <div class="panel panel-danger">
                    <div class="panel-heading">Warning
                        <button class="btn" id="showAboutBt" data-toggle="modal" data-target="#aboutModal"
                                type="button">
                            more..
                        </button>
                    </div>
                    <div class="panel-body waring-text"> Crowd Funding은 원금을 보장하지 못합니다.<br> 투자 전에 투자위험에 대한 내용을 꼭 확인해
                        주세요

                    </div>

                </div>

            </div>
        </div>
        <br/>

    </div>
</footer>
<%--사진을 나타내기위한 갤러리모달--%>
<div id="galleryModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <img src="" id="galleryImage" class="img-responsive"/>
                <p>
                    <br/>
                    <button type="button" class="btn btn-warning btn-lg center-block" data-dismiss="modal"
                            aria-hidden="true">Close <i
                            class="ion-android-close"></i></button>
                </p>
            </div>
        </div>
    </div>
</div>
<%--경고창--%>
<div id="aboutModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" class="close" id="aboutModal_close" data-dismiss="modal">
                    <span class='loginexit' aria-hidden="true">x</span>
                    <span class="sr-only">Close</span>
                </button>
                <h3 class="title_Type">
                    투자 위험 경고
                </h3>
            </div>
            <div class="modal-body">
                <div class="crowd-fund-term">
                    <h4 class="aboutModal-title">원금손실의 위험이 있습니다.</h4>
                    <p class="aboutModal-text">모든 투자는 원금손실의 위험을 가지고 있습니다. 때문에 투자 시 한 곳에만 투자하지 아니하고 다양한 상품에 분산하여 투자하실 것을
                        권유 드립니다. Crowd funding은 온라인소액투자중개업자로 증권 모집을 중개하는 업을 영위하고 있으며, 원금손실에 대한 책임을 지지 않습니다. 모든 투자는 투자자
                        본인의 의사에 따라
                        결정되어야 합니다.</p>
                    <h4 class="aboutModal-title">환금성이 낮습니다.</h4>
                    <p class="aboutModal-text">비상장기업에 대한 투자는 환금성이 낮습니다. Crowd funding의 중개를 통해 모집된 증권은 1년 이내 전매가 제한되며,
                        매매가 가능한 시점이
                        되더라도 현금으로의 전환이 보장되지는 않습니다. 투자금을 회수하기 위하여 주식의 경우 스타트업 주식거래시장(KSM)에서 거래하거나, 기업의 M&amp;A 또는 주식시장 상장
                        등이 있을 때까지 기다려야 할 수 있습니다. 채무증권이나 주식 관련 채권의 경우에도 특별한 사정이나 조건이 없는 한 만기까지 기다려야 합니다.</p>
                    <h4 class="aboutModal-title">배당가능성이 낮습니다.</h4>
                    <p class="aboutModal-text">Crowd funding의 중개를 통해 증권을 발행하는 비상장 기업은 성장초기단계에 있는 경우가 많기 때문에, 아직 성장해야 하는
                        단계이기 때문에
                        정기 배당을 실시하는 경우가 매우 드뭅니다. 따라서 배당수익을 기대하고 투자를 할 경우 기대한 만큼의 수익을 얻지 못할 수 있습니다.</p>
                    <h4 class="aboutModal-title">지분 희석이 발생할 수 있습니다.</h4>
                    <p class="aboutModal-text">Crowd funding을 통하여 투자한 회사는 지속적으로 성장하기위하여 해당 기업의 정관에 근거하여 유상증자를 실시할 가능성이
                        높습니다. 유상증자로
                        인하여 투자자가 보유한 지분율은 감소될 수 있습니다.</p>
                    <p class="aboutModal-text">모든 투자에는 기대수익에 상응하는 투자위험이 있음을 유의하셔야 합니다. 투자자는 투자결과에 따라 높은 수익을 얻을 수도 있지만,
                        원금의 100%를 손실할 가능성도 있습니다. 해당 사이트에서 이루어지는 투자에 따른 손실 또는 그 위험을 보전해 드리지 못하며,
                        투자에 따른 모든 책임은 각 투자자에게 귀속됩니다. 따라서 투자자가 직접 습득한 정보와 자체적인 투자의 의사결정에 따라 투자에 임하실 것을 당부 드립니다.</p>
                </div>
                <button type="button" class="btn btn-danger btn-lg center-block" data-dismiss="modal"
                        aria-hidden="true">모든 내용을 확인하였습니다.
                </button>
            </div>
        </div>
    </div>
</div>
<%--메시지를 띄우는용도의 창 showMsg사용--%>
<div id="alertModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">


        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" class="close" id="showMsg-close"
                        data-dismiss="modal">
                    <span class='showMsg-close' aria-hidden="true">x</span> <span
                        class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-center" id="myMsg"></p>
            </div>
        </div>
    </div>
</div>
<%--펀드모달--%>
<div id="fund-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-body">
                <div class="pay-agree text-center"><h4 class="mini-warning-header">경고</h4>
                    <div class="text-center mini-warning-body">투자의 위험성을 <br>알고 계신가요?<br>
                        <button class="btn btn-danger" data-toggle="modal" data-target="#aboutModal" type="button">
                            자세히..
                        </button>
                        <br></div>
                    <div class="btn-group check-btn " data-toggle="buttons">
                        <label class="btn btn-danger"><input type="checkbox"><i class="fa fa-check"
                                                                                aria-hidden="true"></i>확인
                        </label></div>
                </div>

                <div class="pay-type" style="display:none">
                    <div class="pay-type-row row">
                        <h4 class="pay-type-header">결제방식을 선택 해 주세요</h4>
                        <div class="form-group" data-toggle="buttons">
                            <div class="btn-group">
                                <label for="kakao-type" class="btn btn-default pay-type-select active">
                                    <input type="radio" name="pay-type" id="kakao-type" autocomplete="off"/>
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span>&nbsp;</span>
                                </label>
                                <label for="kakao-type" id="kakao-label" class="btn btn-default" disabled>
                                    KaKao
                                </label>
                            </div>
                            <div class="btn-group">
                                <label for="app-type" class="btn btn-default pay-type-select">
                                    <input type="radio" name="pay-type" id="app-type" autocomplete="off"/>
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span>&nbsp;</span>
                                </label>
                                <label for="app-type" id="app-label" class="btn btn-default" disabled>
                                    App
                                </label>
                            </div>
                            <div class="btn-group active">
                                <label for="point-type" class="btn btn-default pay-type-select">
                                    <input type="radio" name="pay-type" id="point-type" autocomplete="off" checked/>
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span>&nbsp;</span>
                                </label>
                                <label for="point-type" class="btn btn-default" id="point-label" disabled>
                                    Point
                                </label>
                            </div>
                            <div class="pay-content">
                                <div class="center-block">
                                    <input type="text" class="black-control" placeholder="금액"
                                           onchange="getNumber(this);" onkeyup="getNumber(this);" name="fund-money">
                                    <button type="button" class="btn btn-info fund-btn" data-src="">확인</button>

                                </div>
                                <div class="kakao-content">
                                    <div class="text-center well">카카오톡으로 접속해서 주문코드를 입력해주세요.
                                        <br>주문 코드는
                                        <span class="cbox" id="kakao-order-code">&nbsp;&nbsp;&nbsp;</span>
                                        입니다
                                    </div>
                                </div>
                                <div class="app-content" hidden="hidden">
                                    <div class="well text-center">추후 지원 예정입니다.</div>
                                </div>
                                <div class="point-content" hidden="hidden">
                                    <div class="well text-center"><input type="text" class="black-control mypoint"
                                                                         value="잔액 :${login.point}" disabled></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--로그인창--%>
<div class="modal fade" id="shLogin" style="display: none;" aria-hidden="true">
    <div id="login_bg"
         style="background-color: rgba(0,0,0,0.5); position: fixed; top: 0; left: 0; width: 100%; height: 100%;"></div>
    <div class="modal-dialog login_popup" id="login_popup">
        <div class="modal-content login_popup_content">
            <div class="modal-header line_none">
                <button type="button" class="close" id="login_close" data-dismiss="modal">
                    <span class='loginexit' aria-hidden="true">x</span>
                    <span class="sr-only">Close</span>
                </button>
                <h2 class="title_Type">
                    SH Crowd Login
                </h2>
                <h3 class="subtitle_Type_mb50">
                    환영합니다. 로그인해주세요<i class=""></i>
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
                    다른방법으로 로그인 & 회원가입하기<br><br>
                </h5>
                <div class="text-center">
                    <a id="kakao-login-btn"></a>
                    <br>
                    <br>
                    <div class="fb-login-button" data-width="222px" data-max-rows="1" data-size="large"
                         data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false"
                         data-use-continue-as="false" onlogin="fb_logininit()"></div>
                </div>
                <br>
                <h5 class="subtitle_Type_mb_10">
                    개인 이메일로 회원가입하시겠어요?<br><br>
                </h5>
                <div class="btn_group_center">
                    <span class="btn btn-default btn_style find"><a href="/regi.do"><i class="fa fa-user-plus"
                                                                                       aria-hidden="true"></i>회원가입 하러가기</a></span>
                </div>
                <h5 class="subtitle_Type_mb_10">
                    아이디/비밀번호를 잊으셨나요?<br><br>
                </h5>
                <div class="btn_group_center">
                    <span class="btn btn-default btn_style find" id="pwd-find-btn">비밀번호 찾기</span>
                </div>

            </div>
        </div>
    </div>
</div>

<%--1:1문의 모달--%>
<div id="chatModal" class="modal fade" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" id="chatModal_close" class="close"
                        data-dismiss="modal">
                    <span class='close' aria-hidden="true">x</span> <span
                        class="sr-only">Close</span>
                </button>
                <h3 class="title_Type" id='chat-title'>1:1 문의</h3>
            </div>
            <div class="modal-body">
                <div id="chatlist"></div>
                <input type="text" class="form-control input-lg" placeholder="문의내용을 입력해주세요. 빠른시일내 확인하여 연락드리겠습니다."
                       id="chat-text">
            </div>
        </div>
    </div>
</div>
<div id="last"></div>
<%--리모콘--%>
<div id="_sildebtn">
    <div class="sh-in-search sh-remote">
        <img src="image/shsearch.png" class="search-remote">
        <span hidden="hidden" data-target="#searchModal" data-toggle="modal" id="search-btn"></span>
    </div>
    <div class="sh-in-talk sh-remote">
        <img src="image/shtalk.png" class="chat"> <span hidden="hidden"
                                                        data-target='#chatModal' data-toggle="modal"
                                                        id="chatbtn"></span>
    </div>
    <div class="sh-out-remote sh-remote">
        <img src="image/shall.png"/>
    </div>
</div>
<style>
    .pwd-send-btn, .pwd-input {
        margin-top: 10px;
    }

    .detail-content {
        margin-bottom: 10%;
    }

    .crowd-reply {
        background: lavenderblush;
        padding: 10px 15px;
        border-radius: 15px;
        margin-bottom: 10px;
    }

    .crowd-reply-id {
        text-align: right;
    }

    .crowd-reply-content {
        padding: 5px 0;
        text-indent: 15px;
    }

    .crowd-reply-btn {
        border: 1px solid #e5e5e5;
    }
</style>
<%--디테일 모달--%>
<div id="detailModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-content-main">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">x</span>
                    <span class="sr-only">Close</span>
                </button>
                <h3 class="detail-title"></h3>
            </div>
            <div class="modal-body">
                <div class="row detail-body">
                    <div class="detail-summary col-sm-12 col-md-4"></div>
                    <div class="detail-detail col-sm-12 col-md-8"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<%--검색 모달--%>
<div id="searchModal" class="modal fade" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-md search-md">
        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" id="searchModal_close" class="close"
                        data-dismiss="modal">
                    <span class='close' aria-hidden="true">x</span> <span
                        class="sr-only">Close</span>
                </button>
                <h4 class="search-modal-title"><i class="fa fa-search" aria-hidden="true"></i>빠른
                    검색<span>모든 주제로 검색이 됩니다.</span></h4>
                <input type="text" class="form-control input-lg" id="modal-search-text" placeholder="Search For...">
            </div>
            <div class="modal-body">
                <div id="searchlist"></div>
                <div id="searchresult" hidden="hidden"></div>
            </div>
        </div>
    </div>
</div>

<%--리플--%>
<div id="replyModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content reply-modal-content">
            <div class="modal-header line_none">
                <button type="button" class="close"
                        data-dismiss="modal">
                    <span class='close' aria-hidden="true">x</span> <span
                        class="sr-only">Close</span>
                </button>
                <h3 class="title_Type">Reply Edit</h3>
            </div>
            <div class="modal-body">
                <div class="black-control col-xs-6 col-xs-offset-1 col-sm-offset-1">${login.name}</div>
                <br>

                <textarea
                        class="col-xs-12 col-md-12 col-lg-12 col-sm-12 black-control reply-modal-area"
                        rows="4"></textarea>
                <button class="btn btn-info col-xs-3 col-sm-3 reply-modal-btn" type="button"
                        datasrc="">
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>쓰기
                </button>
            </div>
        </div>
    </div>
</div>

<input type="hidden" class="search_type" data-src="">
<input type="hidden" class="search" data-src="">
<!-- 리플 모달 버튼 -->
<input type="hidden" hidden="hidden" id="reply-modal-btn" data-toggle="modal" data-target="#replyModal"></input>
<!-- 디테일 모달 버튼 -->
<input type="hidden" data-target='#detailModal' data-toggle='modal' id="detail-modal-btn">
<%-- 펀드 모달 버튼--%>
<input type="hidden" data-target='#fund-modal' data-toggle='modal' id="fund-modal-btn">
<script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5KvZP2PadHIlORT_ptWd&submodules=panorama,geocoder"></script>

<script>
    $(function () {
        /* 돈관련 정규식*/
        //[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자
        //[0-9] => \d , [^0-9] => \D
        var rgx1 = /\D/g;
        var rgx2 = /(\d+)(\d{3})/;

        getNumber = function (obj) {

            var num01;
            var num02;
            num01 = obj.value;
            num02 = num01.replace(rgx1, "");
            num01 = setComma(num02);
            obj.value = num01;

        };


        setComma = function (inNum) {

            var outNum;
            outNum = inNum;
            while (rgx2.test(outNum)) {
                outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
            }
            return outNum;

        };
        replaceAll = function (str, searchStr, replaceStr) {
            return str.split(searchStr).join(replaceStr);
        };


        /* 검색결과 이미지 넣기*/
        var searchImageInput = function (src_list, data) {
            $.each(data, function (index, val) {

                var src = src_list[index];
                $('#search-list-img' + val.seq).css({
                    "background-image": 'url("' + src + '")',
                    "-webkit-background-size": "cover",
                    "-moz-background-size": "cover",
                    "-o-background-size": "cover",
                    "background-size": "cover",
                    "background-position": "center"
                });
            })
        };

        /* search 버튼 클릭 */
        $(".search-remote").click(function () {
            $("#search-btn").click();
            setTimeout('$("#modal-search-text").focus()', 500);
        });

        $("#crowdlist").on("click", ".list-main", function () {


            var seq = $(this).attr('data-src');

            if (seq != 9999 && seq != '9999') {
                detail_load(seq, 0);
            }
        });
        var check_like = function (pseq) {

            $.ajax({
                url: "checkLike.do",
                data: {"id": "${login.id}", "pseq": pseq},
                method: "post",
                success: function (data) {

                    if (data.message == "Over") {
                        $('.detail-like').html("<i class='fa fa-heart' aria-hidden='true'></i>");

                    } else {
                        $('.detail-like').html("<i class='fa fa-heart-o' aria-hidden='true'></i>");

                    }

                }
            })
        };
        $(".detail-summary").on("click", ".detail-like", function () {
            var pseq = $(this).attr('data-src');

            var id = "${login.id}";

            if (id == "" || id == null) {
                showMsg("로그인 해주세요<br> <button type='button' class='btn cbox btn-default'onclick='login_open()'>여기</button> 를 눌러 바로 로그인하기");
                return;
            }

            $.ajax({
                url: "crowdLike.do",
                method: "POST",
                data: {
                    "pseq": pseq,
                    "id": "${login.id}"
                }, success: function (data) {

                    if (data.message == "FAIL") {
                        showMsg("잠시후 다시 시도해주세요")
                    } else {

                        $('.like-num[data-src="' + pseq + '"]').html(data.message);
                    }
                    check_like(pseq);


                }, error: function () {

                    showMsg("잠시후 다시 시도해주세요")
                }
            })
        });

        image_hide = function (content) {

            $('.detail-detail').find('img:first-child').prop("hidden", true);
        };

        /* 디테일 로드 */
        detail_load = function (seq, sel) {
            $.ajax({
                url: "detailCrowd.do",
                method: "POST",
                data: {"seq": seq},
                success: function (data) {
                    if (data.endflag == "1") {
                        showMsg("이미 종료되었습니다");
                        return;
                    }

                    var src = imageCarrier(data.content);
                    var str_title = "<span class='cbox detail-cat'>" + data.category + "</span>" + data.titleTemp;

                    var str_summary = "<div class='detail-img'><img class='center-block' src='" + src + "'></div>" +
                        "<div class='detail-like btn btn-default' data-src='" + data.seq + "'><i class='fa fa-heart-o' aria-hidden='true'></i></div>" +
                        "<div>" + data.id + "</div>" +
                        "<div class='detail-date'>" + data.sdate + " ~ " + data.edate + "</div>" +
                        "<div class='detail-goalMoney'>목표금액 : " + money_setComma(data.goalMoney) + "원</div>" +
                        "<div class='progress'>" +
                        "<div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='" + toGoal(data.goalMoney, data.curMoney) + "' " +
                        "aria-valuemin='0' aria-valuemax='100' style='width:" + toGoal(data.goalMoney, data.curMoney) + "%'></div>" +
                        "</div>" +
                        "<div class='progress-info'><span class='card-block info-curMoney float-left'>" + money_setComma(data.curMoney) + "원 달성 (" + toGoal(data.goalMoney, data.curMoney) + "%)</span>" +
                        "<span class='card-block info-date float-right'>" + dateCountdown(data.edate) + "일 남음</span></div>" +
                        "<div style='width: 100%; height:300px'>" + "<span class='detail-fund-btn center-block btn btn-info' data-src='" + data.seq + "'>펀딩하기</span>" + "<div class='center-block'><div id='detail-map' style='height: 300px; width: 300px; margin: 0 auto;'></div></div></div>";

                    var str_detail = "<div class='detail-content'>" + data.content + "</div>" +
                        "<input type='hidden' name='seq' data-src='" + data.seq + "'>" +
                        "<input type='hidden' name='type' data-src='" + data.type + "'>" +
                        "<div class='detail-tag float-right tagbox'>" + data.tag + "</div>" +
                        "<div class='detail-addr tagbox'>" + data.address + "</div>" +
                        "<div class='detail-reply div-clear'>" +
                        "<h2 class='cursive underline'>Reply</h2>" +
                        "<div class='crowd-reply-list'></div>" +
                        "<input type='text' class='black-control crowd-reply-text col-sm-10'>" +
                        "<button class='btn btn-default crowd-reply-btn col-sm-2'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>쓰기</button>" +
                        "</div>";

                    $(".detail-title").html(str_title);
                    $(".detail-summary").html(str_summary);
                    $(".detail-detail").html(str_detail);
                    var detail_latlng = data.latlng.split('*');
                    if (detail_latlng.length > 1) {
                        map_load('detail-map', detail_latlng[0], detail_latlng[1]);
                    }

                    $('.detail-content img').css({"width": "100%", "height": "auto"});
                    $('.detail-content iframe').css({"width": "100%"});
                    check_like(seq);
                    reply_load(seq, data.type);
                    $('.fund-btn').attr('data-src', data.seq);
                    /* 펀드를 위한 값 넣어주는작업*/


                    if (sel == 0) {
                        $('#detail-modal-btn').click();
                    }
                }
            })
        };

        /* 디테일 댓글입력 */
        var reply_add = function () {
            var btype = $("input[name='type']").attr("data-src");
            var bparent = $("input[name='seq']").attr("data-src");
            var text = $.trim($(".crowd-reply-text").val());

            if (text == "" || text == null) {
                showMsg("내용을 입력해주세요");
                return;
            }
            $.ajax({
                url: "replyadd.do",
                method: "POST",
                data: {
                    "id": " ${login.id}",
                    "btype": btype,
                    "content": text,
                    "bparent": bparent
                },
                success: function (data) {
                    if (data.message == "SUCS") {
                        reply_load(bparent, btype);
                        $(".crowd-reply-text").val("");
                        setTimeout("$('.detail-detail').scrollTop($('.detail-detail').prop('scrollHeight'))", 500);
                    } else {
                        alert("실패");
                    }
                }
            })
        };

        $(".detail-detail").on("click", ".crowd-reply-btn", function () {
            if ("${login.id}" != null && "${login.id}" != "") {
                reply_add();

            } else {
                showMsg("로그인 해주세요<br> <button type='button' class='btn cbox btn-default'onclick='login_open()'>여기</button> 를 눌러 바로 로그인하기");

            }

        });

        $(".detail-detail").on("keydown", ".crowd-reply-text", function (key) {
            if (key.keyCode == 13) {
                reply_add();
            }
        });

        /* 디테일 댓글 불러오기 */
        reply_load = function (seq, type) {

            $.ajax({
                url: "replylist.do",
                data: {"seq": seq, "type": type},
                method: "post",
                success: function (data) {
                    var str_reply = "";
                    $.each(data, function (i, val) {
                        str_reply += "<div class='crowd-reply'>" +
                            "<input type='hidden' name='seq' data-src='" + val.bparent + "'>" +
                            "<input type='hidden' name='type' data-src='" + val.btype + "'>" +
                            "<div class='crowd-reply-content' data-src='" + val.seq + "'>" + val.content +
                            "<span class='float-right crowd-reply-del' hidden='hidden'><i class='fa fa-times' aria-hidden='true'></i></span>" +
                            "</div><div class='crowd-reply-id' data-src='" + val.id + "'>" + val.id + "</div>" +
                            "</div>";
                    });
                    $(".crowd-reply-list").html(str_reply);
                }
            })
        };

        login_open = function () {
            $('.showMsg-close').click();
            setTimeout("$('a[data-target=\"#shLogin\"]').click()", 500);
        };
        /* 디테일 댓글 삭제 */
        $(".detail-detail").on("mouseover", ".crowd-reply", function () {
            if ("${login.id}" == $(this).find(".crowd-reply-id").attr("data-src")) {
                $(this).find(".crowd-reply-del").show().css("cursor", "pointer");
            }
        });
        $(".detail-detail").on("mouseleave", ".crowd-reply", function () {
            $(this).find(".crowd-reply-del").fadeOut();
        });
        $(".detail-detail").on("click", ".crowd-reply-del", function () {
            $.ajax({
                url: "replydel.do",
                method: "POST",
                data: {"seq": $(".crowd-reply-content").attr("data-src")},
                success: function (data) {
                    if (data.message == 'SUCS') {
                        var btype = $("input[name='type']").attr("data-src");
                        var bparent = $("input[name='seq']").attr("data-src");
                        reply_load(bparent, btype);
                    }
                }
            })
        });


        /*지도를 불러오는 함수*/
        map_load = function (tagId, lat, lng) {


            var mylatlng = new naver.maps.LatLng(lat, lng);

            var mapOptions = {
                center: mylatlng,
                zoom: 13,
                scaleControl: false,
                logoControl: false,
                mapDataControl: false,
                mapTypeControl: true,
                zoomControl: true,
                minZoom: 1
            };


            var map = new naver.maps.Map(tagId, mapOptions);

            var marker = new naver.maps.Marker({
                position: mylatlng,
                map: map
            });

        };

        /* 모달 검색 */
        $("#modal-search-text").keydown(function (key) {
            if (key.keyCode == 13) {
                $.ajax({
                    url: "searchCategory.do",
                    method: "POST",
                    data: {"search": $("#modal-search-text").val()},
                    success: function (data) {
                        var str = "";
                        $.each(data, function (i, val) {
                            str += "<div class='search-category btn-default' data-src='" + val.category + "'>" + val.category + "<span class='badge'>" + val.cnt + "</span></div>";
                        });
                        $("#searchlist").html(str);

                        $("#searchlist").show();
                        $("#searchresult").hide();
                    }
                })
            }
        });

        /* 서치 모달 카테고리 클릭 시 리스트 */
        $("#searchlist").on("click", ".search-category", function () {
            var cat = $(this).attr('data-src');
            $.ajax({
                url: "cSearch.do",
                method: "POST",
                data: {
                    "rnn": "9999",
                    "search_type": "category",
                    "category": cat,
                    "search": $("#modal-search-text").val()
                },
                success: function (data) {
                    str = "<div class='btn btn-default go-back-search black-control cbox center-block'>뒤로 가기</div>";
                    var src_list = [];
                    $.each(data, function (i, val) {
                        str += "<div class='crowd-detail-btn list-search' data-src='" + val.seq + "'>" +
                            "<div class='search-img-section' id='search-list-img" + val.seq + "'></div>" +
                            "<div class='search-info-section'>" +
                            "<div><strong>" + val.titleTemp + "</strong></div>" +
                            "<div>목표금액 : " + money_setComma(val.goalMoney) + "원</div>" +
                            "<div>현재 " + money_setComma(val.curMoney) + "원 달성 (" + toGoal(val.goalMoney, val.curMoney) + "%)</div>" +
                            "</div></div>";
                        var src = imageCarrier(val.content);
                        src_list.push(src);
                    });
                    $("#searchresult").html(str);
                    searchImageInput(src_list, data);

                    $("#searchlist").hide();
                    $("#searchresult").show();
                }
            })
        });

        /* 모달 - 검색리스트 뒤로가기 */
        $("#searchresult").on("click", ".go-back-search", function () {
            $("#searchlist").show();
            $("#searchresult").hide();

        });

        /*모달 - 검색결과 클릭시*/
        $("#searchresult").on("click", ".list-search", function () {
            var seq = $(this).attr("data-src");
            detail_load(seq, 0);
        });


        /* 비밀번호 찾기 */
        $("#pwd-find-btn").click(function () {
            $('.loginexit').click();
            showMsg("<div><div>가입 시 입력하신 이메일로<br>인증메일이 발송됩니다.</div>" +
                "<div class='pwd-input'><input type='text' class='black-control pwd-send-text' placeholder='이메일을 입력해주세요'></div>" +
                "<div class='btn btn-default cbox pwd-send-btn'>인증메일 발송</div>" +
                "</div>");
        });

        /* 인증메일 발송 */
        $("#myMsg").on("click", ".pwd-send-btn", function () {
            var id = $(".pwd-send-text").val();
            var email_pattern = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
            if (id.length <= 0 || id == "") {
                alert("이메일을 입력해주세요");
            } else if (!email_pattern.test(id)) {
                alert("이메일 형식을 지켜주세요")
            } else {
                $.ajax({
                    type: "POST",
                    url: "getID.do",
                    data: {"id": id},
                    success: function (msg) {
                        if (msg.message == "FAIL") {
                            alert("등록되지 않은 회원입니다");
                        } else {
                            $.ajax({
                                url: "pwdFindmail.do",
                                method: "POST",
                                data: {"id": id},
                                success: function (data) {
                                    $('.showMsg-close').click();

                                    if (data.message == "SUCS") {
                                        setTimeout("showMsg('메일이 발송되었습니다. 해당메일을 확인해주세요')", 500);
                                    } else if (data.message == "SNS") {
                                        setTimeout("showMsg('SNS 계정은 <br>해당 기능을 지원하지 않습니다.')", 500);

                                    } else {
                                        setTimeout("showMsg('메일서버 Error')", 500);

                                    }
                                }
                            })
                        }
                    }
                })
            }
        });

        /* 펀딩하기 버튼*/
        $('.detail-summary').on("click", ".detail-fund-btn", function () {

            if ("${login.id}" != "" && "${login.id}" != null) {
                $('#fund-modal-btn').click();

            } else {
                showMsg("로그인 해주세요<br> <button type='button' class='btn cbox btn-default'onclick='login_open()'>여기</button> 를 눌러 바로 로그인하기");

            }

        });

        /*펀드 제출*/
        $('.fund-btn').click(function () {
            var seletor = $('.pay-type-select.active').attr("for");
            var seq = $(this).attr('data-src');

            if (seletor == "kakao-type") {
            } else if (seletor == "app-type") {


            } else if (seletor == "point-type") {
                point_fund(seq);
            }

        });

        function point_fund(seq) {

            var point = 0;
            var money_filed = $('input[name="fund-money"]');
            var point_val = $('input[name="fund-money"]').val();
            point_val = replaceAll(point_val, ",", "");
            if (point_val != null && point_val != "") {
                point = parseInt(point_val);

            }
            var mypoint = parseInt($('.mypoint').val().split(":")[1]);
            if (point != null && point != "") {

                if (mypoint < point) {
                    showMsg("포인트 잔액이 부족합니다.");


                } else {
                    $.ajax({
                        url: "fundCrowd.do",
                        data: {"pseq": seq, "money": point_val, "id": "${login.id}"},
                        method: "post",
                        success: function (data) {
                            money_filed.val("");

                            if (data.message == "FAIL") {


                            } else {
                                $('.mypoint').val("잔액 :" + data.resultNum);
                                $('.detail-fund-btn').click();
                                detail_load(seq, 1);
                                setTimeout("showMsg('" + point_val + "원 등록 성공하였습니다.')", 500);

                                var item = $('.list-main[data-src="' + seq + '"]');
                                /*해당게시물*/
                                var curMoney_tag = item.find(".info-curMoney");
                                var curmoney = parseInt(curMoney_tag.html().split("원")[0]) + point;
                                /* 원래돈 + 투자핟논*/
                                var per = Math.floor(curmoney / parseInt(curMoney_tag.attr('goal')) * 100);
                                /* 변한돈 / 목표금액 * 100*/
                                var probar = item.find('.progress-bar');
                                /* 내부 진행바*/
                                curMoney_tag.html(curmoney + "원 달성" + "(" + per + "%)");
                                /*현재금액 업데이트*/
                                probar.attr('aria-valuenow', per);
                                /*퍼센트 업데이트*/
                                probar.css('width', per + "%");
                                /*css적용 */
                            }

                        }
                    })
                }

            } else {
                showMsg("출금할 금액을 입력해 주세요");


            }
        }

        /*포인트 결제타입 선택*/
        $(".pay-type-select").click(function () {
            var seletor = $(this).attr("for");
            var app_area = $('.app-content');
            var kakao_area = $('.kakao-content');
            var point_area = $('.point-content');
            app_area.hide();
            kakao_area.hide();
            point_area.hide();
            if (seletor == "kakao-type") {
                kakao_area.show();
            } else if (seletor == "app-type") {
                app_area.show();


            } else if (seletor == "point-type") {
                point_area.show();

            }

        });
        /* 펀딩 모달 애니메이션*/
        var animating = false;

        $('#fund-modal').on("click", ".check-btn", function () {

            if (animating) return false;
            animating = true;

            var cur_page = $(this).parent();
            var next_page = $(this).parent().next();


            //다음페이지 보여주기
            next_page.fadeIn(800);
            cur_page.hide();

            cur_page.animate({opacity: 0}, {
                step: function (now, mx) {
                    //다음페이지 크기를 80 ~ 100%로 만들기위해사용
                    var scale = 0.8 + (1 - now) * 0.2;
                    //2. take current_fs to the right(50%) - from 0%

                    var opacity = 1 - now;
                    next_page.css({'transform': 'scale(' + scale + ')', 'opacity': opacity});
                },
                duration: 800,
                complete: function () {
                    animating = false;
                },
                easing: 'easeInOutBack'
            });
        });
    });
    /*로그인 초기화를 스크립트 밖에서 선언 나중에 재활용을 위해 밖에 선언해줌.*/
    var fb_logininit;
</script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
<script src="<%=request.getContextPath()%>/js/shlogin.js"></script>
<script src="<%=request.getContextPath()%>/js/fblogin.js"></script>
<script src="<%=request.getContextPath()%>/js/chatscript.js"></script>
