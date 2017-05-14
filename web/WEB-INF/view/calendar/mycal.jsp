<%@page import="java.util.Calendar" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.sung.hee.help.CalendarUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<style type="text/css">

    /* 토요일 */
    .fc-day-top.fc-sat {
        color: #0000FF;
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

    #myModal {
        position: fixed;
        /*left: 0;*/
        /*bottom: 10%;*/
        z-index: 9999;
        opacity: 1;
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
    jQuery(document).ready(function () {


        $("#calendar").fullCalendar({
            defaultDate: $('#todays').attr("value")
            , editable: true
            , lang: "ko"
            , eventLimit: true
            , events: [
                {
                    title: "All Day Event"
                    , start: "2017-03-19"
                },
                {
                    title: "Long Event"
                    , start: "2017-03-21"
                    , end: "2017-03-22"
                },
                {
                    id: 999
                    , title: "Repeating Event"
                    , start: "2017-03-23T16:00:00"
                },
                {
                    id: 999
                    , title: "Repeating Event"
                    , start: "2017-03-16T16:00:00"
                },
                {
                    title: "Conference"
                    , start: "2017-03-11"
                    , end: "2017-03-13"
                },
                {
                    title: "Meeting"
                    , start: "2017-03-12T10:30:00"
                    , end: "2017-03-12T12:30:00"
                },
                {
                    title: "Lunch"
                    , start: "2017-03-12T12:00:00"
                },
                {
                    title: "Meeting"
                    , start: "2017-03-12T14:30:00"
                },
                {
                    title: "Happy Hour"
                    , start: "2017-03-12T17:30:00"
                },
                {
                    title: "Dinner"
                    , start: "2017-03-12T20:00:00"
                },
                {
                    title: "Birthday Party"
                    , start: "2017-03-13T07:00:00"
                },
                {
                    title: "Click for Google"
                    ,name: "dd"
                    ,avatar: "<%=request.getContextPath()%>/image/rd.gif"
                    ,url: "http://google.com/"
                    ,start: "2017-03-28"
                },
                {
                    title: "이나영 교수님.naver"
                    ,
                    url: "https://search.naver.com/search.naver?where=nexearch&query=%EC%9D%B4%EB%82%98%EC%98%81&sm=top_hty&fbm=1&ie=utf8"
                    ,
                    start: "2017-03-18"
                }
            ], eventDrop: function (event, delta) {
                alert(event.title + ' was moved ' + delta + ' days\n' +
                    '(should probably update your database)');
            },

            loading: function (bool) {
                if (bool) $('#loading').show();
                else $('#loading').hide();
            },
            eventMouseover: function (event, jsEvent, view) {
                var item = $(this);
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
                item.find('.nube').stop(true, true).fadeIn();
                $("#myModal").css({'top': '20', 'bottom': 'auto'});
                $("#myModal").prop("hidden", false).fadeIn();

            },
            eventMouseout: function (event, jsEvent, view) {
                var item = $(this);
                item.find('.nube').stop(true, true).fadeOut();
                $("#myModal").prop("hidden", true).fadeOut();

            },
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            eventRender: function (event, element) {

            }

        });
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
    }

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
            <h3 class="text-center">Nice Job!</h3>
            <p class="text-center">You clicked the button, but it doesn't actually go anywhere because this is only
                a demo.</p>
            <p class="text-center">Learn more at BootstrapZero</p>
            <br/>
            <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">OK <i
                    class="ion-android-close"></i></button>
        </div>
    </div>
</div>
