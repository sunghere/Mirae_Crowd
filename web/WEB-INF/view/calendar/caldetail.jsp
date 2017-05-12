<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<script type="text/javascript">
function modifydate(seq){
	location.href='calupdate.do?seq='+seq;
}
function deletedate(seq){
	location.href='caldel.do?seq='+seq;
}
</script>
<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
<tr>
<th>아이디</th>
<td style="text-align: left">${shcal.id}</td>
</tr>
<tr>
<th>제목</th>
<td style="text-align: left">${shcal.title}</td>
</tr>
<tr>
<tr>
<th>일정</th>
<td style="text-align: left">${shcal.wdate}</td>
</tr>
<tr>
<th>내용</th>
<td style="text-align: left"><textarea  name='content' rows="20" cols="60" 
readonly="readonly">${shcal.content}</textarea></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="button" value='수정하기' onclick="modifydate('${shcal.seq}');"/>
<input type="button" value='삭제하기' onclick="deletedate('${shcal.seq}');"/>
</td>
</tr>

</table>

<a href='${urls}'>일정보기</a>