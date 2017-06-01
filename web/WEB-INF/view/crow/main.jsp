<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-04-21
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
.list-section {height:400px; margin-bottom: 1%; background-color : #fff;}
.list-main { cursor: pointer; padding: 2% 2%; }
.list-section .list-main:LAST-CHILD {margin-right:0;}
.main-img-section {width:100%; height:200px;}
.main-info-section {font-size:14px; height:200px; padding:2% 5%; background-color : #f8f8f8;}
.info-title {height:48px; line-height:24px; padding:5% 0; font-weight:bold; text-overflow: ellipsis; font-size: 17px;}
.tags {float:left;}
.category {float:right;}

.container {
padding : 0 5%;
}
.modal-content-main {width:90%; height:90%;}
</style>
<script>
var toGoal = function(goalmoney, curmoney) {
	var per = (curmoney/goalmoney)*100;
// 	console.log($(".progress").children().addClass("progress-bar-danger"));

	return per;
}
var dateCountdown = function(edate) {
	var today = new Date();
	var edateArray = edate.split("-");

	var edateObj = new Date(edateArray[0], Number(edateArray[1])-1, edateArray[2]);

	var between = Math.floor((edateObj.getTime() - today.getTime())/1000/60/60/24);
	if(between < 0) return 0;
	else return between;
}
var imageInput = function(src_list,data) {
	$.each(data, function(index, val) {

		var src=src_list[index];
		$('#list-img'+val.seq).css({"background-image": 'url("'+src+'")', "-webkit-background-size": "cover",
		  "-moz-background-size": "cover", "-o-background-size": "cover", "background-size": "100%"});
	})
}
var imageCarrier = function(content) {
	var contentArray = new Array();
	contentArray= content.split('src="') ;
	if(contentArray[1] != null && contentArray[1] != "") {
		var src=contentArray[1].split('"')

		return src[0];
	} else {

	}
	return "";
}
$(function() {
	var initList=function() {
		$.ajax({
			url:"cListInit.do",
			method: "post",
			data: {},
			success: function(data) {
				var str="";
				var src_list = new Array();
				$.each(data, function(index, val) {
					if(index % 3 == 0) {/*<div class='col-md-12 list-section'>  */
						str += "";
					}
					str += "<div class='list-main col-md-4 col-sm-12' data-target='#contentModal' data-toggle='modal' id='crowdcontent"+val.seq+"'>" +
					"<div class='main-img-section' id='list-img"+val.seq+"'>"+
					"<div class='progress'>"+
				    "<div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='"+toGoal(val.goalmoney, val.curmoney)+"' "+
				    "aria-valuemin='0' aria-valuemax='100' style='width:"+toGoal(val.goalmoney, val.curmoney)+"%'></div></div>"+
					"</div>"+
					"<div class='main-info-section'><div class='card-block info-title'>"+val.title+"</div>"+
					"<div class='card-block'>"+dateCountdown(val.edate)+"</div>"+
					"<div class='card-block'>"+val.id+"</div>"+
					"<div class='tags'>"+val.tag+"</div><div class='category'>"+val.category+"</div></div>"+
					"</div>";
					var src = imageCarrier(val.content);
					src_list.push(src);
				})

				$('#crowdlist').html(str);

				imageInput(src_list,data);
				$(".progress-bar").each(function(index,val) {

					if($(val).attr('aria-valuenow') < 30 ) {
						$(val).addClass("progress-bar-danger");
					} else if($(val).attr('aria-valuenow') >= 30 || $(val).attr('aria-valuenow') < 70) {
						$(val).addClass("progress-bar-info");
					} else {
						$(val).addClass("progress-bar-success");
					}
				});
			},error:function(a,b,c){

			}
		})
	};

	initList();
})
</script>
<%--컨텐츠 모달--%>
<div id="contentModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-content-main">
        <div class="modal-content">
            <div class="modal-body">
                <div id="chatlist"></div>
                <input type="text" class="form-control input-lg" id="chat-text">
            </div>
        </div>
    </div>
</div>

<div class="card-columns mb-3">
<div class='row'  id="crowdlist">
</div>
</div>

