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
                        href="http://sunghere.github.io">Github Blog by Sunghere</a> ©2017 Yoon Sung Hee & Jiyoon Lee(Thank you)</span>

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
<%--개인정보창--%>
<c:if test="${!empty login}">
    <div id="infomodal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body">
                    <h3 class="text-center">${login.id}</h3>
                    <hr>
                    <p class="text-left"><i class="fa fa-user">${login.name}</i></p>
                    <p class="text-left"><i class="fa fa-star-half-o">${login.point}</i></p>
                    <br/>
                    <button type="button" class="btn btn-danger center-block" data-dismiss="modal" aria-hidden="true">닫기<i
                            class="ion-android-close"></i></button>
                </div>
            </div>
        </div>
    </div>
</c:if>
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
                    다른방법으로 로그인하기<br><br>
                </h5>
                <div class="text-center">
                    <a id="kakao-login-btn"></a>
                    <br>
                    <br>
                    <div class="fb-login-button" data-width="222px" data-max-rows="1" data-size="large"
                         data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false"
                         data-use-continue-as="false" onlogin="fb_logininit()"></div>
                </div>

                <h5 class="subtitle_Type_mb_10">
                    아이디/비밀번호를 잊으셨나요?<br><br>
                </h5>
                <div class="btn_group_center">
                    <span class="btn_style find" data-target='#pwdModal' data-toggle="modal" id="pwdbtn">비밀번호찾기</span>
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
                <input type="text" class="form-control input-lg" id="chat-text">
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
    .detail-body {
        font-size: 14px;
    }

    .detail-body img {
        max-width: 100%;
        margin-bottom: 10px;
    }

    .detail-title {
        font-size: 25px;
        font-weight: bold;
        text-align: center;
        line-height: 35px;
    }

    .detail-fund {
        border-radius: 3px;
        float: right;
        margin: 5px 20px;
    }

    .detail-cat {
        font-size: 20px;
        margin-right: 10px;
    }

    .detail-summary {
        height: 80%;
        overflow: hidden;
    }

    .detail-summary div {
        margin-bottom: 10px;
    }

    .detail-goalmoney {
        font-size: 20px;
        font-weight: bold;
    }

    .detail-like {
        position: absolute;
        right: 5%;
        display: inline-block;
        font-size: 40px;
        color: #FFB2AF;
        padding-top: 15px;
    }

    .detail-detail {
        height: 80%;
        position: relative;
        overflow-y: scroll;
    }

    #detailModal > div {
        width: 90%;
    }
    
    .search-img-section {width:40%; float:left; height:100px;}
    
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
<script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5KvZP2PadHIlORT_ptWd&submodules=panorama,geocoder"></script>

<script>
    $(function () {
    	var searchImageInput = function (src_list, data) {
            $.each(data, function (index, val) {

                var src = src_list[index];
                $('#list-img' + val.seq).css({
                    "background-image": 'url("' + src + '")',
                    "-webkit-background-size": "cover",
                    "-moz-background-size": "cover",
                    "-o-background-size": "cover",
                    "background-size": "cover",
                    "background-position": "center"
                });
            })
        }
    	
        /* search 버튼 클릭 */
        $(".search-remote").click(function () {
            $("#search-btn").click();
            setTimeout('$("#modal-search-text").focus()', 500);
        })

        $("#crowdlist").on("click", ".list-main", function () {


            var seq = $(this).attr('data-src');

            if (seq != 9999 && seq != '9999') {
                detail_load(seq);
            }
        })
        var check_like = function (pseq) {

            $.ajax({
                url: "checkLike.do",
                data: {"id": "${login.id}", "pseq": pseq},
                method: "post",
                success: function (data) {

                    if (data.message == "Over") {
                        $('.detail-like').html("<i class='fa fa-heart' aria-hidden='true'></i>");
                        return;
                    } else {
                        $('.detail-like').html("<i class='fa fa-heart-o' aria-hidden='true'></i>");
                        return;
                    }

                }
            })
        }
        $(".detail-summary").on("click", ".detail-like", function () {
            var pseq = $(this).attr('data-src');

            var id = "${login.id}";

            if (id == "" || id == null) {
                showMsg("로그인 해주세요")
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
        })

        image_hide = function (content) {

            $('.detail-detail').find('img:first-child').prop("hidden", true);
        }

        detail_load = function (seq) {
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
                    var str_title = "<span class='cbox detail-cat'>" + data.category + "</span>" + data.titleTemp +
                        "<span class='detail-fund btn btn-info'>펀딩하기</span>";

                    var str_summary = "<div class='detail-img'><img src='" + src + "'></div>" +
                        "<div class='detail-like btn btn-default' data-src='" + data.seq + "'><i class='fa fa-heart-o' aria-hidden='true'></i></div>" +
                        "<div>" + data.id + "</div>" +
                        "<div class='detail-date'>" + data.sdate + " ~ " + data.edate + "</div>" +
                        "<div class='detail-goalmoney'>목표금액 : " + money_setComma(data.goalmoney) + "원</div>" +
                        "<div class='progress'>" +
                        "<div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='" + toGoal(data.goalmoney, data.curmoney) + "' " +
                        "aria-valuemin='0' aria-valuemax='100' style='width:" + toGoal(data.goalmoney, data.curmoney) + "%'></div>" +
                        "</div>" +
                        "<div class='progress-info'><span class='card-block info-curmoney float-left'>" + money_setComma(data.curmoney) + "원 달성 (" + toGoal(data.goalmoney, data.curmoney) + "%)</span>" +
                        "<span class='card-block info-date float-right'>" + dateCountdown(data.edate) + "일 남음</span></div>" +
                        "<div style='width: 100%; height:300px'><div id='detail-map' style='height: 300px; width: 100%'></div></div>";

                    var str_detail = "<div>" + data.content + "</div>";

                    $(".detail-title").html(str_title);
                    $(".detail-summary").html(str_summary);
                    $(".detail-detail").html(str_detail);
                    var detail_latlng = data.latlng.split('*');
                    if (detail_latlng.length > 1) {
                        map_load('detail-map', detail_latlng[0], detail_latlng[1]);
                    }
                    check_like(seq);
                    $('#detail-modal-btn').click();
                }
            })
        }

        var map_load = function (tagId, lat, lng) {


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

        }
        
        $("#modal-search-text").keydown(function(key){
        	if(key.keyCode == 13) {
        		$.ajax({
        			url: "searchCategory.do",
        			method: "POST",
        			data: {"search":$("#modal-search-text").val()},
        			success: function(data) {
        				str = "";
        				$.each(data, function(i, val) {
        					str+="<div class='search-cat btn-default' data-src='"+val.category+"'>"+val.category+"<span class='badge'>"+val.cnt+"</span></div>";
        				})
        				$("#searchlist").html(str);
        			}
        		})
        	}
        });
        
        $("#searchlist").on("click", ".search-cat", function() {
        	var cat =  $(this).attr('data-src');
        	$.ajax({
        		url:"cSearch.do",
        		method: "POST",
        		data: {
        			"search_type":"category",
        			"category": cat,
        			"search":$("#modal-search-text").val()
        		},
        		success: function(data) {
        			str = "";
      				var src_list = new Array();
        			$.each(data, function(i, val){
        				str += "<div class='crowd-detail-btn'>"+
	        				"<div class='search-img-section' id='list-img"+val.seq+"'></div>"+
	        				"<div>"+val.titleTemp+"</div>"+
	        				"</div>";
        				var src = imageCarrier(val.content);
        				src_list.push(src);
        			})
        			$("#searchlist").html(str);
        			searchImageInput(src_list, data);
        		}
        	})
        })

    })


</script>


<%--검색 모달--%>
<div id="searchModal" class="modal fade" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header line_none">
                <button type="button" id="searchModal_close" class="close"
                        data-dismiss="modal">
                    <span class='close' aria-hidden="true">x</span> <span
                        class="sr-only">Close</span>
                </button>
                <input type="text" class="form-control input-lg" id="modal-search-text">
            </div>
            <div class="modal-body">
                <div id="searchlist"></div>
            </div>
        </div>
    </div>
</div>

<%--리플--%>
<div id="replyModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
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
                        rows="4" id="bot-r-area"></textarea>
                <button class="btn btn-primary col-xs-3 col-sm-3 reply-modal-btn" type="button"
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
<button type="button" hidden="hidden" id="reply-modal-btn" data-toggle="modal" data-target="#replyModal"></button>
<!-- 디테일 모달 버튼 -->
<input type="hidden" data-target='#detailModal' data-toggle='modal' id="detail-modal-btn">
<script>
    /*로그인 초기화를 스크립트 밖에서 선언 나중에 재활용을 위해 밖에 선언해줌.*/
    var fb_logininit;
</script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easing.min.js"></script>
<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
<script src="<%=request.getContextPath()%>/js/shlogin.js"></script>
<script src="<%=request.getContextPath()%>/js/fblogin.js"></script>
<script src="<%=request.getContextPath()%>/js/chatscript.js"></script>
