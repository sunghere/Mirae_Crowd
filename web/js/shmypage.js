/**
 * Created by Administrator on 2017-06-20.
 */
(function ($) {
    $(function () {
        $('.side-info-btn').click(function () {
            all_hide();

            $('#myinfo').show();

        });
        $('.side-fund-btn').click(function () {
            all_hide();

            $('#myfund-list').show();
            load_fund_list();
        });

        $('.side-crowd-btn').click(function () {
            all_hide();

            $('#mycrowd-list').show();
            load_crowd_list();

        });

        $('.side-point-btn').click(function () {
            all_hide();

            $('#mypoint').show();

        });

        $('.side-board-btn').click(function () {
            all_hide();

            $('#myboard').show();
            load_board_list();

        });
        $('.side-reply-btn').click(function () {
            all_hide();

            $('#myreply').show();
            load_reply_list();

        });
        $('.side-ent-btn').click(function () {
            all_hide();

            $('#myent').show();

        });
        var all_hide = function () {

            $('#myinfo').hide();
            $('#myfund-list').hide();
            $('#mycrowd-list').hide();
            $('#mypoint').hide();
            $('#myboard').hide();
            $('#myreply').hide();
            $('#myent').hide();

            $('.cash-charge').hide();

            $('.cash-discharge').hide();
        };

        /*포인트 충전 관련*/

        $('.cash-charge-btn').click(function () {
            $('.cash-charge').show();
            $('.cash-discharge').hide();

            /*충전화면을 보여줌*/
        });
        $('.cash-discharge-btn').click(function () {
            $('.cash-charge').hide();
            $('.cash-discharge').show();

            /*충전화면을 보여줌*/
        });
        $('.cash-charge-ok-btn').click(function () {
            point_charge_system();

        });
        $('.cash-discharge-ok-btn').click(function () {
            point_discharge_system();


        });
        $('#code-input').keypress(function (key) {

            if (key.keyCode === 13) {/*엔터인경우 실행*/
                point_charge_system();
            }

        });
        $('#point-input').keypress(function (key) {

            if (key.keyCode == 13) {/*엔터인경우 실행*/
                point_discharge_system();
            }

        });
        /* 포인트 출금 fun */
        var point_discharge_system = function () {
            var point = 0;
            var point_val = $('#point-input').val();
            if (point_val != null && point_val != "") {
                point = parseInt(point_val);

            }
            var mypoint = parseInt($('.mypoint').val());

            if (point != null && point != "") {

                if (mypoint < point + 1000) {
                    showMsg("출금 가능한 금액을 초과하였습니다.");


                } else {
                    point_dischager(point + 1000);
                }

            } else {
                showMsg("출금할 금액을 입력해 주세요");


            }
        };
        /*포인트 충전 fun*/
        var point_charge_system = function () {
            var point_code = $('#code-input').val();

            if (point_code != null && point_code != "") {


                if (point_code == "P1000000") {
                    point_chager(1000000);
                } else if (point_code == "P500000") {
                    point_chager(500000);

                } else if (point_code == "P100000") {
                    point_chager(100000);

                } else if (point_code == "P50000") {
                    point_chager(50000);

                } else if (point_code == "P30000") {
                    point_chager(30000);

                } else if (point_code == "P10000") {
                    point_chager(10000);

                } else if (point_code == "P5000") {
                    point_chager(5000);

                } else if (point_code == "P1000") {
                    point_chager(1000);

                } else if (point_code == "P500") {
                    point_chager(500);

                } else {
                    showMsg("유효한 코드가 아닙니다.")

                }


            } else {
                showMsg("코드를 입력해주세요");


            }
        };

        /*포인트 충전 fun을 부르기전 인증처리*/
        var point_chager = function (num) {

            $.ajax({
                url: "pointIn.do",
                data: {
                    "epoint": num
                },
                method: "post",
                success: function (data) {


                    if (data.message == "SUCS") {


                        $('.cash-charge').hide();
                        $('.mypoint').val(data.resultNum);
                        $('#code-input').val("");
                        showMsg("충전 되었습니다");

                    } else {


                        showMsg("충전 실패하였습니다. 관리자에게 문의주세요");

                    }
                }

                ,
                error: function () {
                    showMsg("통신 Error , 잠시후에 다시 시도해주세요");

                }
            })


        };

        /*포인트 출금을 하기전 인증처리*/
        var point_dischager = function (num) {

            $.ajax({
                url: "pointOut.do",
                data: {
                    "epoint": num
                },
                method: "post",
                success: function (data) {


                    if (data.message == "SUCS") {


                        $('.cash-discharge').hide();
                        $('.mypoint').val(data.resultNum);
                        $('#code-input').val("");
                        showMsg("출금 되었습니다");

                    } else {


                        showMsg("출금 실패하였습니다. 관리자에게 문의주세요");

                    }
                }

                ,
                error: function () {
                    showMsg("통신 Error , 잠시후에 다시 시도해주세요");

                }
            })


        };


        /* 내글 불러오기*/
        var load_board_list = function () {

            $.ajax({
                url: "myBoardList.do",
                method: "post",
                data: {"id": myid},
                success: function (data) {
                    var str = "";
                    $.each(data, function (index, val) {
                        var temp_date = new Date(val.wdate).format("yyyy-MM-dd");
                        str += ' <tr class="_hover_tr">'
                            + '<td class="text-center visible-md visible-lg">' + val.seq + '</td>'
                            + '<td class="col-md-4"><div class="btn detail-btn"><a href="boarddetail.do?seq=' + val.seq + '">'
                            + val.tempSub + '</a></div></td>'
                            + '<td class="text-center">' + val.readcount + '</td>'
                            + '<td class="text-center  visible-md visible-lg">' + temp_date + '</td>';
                        if (val.ent == 0) {
                            str += '<td class="text-center  visible-md visible-lg">X</td>';

                        } else {
                            str += '<td class="text-center  visible-md visible-lg">O</td>';
                        }
                        str += +'</tr>';
                    });


                    $('#board-list').html(str);

                }
            })
        };
        /* 내 펀드(투자내역) 불러오기*/
        var load_fund_list = function () {
            $.ajax({
                url: "mFundList.do",
                method: "post",
                data: {"id": myid},
                success: function (data) {
                    var str = "";

                    $.each(data, function (index, val) {
                        str += ' <tr class="_hover_tr">'
                            + '<td class="text-center">' + val.edate.substr(5) + '</td>'
                            + '<td class="col-md-4"><div class="btn crowd-detail-btn" data-src="' + val.seq + '">'
                            + val.titleSub + '</div></td>'
                            + '<td class="text-center col-md-3 small visible-md visible-lg">' + money_setComma(val.money) + '/' + money_setComma(val.curMoney) + '/' + money_setComma(val.goalMoney) + '</td>';

                        if (val.type == 2) {
                            str += '<td class="text-center visible-md visible-lg">' + '일반' + '</td>';

                        } else {
                            str += '<td class="text-center visible-md visible-lg">' + '보상' + '</td>';

                        }
                        str += '<td class="text-center  visible-md visible-lg">' + val.wdate + '</td>';
                        +'</tr>';
                    });


                    $('#fund-list').html(str);

                }
            })
        };
        /* 내 크라우드펀딩 모집 신청내역 불러오기*/
        var load_crowd_list = function () {
            $.ajax({
                url: "myReq.do",
                method: "post",
                data: {"id": myid},
                success: function (data) {
                    var str = "";

                    $.each(data, function (index, val) {
                        str += ' <tr class="_hover_tr">'
                            + '<td class="text-center visible-md visible-lg small">' + val.sdate + '</td>'
                            + '<td class="text-center">' + '~' + val.edate.substr(5) + '</td>'
                            + '<td class="col-md-3"><div class="btn crowd-title crowd-detail-btn" data-src="' + val.seq + '">'
                            + val.titleSub + '<button class="crowd-edit-btn btn btn-default"  data-src="' + val.seq + '">수정</button></div></td>'
                            + '<td class="text-center small visible-md visible-lg">' + money_setComma(val.curMoney) + '/' + money_setComma(val.goalMoney) + '</td>';

                        if (val.req == 2) {
                            str += '<td class="text-center visible-md visible-lg">' + '<div class="btn btn-danger">거절</div>' + '</td>';

                        } else if (val.req == 1) {
                            str += '<td class="text-center visible-md visible-lg">' + '<div class="btn btn-info">승인</div>' + '</td>';

                        } else {
                            str += '<td class="text-center visible-md visible-lg ">' + '<div class="btn btn-warning">대기</div>' + '</td>';

                        }
                        if (val.endflag == "1" && val.reward == "0")
                            str += '<td class="text-center  visible-md visible-lg">' + '<button type="button" class="btn btn-info reward-btn" data-src="' + val.seq + '">지급받기</button>' + '</td>';
                        else if (val.endflag == "1" && val.reward == "1")
                            str += '<td class="text-center  visible-md visible-lg">' + '<button type="button" class="btn black-control" disabled>지급완료</button>' + '</td>';
                        else if (val.endflag == "0" && val.req == 0)
                            str += '<td class="text-center  visible-md visible-lg">' + '<button type="button" class="btn btn-warning" disabled>미진행</button>' + '</td>';
                        else {
                            str += '<td class="text-center  visible-md visible-lg">' + '<button type="button" class="btn btn-info" disabled>진행중</button>' + '</td>';
                        }
                        str += '</tr>';
                    });


                    $('#crowd-list').html(str);

                }
            })
        };
        if ($(window).height() < 900) {
            $('.white-box').height(100+600);
        }
        $(window).resize(function () {
            if ($(window).height() < 900) {
                $('.white-box').height(100+600);
            }
        });
        /* 내 댓글 불러오기*/
        var load_reply_list = function () {

            $.ajax({
                url: "myReplylist.do",
                method: "post",
                data: {"id": myid},
                success: function (data) {
                    var str = "";
                    $.each(data, function (index, val) {
                        str += ' <tr class="_hover_tr">';

                        if (val.btype == 1) {
                            str += '<td class="text-center visible-md visible-lg">' + '문의' + '</td>';

                        } else if (val.btype == 2) {
                            str += '<td class="text-center visible-md visible-lg">' + '일반펀드' + '</td>';

                        } else {
                            str += '<td class="text-center visible-md visible-lg">' + '보상' + '</td>';

                        }
                        str += '<td class="text-center">' + val.seq + '</td>'
                            + '<td class="col-md-4"><div class="btn">';
                        if (val.btype == 1) {

                            str += '<a href="boarddetail.do?seq=' + val.bparent + '">'

                        } else {
                            str += '<a class="crowd-detail-btn" data-src="' + val.bparent + '">'

                        }
                        str += val.tempSub + '</a></div></td>'
                            + '<td class="text-center  visible-md visible-lg">' + val.wdate + '</td>'
                            + '<td class="text-center">'
                            + '<button type="button" class="btn btn-danger re-remove-btn" data-src="' + val.seq + '">삭제</button></td>'
                            + '</tr>';
                    });


                    $('#reply-list').html(str);

                }
            })
        };

        /*댓글 삭제*/
        var reply_delete = function (seq) {

            $.ajax({
                url: "replydel.do",
                method: "post",
                data: {"seq": seq},
                success: function (data) {

                    if (data.message == "SUCS") {
                        load_reply_list();
                    } else {
                        setTimeout('showMsg("정상적인 처리가 되지 않았습니다.");', 500);

                    }


                }
            })
        };

        /*비밀번호 변경-현재 비밀번호 확인창*/
        var pwd_check_one = function () {
            var cur_pwd = $('#cur-pwd').val();
            if (cur_pwd.length < 2) {
                alert("비밀번호를 입력해주세요");

            } else {
                $('.showMsg-close').click();

                $.ajax({
                    url: "pwdCheck.do",
                    method: "post",
                    data: {"id": myid, "pwd": cur_pwd},
                    success: function (data) {


                        if (data.message == "SUCS") {
                            setTimeout("showMsg(\"변경할 비밀번호를 입력하세요<br> <input type='password' class='black-control' id='edit-pwd'><button type='button' class='btn btn-danger' id='pwd-edit-btn3' onclick='pwd_check_two()'>확인</button>\");", 500)


                        } else {
                            alert("비밀번호가 일치하지않습니다.");

                        }
                    }
                })
            }
        };


        /*비밀번호변경-변경할 비밀번호 입력*/
        var pwd_check_two = function () {
            var edit_pwd = $("#edit-pwd").val();
            if (edit_pwd.length < 5) {
                alert("비밀번호를 제대로 입력해주세요 (6자이상)");

            } else {
                $('.showMsg-close').click();

                $.ajax({
                    url: "pwdUpdate.do",
                    method: "post",
                    data: {"id": myid, "pwd": edit_pwd},
                    success: function (mes) {


                        if (mes.message == "SUCS") {
                            $('.showMsg-close').click();

                            setTimeout(" showMsg('변경 되었습니다.')", 500);

                        } else {
                            setTimeout(" showMsg('실패.')", 500);
                        }
                    }
                })
            }

        };


        /*비밀번호 변경 현재비밀번호창 띄우기*/
        $('.pwd-edit-btn').click(function () {


            setTimeout("showMsg(\"현재 비밀번호를 입력하세요<br><br> <input type='password' class='black-control' id='cur-pwd'><button type='button' class='btn btn-danger' id='pwd-edit-btn2' onclick='pwd_check_one()'>확인</button>\");", 100)


        });

        /* 리플 삭제 버튼*/
        $('#reply-list').on("click", ".re-remove-btn", function () {
            var seq = $(this).attr('data-src');

            showSelectMsg("reply_delete(" + seq + ")");
        });

        /* 크라우드 상세보기*/
        $('#fund-list,#reply-list').on("click", ".crowd-detail-btn", function () {
            var seq = $(this).attr('data-src');

            detail_load(seq, 0);

        });
        /* 크라우드 수정하기 */
        $('#crowd-list').on("click", ".crowd-edit-btn", function () {
            var seq = $(this).attr("data-src");

            update_load(seq)

        });


        /*크라우드 업데이트창 불러오기*/
        var update_load = function (seq) {
            $.ajax({
                url: "detailCrowd.do",
                method: "POST",
                data: {"seq": seq},
                success: function (data) {
                    var src = imageCarrier(data.content);
                    var str_title = "<span class='cbox detail-cat'>" + data.category + "</span><input class='black-control crowd-update-title' type='text' value='" + data.titleTemp + "'>";

                    var str_summary = "<div class='detail-img'><img class='center-block' src='" + src + "'></div>" +
                        "<div class='detail-like btn btn-default' data-src='" + data.seq + "' disabled><i class='fa fa-heart-o' aria-hidden='true'></i></div>" +
                        "<div>" + data.id + "</div>" +
                        "<div class='detail-date'>" + data.sdate + " ~ " + data.edate + "</div>" +
                        "<div class='detail-goalMoney'>목표금액 : " + money_setComma(data.goalMoney) + "원</div>" +
                        "<div class='progress'>" +
                        "<div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='" + toGoal(data.goalMoney, data.curMoney) + "' " +
                        "aria-valuemin='0' aria-valuemax='100' style='width:" + toGoal(data.goalMoney, data.curMoney) + "%'></div>" +
                        "</div>" +
                        "<div class='progress-info'><span class='card-block info-curMoney float-left'>" + money_setComma(data.curMoney) + "원 달성 (" + toGoal(data.goalMoney, data.curMoney) + "%)</span>" +
                        "<span class='card-block info-date float-right'>" + dateCountdown(data.edate) + "일 남음</span></div>" +
                        "<div style='width: 100%; height:300px'>" + "<span class='crowd-update-btn center-block btn btn-info' data-src='" + data.seq + "'>수정하기</span>" + "<div class='center-block'><div id='detail-map' style='height: 300px; width: 300px; margin: 0 auto;'></div></div></div>";

                    var str_detail = "<div class='detail-content'><textarea id='update_content'></textarea></div>" +
                        "<input type='hidden' name='seq' data-src='" + data.seq + "'>" +
                        "<input type='hidden' name='type' data-src='" + data.type + "'>" +
                        "<input type='text' class='form-control input-lg crowd-update-tag' placeholder='#꿈나무 #도움' value='" + data.tag + "'>" +
                        "<div class='detail-reply'>" +
                        "<h2 class='cursive underline'>Reply</h2>" +
                        "<div class='crowd-reply-list'></div>" +
                        "</div>";

                    reply_load(data.seq, data.type);

                    $(".detail-title").html(str_title);
                    $(".detail-summary").html(str_summary);
                    $(".detail-detail").html(str_detail);

                    var detail_latlng = data.latlng.split('*');
                    if (detail_latlng.length > 1) {
                        map_load('detail-map', detail_latlng[0], detail_latlng[1]);
                    }
                    /* 펀드를 위한 값 넣어주는작업*/
                    var init = function () {

                        CKEDITOR.replace('update_content', {
                            customConfig: 'config.js',
                            width: '100%',
                            height: '400px',
                            filebrowserUploadUrl: 'imageUpload.do',
                        });
                        CKEDITOR.on('dialogDefinition', function (ev) {
                            var dialogName = ev.data.name;
                            var dialog = ev.data.definition.dialog;
                            var dialogDefinition = ev.data.definition;
                            if (dialogName == 'image') {
                                dialog.on('show', function (obj) {
                                });
                                dialogDefinition.removeContents('advanced'); // 자세히탭 제거
                                dialogDefinition.removeContents('Link'); // 링크탭 제거
                            }
                        });

                    };

                    init();

                    CKEDITOR.instances.update_content.setData(data.content);
                    $('#detail-modal-btn').click();
                }
            })
        };


        /* 수정버튼 */
        $(".detail-summary").on("click", ".crowd-update-btn", function () {
            var seq = $(this).attr("data-src");

            showMsg("수정시 관리자의 승인을 받아야합니다<br><br><button class='btn btn-danger btn-update-ok' data-src='" + seq + "'>확인</buton>")
        });
        $("#myMsg").on("click", ".btn-update-ok", function () {
            var seq = $(this).attr("data-src");

            update_crowd(seq);
            $('.showMsg-close').click();

        });

        /*크라우드 수정후 업데이트*/
        var update_crowd = function (seq) {

            var title = $.trim($(".crowd-update-title").val());
            var content = CKEDITOR.instances.update_content.getData();
            var tag = $.trim($(".crowd-update-tag").val());
            if (title == "" || title == null) {
                showMsg("제목을 입력해주세요.");
                return false;
            }
            if (content == "" || content == null) {
                showMsg("내용을 입력해주세요.");
                return false;
            }
            if (tag == "" || tag == null) {
                showMsg("태그를 입력해주세요.");
                return false;
            }
            $.ajax({
                url: "updateCrowd.do",
                method: "POST",
                data: {"title": title, "content": content, "tag": tag, "seq": seq},
                success: function (data) {

                    if (data.message == "FAIL") {
                        showMsg("실패했습니다")
                    } else {
                        $('#detail-modal-btn').click();
                        setTimeout('showMsg("수정되었습니다.")', 500);
                        load_crowd_list();
                    }
                }
            })
        };

        /*크라우드 보상받기 확인창*/
        var crowd_reward_modal = function () {


            var seq = $(this).attr("data-src");
            showSelectMsg("crowd_reward(" + seq + ")");


        };
        /*크라우드 보상받기 모달*/

        $('#crowd-list').on('click', '.reward-btn', crowd_reward_modal);
        /* 크라우드 펀딩 보상받기 이벤트*/
        /* 크라우드 펀딩 보상받기 이벤트*/
        var crowd_reward = function (seq) {

            $.ajax({
                url: "cfinish.do",
                data: {"id": myid, "seq": seq},
                method: "post",
                success: function (data) {

                    if (data.message == "SUCS") {

                        load_crowd_list();
                        setTimeout('showMsg("재 로그인시 반영됩니다.")', 500);

                    } else {
                        setTimeout('showMsg("잠시후 다시 시도해주세요")', 500);

                    }
                }
            })

        }

    })

})(jQuery);