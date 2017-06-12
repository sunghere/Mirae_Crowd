<%@page import="java.util.Calendar" %>
<%@ page import="java.util.Locale" %>
<%@ page import="main.java.com.sung.hee.help.CalendarUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<style type="text/css">

    /* 토요일 */
    .fc-day-top.fc-sat {
        color: #0000FF;
    }

    #calendar {
        font-size: 17px;
    }

    /* 일요일 */
    .fc-day-top.fc-sun {
        color: #FF0000;
    }

    .nube {
        color: #1d1d1d;
        background-color: lavenderblush;
        left: 0;
        top: 0;
    }

    div#calendar {
        z-index: -999;
    }

    .fc-view-container *, .fc-view-container *:before, .fc-view-container *:after {
        z-index: 10;
    }
</style>
<link href="<%=request.getContextPath()%>/fullcal/fullcalendar.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/fullcal/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/fullcal/lib/moment.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/fullcal/fullcalendar.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/fullcal/locale/ko.js"></script>

<script type="text/javascript">
    $(function () {
        var load_Cal = function (crowd) {
            $("#calendar").fullCalendar({
                defaultDate: $('#todays').attr("value"),
                editable: true,
                lang: "ko",
                eventLimit: true,
                events: crowd,
                eventDrop: function (event, delta) {

                },

                loading: function (bool) {
                    if (bool) $('#loading').show();
                    else $('#loading').hide();
                },
                eventMouseover: function (event, jsEvent, view) {
                    /* var item = $(this);
                     if (item.find('.nube').length == 0) {
                     var info = '<div id="aboutModal" class="nube" tabindex="-1" role="dialog">' +
                     '<div class="text-justify">' +
                     '<img src="' + event.avatar + '" /> <div class="text-center">'
                     + event.name + '<br/>' + event.start + ' <br/> '
                     + event.end +
                     '</div></div></div>';
                     item.append(info);
                     }
                     if (parseInt(item.css('top')) <= 200) {
                     item.find('.nube').css({'top': '20', 'bottom': 'auto'});
                     item.parent().find('.fc-event').addClass('z0');
                     }
                     item.find('.nube').stop(true, true).fadeIn();*/
                    /* $("#myModal").css({'top': '20', 'bottom': 'auto'});
                     $("#myModal").prop("hidden", false).fadeIn();*/

                },
                eventMouseout: function (event, jsEvent, view) {
                    var item = $(this);
                    /* item.find('.nube').stop(true, true).fadeOut();*/
                    /*
                     $("#myModal").prop("hidden", true).fadeOut();*/

                },eventClick: function (event) {

                    var seq = event.seq;

                    detail_load(seq,0);
                },
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                eventRender: function (event, element) {

                }

            });

        };

        var load_Crowd = function () {
            $.ajax({
                url: "cListAll.do",
                data: {},
                method: "post",
                success: function (data) {

                    var item = [];

                    $.each(data, function (index, val) {

                        item.push({
                            "seq": val.seq,
                            "title": val.titleTemp,
                            "start": val.sdate,
                            "end": val.edate,
                            "color": random_color(val.category),
                        })


                    });
                    load_Cal(item);
                }
            })
        };


        // 왼쪽 버튼을 클릭하였을 경우
        jQuery("button.fc-prev-button").click(function () {
            var date = jQuery("#calendar").fullCalendar("getDate");
            convertDate(date);
        });

        // 오른쪽 버튼을 클릭하였을 경우
        jQuery("button.fc-next-button").click(function () {
            var date = jQuery("#calendar").fullCalendar("getDate");
            convertDate(date);
        });
        // 받은 날짜값을 date 형태로 형변환 해주어야 한다.
        function convertDate(date) {
            var date = new Date(date);
//        alert(date.yyyymmdd());
        }

        // 받은 날짜값을 YYYY-MM-DD 형태로 출력하기위한 함수.
        Date.prototype.yyyymmdd = function () {
            var yyyy = this.getFullYear().toString();
            var mm = (this.getMonth() + 1).toString();
            var dd = this.getDate().toString();
            return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
        };

        load_Crowd();

        var random_color = function (category) {
            var color = "";
            if (category == "IT/인터넷") {
            } else if (category == "의료") {
                color = "#65c149";

            } else if (category == "외식/식음료") {
                color = "#c1499f";
            } else if (category == "요리") {
                color = "#591847";

            } else if (category == "예술/엔터테인먼트") {
                color = "#ccdbba";

            } else if (category == "교육") {
                color = "#a5a16b";

            } else if (category == "생활/건강") {
                color = "#6ba58d";

            } else if (category == "여행/레저") {
                color = "#4c5cad";

            } else if (category == "쇼핑") {
                color = "#870434";

            } else if (category == "뷰티") {
                color = "#512427";
                s
            } else {
                color = "midnightblue";

            }

            return color;
        }
    });


</script>

<%
    Calendar cal = Calendar.getInstance(Locale.KOREA);

    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH);
    int date = cal.get(Calendar.DATE);

    String todays = year + "-" + CalendarUtil.two(1 + month) + "-" + CalendarUtil.two(date);
    String s = String.format("%d년 %d월", year, month);

    pageContext.setAttribute("today", todays);
    cal.set(year, month - 1, date);

%>

<div class="box_border" id="mainContent">
    <div id="calendar"></div>


</div>
<div id="myModal" hidden="hidden" class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-body">
            <h3 class="text-center">ㅇㅇ</h3>
            <p class="text-center">ㅇㅇㅇ</p>
            <p class="text-center">ㅇㅇㅇㅇ</p>
            <br/>
            <button type="button" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">OK
                <i
                        class="ion-android-close"></i></button>
        </div>
    </div>
</div>
