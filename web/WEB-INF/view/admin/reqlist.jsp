<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-05-31
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3 class="jumbotron"> 펀딩 신청목록</h3>

<div>
    <table class="table table-striped">
        <thead class="thead-inverse">
        <tr>
            <th class="text-center visible-md visible-lg">신청일</th>
            <th class="text-center">제목</th>
            <th class="text-center visible-md visible-lg">카테고리</th>
            <th class="text-center">신청자</th>
            <th class="text-center ">Select</th>
        </tr>
        </thead>
        <tbody id="crowd-req-list">
        <tr>
            <td class="text-center" colspan="5">신청목록이 없습니다.</td>
        </tr>
        </tbody>

    </table>

</div>


<script>

    $(function () {
        load_list();

        $('#crowd-req-list').on("click", ".req-acc-btn", function (my) {


            var seq = $(this).attr('data-src');
            showSelectMsg("crowd_acc(" + seq + ")");
        });
        $('#crowd-req-list').on("click", ".req-no-btn", function (my) {

            var seq = $(this).attr('data-src');
            showSelectMsg("crowd_no(" + seq + ")");

        });
    })

    var crowd_acc = function (seq) {


        $.ajax({
            url: "accCrowd.do",
            data: {"seq": seq},
            method: "post",
            success: function (data) {

                if (data.message == "SUCS") {

                    load_list();
                } else {
                    showMsg("정상적인 처리가 되지 않았습니다.");
                }
            }
            , error: function () {
                showMsg("통신에러")
            }
        })
    }

    var crowd_no = function (seq) {
        $.ajax({
            url: "noCrowd.do",
            data: {"seq": seq},
            method: "post",
            success: function (data) {

                if (data.message == "SUCS") {

                    load_list();
                } else {
                    showMsg("정상적인 처리가 되지 않았습니다.");
                }
            }
            , error: function () {
                showMsg("통신에러")
            }
        })
    }
    var load_list = function () {
        $.ajax({
            url: "reqList.do",
            data: {},
            method: "post",
            success: function (data) {

                var str = "";
                $.each(data, function (index, val) {
                    str += ' <tr class="_hover_tr">'
                        + '<td class="text-center visible-md visible-lg">' + val.wdate + '</td>'
                        + '<td><div class="btn detail-btn" data-src="' + val.seq + '">'
                        + val.titleTemp + '</div></td>'
                        + '<td class="text-center visible-md visible-lg">' + val.category + '</td>'

                        + '<td class="text-center">' + val.id + '</td>'
                        + '<td class="text-center">'
                        + '<button class="btn btn-info req-acc-btn" data-src="' + val.seq + '">수락</button>'
                        + '<button class="btn btn-danger req-no-btn" data-src="' + val.seq + '">거절</button></td>'
                        + '</tr>'
                })


                $('#crowd-req-list').html(str);

            }, error: function () {

                showMsg("통신에러");
            }
        })
    }


</script>