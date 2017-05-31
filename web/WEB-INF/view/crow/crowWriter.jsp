<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-05-16
  Time: 오후 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<script type="text/javascript"
        src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

<script>


    $(function () {
        var init = function () {

            CKEDITOR.replace('w_content', {
                customConfig: '<%=request.getContextPath()%>/ckeditor/config.js',
                width: '100%',
                height: '400px',
                filebrowserUploadUrl: 'imageUpload.do',
            })

        };

        init();
    });


</script>

<nav class="writeListAffix col-sm-3" id="myScrollspy" data-spy="affix" data-offset-top="455">

    <ul class="nav nav-pills nav-stacked">

        <li><a href="#categoryInput" class="active">주제 선정</a></li>
        <li><a href="#typeInput">유형 선택</a></li>
        <li><a href="#titleInput">게시글 제목 선정</a></li>
        <li><a href="#contentInput">내용 등록</a></li>
        <li><a href="#tagInput">태그 등록</a></li>
        <li><a href="#mapInput">위치 등록</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">목표 설정<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#dateInput">금액 설정</a></li>
                <li><a href="#moneyInput">기간 설정</a></li>
            </ul>
        </li>
        <li><a href="#last_input">제출</a></li>

    </ul>
</nav>
<div class="container">
    <div class="col-sm-3"></div>
    <div class="col-sm-8 writeContent">
        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3>크라우드 펀딩 글 작성
                        <small>Write for Crowd</small>
                    </h3>
                </div>
                <div class="panel-body">
                    <p>글을 자세히 읽고 빈칸을 채워주세요. </p>

                    <p> 중간저장 기능은 없습니다. 글은 최종관리자에 의해 숨김처리가 될 수 있습니다.</p>

                    <p>다른 궁금한 사항이나 요청은 관리자에게 문의주세요.</p>
                </div>
            </div>
            <div class="write_part" id="categoryInput">


                <h4>Category</h4>
                <select class="selectpicker show-tick categorySel">
                    <optgroup label="Tech">
                        <option>IT/인터넷</option>
                        <option>의료</option>
                    </optgroup>
                    <optgroup label="Food">
                        <option>외식/식음료</option>
                        <option>요리</option>
                    </optgroup>
                    <optgroup label="Life">
                        <option>예술/엔터테인먼트</option>
                        <option>교육</option>
                        <option>생활/건강</option>
                        <option>여행/레저</option>
                    </optgroup>
                    <optgroup label="Style">
                        <option>쇼핑</option>
                        <option>뷰티</option>
                    </optgroup>
                    <optgroup label="etc">
                        <option>기타</option>
                    </optgroup>
                </select>
                <input type="hidden" name="category" id="w_category" value="IT/인터넷">

                <p class="text-danger">* 주제를 선택해주세요.</p>
            </div>
            <div class="write_part" id="typeInput">
                <h4>Type</h4>
                <div class="btn-group" data-toggle="buttons">
                    <label class="type-sel btn btn-info active" value="nomal">
                        <input type="radio" name="options" checked>기본형
                    </label>
                    <label class="type-sel btn btn-info" value="reward">
                        <input type="radio" name="options"> 보상형
                    </label>
                </div>
                <input type="hidden" id="w_type" name="type" value="2">
                <p class="text-danger">* 보상형 선택시 보상내용을 글에 기재해주세요.</p>

            </div>
            <div class="write_part" id="titleInput">
                <div>
                    <h4>Title</h4>
                    <input type="text" class="form-control input-lg" id="w_title" placeholder="꿈나무 성희에게 희망을주세요">
                    <p class="text-danger">* 펀딩 게시글의 제목을 입력해주세요.</p>
                </div>
            </div>
            <div class="write_part" id="contentInput" class="text">
                <h4>Content</h4>
                <textarea id='w_content'>&nbsp;</textarea>

                <p class="text-danger">* 등록하고자 하는 글의 내용을 자세히 적어주세요.</p>


            </div>
            <div class="write_part" id="tagInput">
                <div>
                    <h4>Title</h4>
                    <input type="text" class="form-control input-lg" id="w_tag" placeholder="#꿈나무 #도움">
                    <p class="text-danger">* (선택)펀딩 게시글의 태그를 입력하세요.</p>
                </div>
            </div>
            <div class="write_part" id="mapInput">
                <h4>Address</h4>
                <button type="button" class="btn black-control" id="mapAdd" data-toggle="modal"
                        data-target="#mapModal">
                    지도
                </button>
                <input type="search" id="w_addr" name="address" class="black-control" disabled>
                <p class="text-danger">(선택)등록하고 싶은 주소가 있다면 등록해주세요.</p>
                <div id="map-area" hidden="hidden">
                    <div id="show_map" style="width: 200px; height: 200px; position: relative;"></div>
                    <input type="hidden" id="w_latlng" value="">
                </div>
            </div>
            <div class="write_part" id="moneyInput">
                <h4>Target Amount</h4>
                <input type="text" id="w_goal" class="black-control" placeholder="목표금액"
                       onchange="getNumber(this);" onkeyup="getNumber(this);" name="goal_money">
                <p class="text-danger">* 목표금액을 달성하더라도 바로 펀딩이 종료되지 않습니다.</p>

            </div>
            <div class="write_part" id="dateInput">
                <h4>Date</h4>
                <input type="text" id="sdatepicker" class="black-control" placeholder="시작일" name="wdate">
                <input type="text" id="edatepicker" class="black-control" placeholder="마감일" name="edate">
                <p class="text-danger">*종료일이 지나면 목표금에 상관없이 크라우드펀딩이 종료됩니다.</p>

            </div>


            <div class="write_part" id="last_input">
                <h4>약관</h4>

                <textarea rows="5" class="col-md-8 acceptArea form-control">약관입니다.</textarea>

                <div class="col-sm-12 text-right">
                    <button type="button" class="btn btn-danger write-btn">동의 및 작성완료</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--맵모달--%>
<div class="modal fade" aria-hidden="true" id="mapModal" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-header line_none">
                <button type="button" class="close" id="login_close" data-dismiss="modal">
                    <span class='loginexit' aria-hidden="true">x<br></span>
                    <span class="sr-only">Close</span>
                </button>
                <div class="input-group modal-header-body">
                    <input id="addr-tf" class="form-control" name="addr-tf" placeholder="입력창을 클릭해주세요"
                           type="search"/>
                    <span class="bSearch input-group-addon black-control">&nbsp;<i class="icon ion-search"></i>&nbsp;
                                            </span>
                </div>
            </div>
            <div class="modal-body">
                <div id="map" style="height: 300px; width: 270px"></div>
                <div id="scriptCode"></div>
            </div>
        </div>
    </div>
</div>
<script>

</script>
<script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5KvZP2PadHIlORT_ptWd&submodules=panorama,geocoder"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    /* 돈관련 정규식*/
    //[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자
    //[0-9] => \d , [^0-9] => \D
    var rgx1 = /\D/g;
    var rgx2 = /(\d+)(\d{3})/;

    function getNumber(obj) {

        var num01;
        var num02;
        num01 = obj.value;
        num02 = num01.replace(rgx1, "");
        num01 = setComma(num02);
        obj.value = num01;

    }


    function setComma(inNum) {

        var outNum;
        outNum = inNum;
        while (rgx2.test(outNum)) {
            outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
        }
        return outNum;

    }
    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }

    goMain = function () {

        location.href = 'main.do';
    }
    /*돈관련 정규식 End*/
    $(function () {
        /* 글작성 부분*/

        $('.write-btn').click(function () {
            var check = true;
            var category = $('#w_category').attr("value");
            var type = $('#w_type').attr('value');
            var title = $('#w_title').val();
            var content = CKEDITOR.instances.w_content.getData();
            var address = $('#w_addr').val();
            var goalMoney = replaceAll($('#w_goal').val(), ",", "");
            var wdate = $('#sdatepicker').val();
            var edate = $('#edatepicker').val();
            var tag = $('#w_tag').val();
            var id = '${login.id}';
            var latlng = $('#w_latlng').attr('value');
            if (goalMoney == null || goalMoney == 0) {
                $('#moneyInput').css({'background-color': '##f2dede', 'border-color': '#ebccd1'});
                check = false;
                goalMoney = 10000;
            } else {
            }
            if (address == null || address == '') {
                address = "";
            }
            if (tag == null || tag == '') {
                tag = "";
            }
            if (title == null || title == '') {

                $('#titleInput').css({'background-color': '##f2dede', 'border-color': '#ebccd1'});
                check = false;
            }

            if (content.length < 1) {
                $('#contentInput').css({'background-color': '##f2dede', 'border-color': '#ebccd1'});

                check = false;

            }
            if (wdate == null || wdate == '' || edate == null || edate == '') {
                $('#dateInput').css({'background-color': '##f2dede', 'border-color': '#ebccd1'});
                check = false;

            }

            if (check == true) {
                $.ajax({

                    url: "crowdAddAf.do",
                    method: "post",
                    data: {
                        "category": category, "type": type, "title": title, "content": content, "address": address,
                        "goalmoney": goalMoney, "wdate": wdate, "edate": edate, "tag": tag, "id": id, "latlng": latlng
                    },
                    success: function (data) {


                        if (data.message == "SUCS") {
                            showMsg("크라우드 펀드 신청 성공!<br> 페이지를 이동합니다")

                            setTimeout("goMain()", 1000);
                        } else {
                            showMsg("신청 실패하였습니다.<br> 다시한번 확인해주세요.")
                        }

                    }
                })
            } else {
                showMsg("빈칸이 있어요 전부 입력해주세요");
            }
            return;
        })
        /* 타입 선택*/
        $(".typeBt").click(function () {
            if ($(this).attr("value") == "reward") {

                $("#w_type").attr("value", 3);

            } else if ($(this).attr("value") == "nomal") {
                $("#w_type").attr("value", 2);


            }

        });
        /*카테고리 선택부분*/
        $('.categorySel').change(function () {
            $('#w_category').attr('value', $('.categorySel option:selected').text());
        })
        var deadline = new Date();
        deadline.setMonth(deadline.getMonth() + 1, deadline.getDay());

        var dates = $("#sdatepicker, #edatepicker ").datepicker({
            prevText: '이전 달',
            nextText: '다음 달',
            dateFormat: "yy-mm-dd",
            yearSuffix: '년',
            dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
            minDate: new Date(),
            maxDate: "+30d",
            showOtherMonths: true,
            yearRange: "2017:2022",
            monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                "7월", "8월", "9월", "10월", "11월", "12월"],
            onSelect: function (selectedDate) {
                var option = this.id == "sdatepicker" ? "minDate" : "maxDate",
                    instance = $(this).data("datepicker"),
                    date = $.datepicker.parseDate(
                        instance.settings.dateFormat ||
                        $.datepicker._defaults.dateFormat,
                        selectedDate, instance.settings);
                dates.not(this).datepicker("option", option, date);
            }
        });

        /*데이트 피커*/
        $('.ui-datepicker').css('font-size', '20px');

        // -- 년도 SelectList 의 높이 조정과 넓이 조정

        $('.ui-datepicker select.ui-datepicker-year').css('width', '40%').css('height', '50px').css('font-size', '20px');

        // -- 일자의 글자 크기 조정

        $('.ui-datepicker td span, .ui-datepicker td a').css('font-size', '20px');
        $('.write_part').css({"border-bottom": "2px solid rgba(221,221,221,0.7)"})
    })
    function NewZipCode5NumCheck() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if (data.userSelectedType === 'R') {
                    //법정동명이 있을 경우 추가한다.
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                }


                $("#addr-tf").val(fullAddr);
                $(".bSearch").focus();
            }
        }).open();
    }
    var map;
    var maplist = new Array();
    var mapTagList = new Array();
    var marker;
    var infoWindow;
    var mylat = 37.5666102;
    var mylng = 126.9783881;
    var htmlAddresses = [];
    Array.prototype.contains = function (element) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] == element) {
                return true;
            }
        }
        return false;
    }
    if (!!navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
    }
    else {
    }
    function errorCallback(error) {
        /* alert(error.message);*/
    }

    function successCallback(position) {
        mylat = position.coords.latitude;
        mylng = position.coords.longitude;
    }

    $('#mapAdd').click(function () {
        mapinit("map");


    })

    var mapOptions = {
        center: new naver.maps.LatLng(mylat, mylng),
        zoom: 10,
        scaleControl: false,
        logoControl: false,
        mapDataControl: false,
        mapTypeControl: true,
        zoomControl: true,
        minZoom: 1
    };

    mapinit = function (tagId) {
        var mylatlng = new naver.maps.LatLng(mylat, mylng);

        mapOptions = {
            center: mylatlng,
            zoom: 8,
            scaleControl: false,
            logoControl: false,
            mapDataControl: false,
            mapTypeControl: true,
            zoomControl: true,
            minZoom: 1
        };

        if (mapTagList.contains(tagId)) {

            map = maplist[mapTagList.indexOf(tagId)];
            updateInfoWindow(mylatlng, 0);
            marker = new naver.maps.Marker({
                position: mylatlng,
                map: map
            });
        } else {

            map = new naver.maps.Map(tagId, mapOptions);

            maplist.push(map);
            marker = new naver.maps.Marker({
                position: mylatlng,
                map: map
            });
            if (tagId == "map") {
                infowindow = new naver.maps.InfoWindow({
                    maxWidth: 140,
                    backgroundColor: "lavenderblush",
                    borderColor: "lavenderblush",
                    borderWidth: 5,
                    anchorColor: "#lavenderblush",
                    content: ''
                });

                naver.maps.Event.addListener(map, 'click', function (e) {
                    marker.setPosition(e.coord);
                    updateInfoWindow(e.coord, 1);
                    searchCoordinateToAddress(e.coord);
                });
                naver.maps.Event.addListener(marker, "click", function (e) {
                    if (infowindow.getMap()) {
                        infowindow.close();
                    } else {
                        updateInfoWindow(e.coord, 1);
                        /* infowindow.open(map, marker);*/

                    }
                });
                updateInfoWindow(mylatlng, 1);
            }


        }


    }


    function updateInfoWindow(latlng, sel) {
        var utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng),    // 위/경도 -> UTMK
            tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk),       // UTMK    -> TM128
            naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128),     // TM128   -> NAVER
            latlngConv = naver.maps.LatLng(latlng);                         // 위/경도

        var latVal = latlngConv.lat();
        var lngVal = latlngConv.lng();

        utmk.x = parseFloat(utmk.x.toFixed(1));
        utmk.y = parseFloat(utmk.y.toFixed(1));

        infowindow.setContent([
            '<div style="padding:10px;width: 10%;font-size:14px;line-height:20px;">',
            '<span class="btn non-fixed-balloon" onclick="selectLatLng(' + latVal + ', ' + lngVal + ');" style="cursor:pointer;"><strong>Click</strong></span><br />',
            '</div>'
        ].join(''));
        if (sel == 1) {
            infowindow.open(map, marker);
        }
//        infoWindow.open(map, latlng);
    }

    function selectLatLng(lat, lng) {
        var sHTMLCODE = "" + lat + "/" + lng;
//        $("#scriptCode").html(sHTMLCODE);
        var temp_addr = $('#addr-tf').val();
        if (temp_addr != null && temp_addr != "") {
            $('#w_addr').val($('#addr-tf').val());
            $('.loginexit').click();
            mylat = lat;
            mylng = lng;
            $('#w_latlng').attr('value',""+mylat+"*"+mylng);
            mapinit("show_map");
            $('#map-area').show();
        } else {
            showMsg("주소창이 완성되지 않았어요");
        }
    }

    function searchCoordinateToAddress(latlng) {
        var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

        naver.maps.Service.reverseGeocode({
            location: tm128,
            coordType: naver.maps.Service.CoordType.TM128
        }, function (status, response) {
            if (status === naver.maps.Service.Status.ERROR) {
                return alert('Something Wrong!');
            }

            var items = response.result.items;
            htmlAddresses = [];

            for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
                item = items[i];
                addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

                htmlAddresses.push(item.address);
                htmlAddresses.push('&nbsp&nbsp&nbsp -> ' + item.point.x + ',' + item.point.y);
            }

        });
        $('#addr-tf').val(htmlAddresses[2]);
    }
    function selectAddress(lat, lng) {
        var latlng = new naver.maps.LatLng(lat, lng);
        map.setCenter(latlng);          // 중심 좌표 이동
        map.setZoom(13);              // 줌 레벨 변경
        marker.setPosition(latlng);     // 마크 이동
        updateInfoWindow(latlng, 0);       // 정보창 표현
        $("#bAddress").focus();
    }
    $('#addr-tf').click(function () {
        NewZipCode5NumCheck();
    })
    $(".bSearch").click(function () {
        var sHTML = "";
        var sUrl = "https://apis.daum.net/local/geo/addr2coord?apikey=1b98be2bf5ecb8fa9384650b0345cf83&output=json&page_size=30&q=";
        var sAddr = $("#addr-tf").val();
        if (sAddr.length == 0) {
            alert("주소를 입력하세요");
            $("#bAddress").focus();
            return;
        }
        $.ajax({
            type: "post",
            url: sUrl + encodeURIComponent(sAddr),
            dataType: "jsonp",
            async: true,
            success: function (data) {
                if (data.channel.item.length == 0) {
                    alert("올바른 주소를 입력하세요");
                    $("#bAddress").focus();
                }
                else if (data.channel.item.length == 1) {
                    selectAddress(data.channel.item[0].lat, data.channel.item[0].lng);
                }
                else {
                    sHTML = sHTML + "<table cellpadding=\"5\" cellspacing=\"5\" width=\"100%\" height=\"100%\">                                                      ";
                    sHTML = sHTML + "<tbody>                                                                                                                         ";
                    sHTML = sHTML + "<tr>                                                                                                                            ";
                    sHTML = sHTML + "    <td align=\"center\" valign=\"middle\" style=\"background-color:#FFFFFF;\">                                                 ";
                    sHTML = sHTML + "	<table cellpadding=\"3\" cellspacing=\"3\" style=\"border:2px solid #c5dbec;\" width=\"100%\">                               ";
                    sHTML = sHTML + "	<tbody>                                                                                                                      ";
                    sHTML = sHTML + "	<tr>                                                                                                                         ";
                    sHTML = sHTML + "		<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;font-weight:bold;background-color:#dfeffc;\">주소</td>";
                    sHTML = sHTML + "		<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;font-weight:bold;background-color:#dfeffc;\">lat</td> ";
                    sHTML = sHTML + "		<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;font-weight:bold;background-color:#dfeffc;\">lng</td> ";
                    sHTML = sHTML + "	</tr>                                                                                                                        ";
                    for (var i = 0; i < data.channel.item.length; i++) {
                        sHTML = sHTML + "<tr>                                                                                                                                                                                                                                                                       ";
                        sHTML = sHTML + "	<td style=\"border:1px solid #c5dbec;text-align:left;height:30px;font-weight:bold;background-color:#f9fcff;cursor:pointer;\" onclick=\"selectAddress('" + data.channel.item[i]["lat"] + "', '" + data.channel.item[i]["lng"] + "');\">" + data.channel.item[i]["title"] + "</td>";
                        sHTML = sHTML + "	<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;background-color:#ffffff;\">" + data.channel.item[i]["lat"] + "</td>                                                                                                                                 ";
                        sHTML = sHTML + "	<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;background-color:#ffffff;\">" + data.channel.item[i]["lng"] + "</td>                                                                                                                                 ";
                        sHTML = sHTML + "</tr>                                                                                                                                                                                                                                                                      ";
                    }
                    sHTML = sHTML + "</tbody></table></td></tr></tbody></table>";

                    showMsg(sHTML);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('[' + jqXHR.status + '] ' + textStatus + ': ' + errorThrown + ': ' + jqXHR.responseText);
            }
        });
    });


</script>