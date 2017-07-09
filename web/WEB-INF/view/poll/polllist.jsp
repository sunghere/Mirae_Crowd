<%@page import="com.sung.hee.help.DateUtil" %>
<%@page import="com.sung.hee.poll.model.SHPoll" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<%
List<SHPoll> plists = new ArrayList();
    Object Oflist = request.getAttribute("plists");
    if (Oflist != null) {
        plists = (List<SHPoll>) Oflist;
    }
%>
<c:if test="${login.auth ne '3'}">
    <table class="table list_table" style="width:95%;">

        <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>질문</th>
            <th>시작일</th>
            <th>끝나는날</th>
            <th>투표수</th>
            <th>등록일</th>
        </tr>
        <%
            for (int i = 0; i < plists.size(); i++) {
                SHPoll poll = plists.get(i);
        %>
        <tr bgcolor='#aabbcc'>
            <td><%=(i + 1) %>
            </td>
            <td><%=poll.getId()%>
            </td>
            <td><%=poll.getQuestion()%>
            </td>
            <td><%=poll.getSdate() %>
            </td>
            <td><%=DateUtil.pollState(poll.getEdate())%><%=poll.getEdate() %>
            </td>
            <td><%=poll.getPolltotal() %>
            </td>
            <td><%=poll.getRegdate() %>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</c:if>
<c:if test="${login.auth ne '3'}">
    <table class="table table-responsive table-striped list_table" style="width:95%;">
        <thead>
        <tr>
            <th class="col-md-1 col-lg-1 col-sm-1 col-xs-1">번호</th>
            <th class="col-md-1 col-lg-1 col-sm-1 col-xs-1">아이디</th>
            <th class="col-md-3 col-lg-3 col-sm-3 col-xs-3">질문</th>
            <th class="col-md-1 col-lg-1 col-sm-1 col-xs-1">결과</th>
            <th class="col-md-1 col-lg-1 col-sm-1 col-xs-1">시작일</th>
            <th class="col-md-1 col-lg-1 col-sm-1 col-xs-1">마감일</th>
            <th class="col-md-1 col-lg-1 col-sm-1 col-xs-1">투표수</th>
            <th class="col-md-1 col-lg-1 col-sm-1 col-xs-1">등록일</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < plists.size(); i++) {
                SHPoll poll = plists.get(i);
        %>
        <tr bgcolor='#aabbcc'>
            <td><%=(i + 1) %>
            </td>
            <td><%=poll.getId()%>
            </td>
            <%
                boolean isS = poll.isVote();
                if (isS || DateUtil.isEnd(poll.getEdate())) {//이미 투표 기한이 지남
            %>
            <td>[마감]<%=poll.getQuestion() %>
            </td>
            <%
            } else {//투표할 수 있다.
            %>
            <td><a href='polldetail.do?pollid=<%=poll.getPollid()%>'><%=poll.getQuestion() %>
            </a></td>
            <%
                }
            %>
            <td>
                <%
                    if (isS || DateUtil.isEnd(poll.getEdate())) {
                %>
                <a href='pollresult.do?pollid=<%=poll.getPollid()%>'>결과</a>
                <%
                } else {//투표안했다.
                    //못본다.
                %>
                <img alt="투표" src="./image/pen.gif"/>
                <%
                    }
                %>
            </td>
            <td><%=poll.getSdate() %>
            </td>
            <td><%=DateUtil.pollState(poll.getEdate())%><%=poll.getEdate() %>
            </td>

            <td><%=poll.getPolltotal() %>
            </td>
            <td><%=poll.getRegdate() %>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</c:if>

