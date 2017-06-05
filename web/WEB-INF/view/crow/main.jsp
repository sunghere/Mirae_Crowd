<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-04-21
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {
        toGoal = function (goalmoney, curmoney) {
            var per = (curmoney / goalmoney) * 100;
// 	console.log($(".progress").children().addClass("progress-bar-danger"));
            return Math.floor(per);
        }
        dateCountdown = function (edate) {
            var today = new Date();
            var edateArray = edate.split("-");

            var edateObj = new Date(edateArray[0], Number(edateArray[1]) - 1, edateArray[2]);

            var between = Math.floor((edateObj.getTime() - today.getTime()) / 1000 / 60 / 60 / 24);
            if (between < 0) return 0;
            else return between;
        }
        var imageInput = function (src_list, data) {
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
        imageCarrier = function (content) {
            var contentArray = new Array();
            contentArray = content.split('alt="" src="');
            if (contentArray[1] != null && contentArray[1] != "") {
                var src = contentArray[1].split('"')

                return src[0];
            } else {

            }
            return "";
        }
        var initList = function () {
            $.ajax({
                url: "crowdList.do",
                method: "post",
                data: {},
                success: function (data) {
                    make_list(data);
                }, error: function (a, b, c) {

                }
            })
        };
        var make_list = function (data) {
            var str = "";
            var src_list = new Array();
            $.each(data, function (index, val) {

                str += "<div class='list-main col-md-4 col-sm-12' data-src='" + val.seq + "' last-num='" + val.rnn + "'>" +
                    "<div class='main-img-section' id='list-img" + val.seq + "'></div>" +
                    "<div class='main-info-section'><div class='card-block info-title'>" + val.titleTemp + "</div>" +
                    "<div class='card-block info-id'>" + val.id + "</div>" +
                    "<div class='progress-info'><span class='card-block info-curmoney float-left'>" + money_setComma(val.curmoney) + "원 달성 (" + toGoal(val.goalmoney, val.curmoney) + "%)</span>" +
                    "<span class='card-block info-date float-right'>" + dateCountdown(val.edate) + "일 남음</span></div>" +
                    "<div class='progress'>" +
                    "<div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='" + toGoal(val.goalmoney, val.curmoney) + "' " +
                    "aria-valuemin='0' aria-valuemax='100' style='width:" + toGoal(val.goalmoney, val.curmoney) + "%'></div>" +
                    "</div>" +
                    "<div class='info-cat'><span class='tags float-left'>" + val.tag + "</span><span class='category cbox float-right'>" + val.category + "</span></div>" +
                    "<div class='info-last div-clear'><span class='info-join float-left'>" + val.pnum + "명 참여중</span><span class='info-like float-right'><i class='fa fa-heart' aria-hidden='true'></i> " + val.likenum + "</span></div>" +
                    "</div></div>";
                var src = imageCarrier(val.content);
                src_list.push(src);
            })

            $('#crowdlist').html(str);

            imageInput(src_list, data);
            $(".progress-bar").each(function (index, val) {

                if ($(val).attr('aria-valuenow') <= 20) {
                    $(val).addClass("progress-bar-danger");
                } else if ($(val).attr('aria-valuenow') > 20 && $(val).attr('aria-valuenow') <= 40) {
                    $(val).addClass("progress-bar-warning");
                } else if ($(val).attr('aria-valuenow') > 40 && $(val).attr('aria-valuenow') <= 60) {

                } else if ($(val).attr('aria-valuenow') > 60 && $(val).attr('aria-valuenow') <= 80) {
                    $(val).addClass("progress-bar-info");
                } else {
                    $(val).addClass("progress-bar-success");
                }
            });
        }
        var initTagList = function () {
            $.ajax({
                url: "taglist.do",
                method: "POST",
                data: {},
                success: function (data) {
                    str = "<div class='tag-title'><i class='fa fa-tag' aria-hidden='true'></i> HOT 키워드 </div>" +
                        "<div class='tagbox btn btn-default'><i class='fa fa-hashtag' aria-hidden='true'></i>ALL</div>";

                    $.each(data, function (index, val) {

                        str += "<div class='tagbox btn btn-default'><i class='fa fa-hashtag' aria-hidden='true'></i>" + val + "</div>";
                    })
                    $(".taglist").html(str);
                }
            })
        };
        $('.taglist').on("click", "div.tagbox", function () {
            var tag = $(this).prop("innerText");
            if (tag == "ALL") {
                initList();
                return;
            }
            $.ajax({
                url: "cSearch.do",
                method: "POST",
                data: {"search": tag, "search_type": "tag"},
                success: function (data) {
                    make_list(data);
                }, error: function (a, b, c) {
                    console.log(a)
                    console.log(b)
                    console.log(c)
                }
            })
        });

        var searchByText = function () {
            var txt = $("#search-text").val();
            $.ajax({
                url: "cSearch.do",
                method: "POST",
                data: {"search": txt, "search_type": "search"},
                success: function (data) {
                    make_list(data);
                    $("#search-text").val("");
                }
            })
        }

        $(".search-box").keydown(function (key) {
            if (key.keyCode == 13) {
                searchByText();
            }
        })
        $(".search-box>i").click(function () {
            searchByText();
        })

        initList();
        initTagList();
    })
</script>
<!-- 디테일 모달 버튼 -->
<input type="hidden" data-target='#detailModal' data-toggle='modal' id="detail-modal-btn">
<div class="taglist"></div>
<div class="card-columns mb-3">
    <div class="input-group search-box col-sm-12 col-md-4 col-lg-3" style="float:right">
        <input type="text" class="form-control" id="search-text" placeholder="Search for...">
        <span class="input-group-addon black-control">
	    <i class="fa fa-search" aria-hidden="true"></i>
	  </span>
    </div>
    <div class='row div-clear' id="crowdlist">
    </div>
</div>


<script src="<%=request.getContextPath()%>/js/shScroll.js"></script>
