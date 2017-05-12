<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    int totalRecordCount = Integer.parseInt(request.getParameter("totalRecordCount"));
    int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    int pageCountPerScreen = Integer.parseInt(request.getParameter("pageCountPerScreen"));
    int recordCountPerPage = Integer.parseInt(request.getParameter("recordCountPerPage"));

    int totalPageCount = totalRecordCount / recordCountPerPage;

    if ((totalRecordCount % recordCountPerPage) != 0) {
        totalPageCount++;
    }

    int screenStartPageIndex = ((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen;
    int screenEndPageIndex = (((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;

    if (screenEndPageIndex > totalPageCount) screenEndPageIndex = totalPageCount;

    if (((pageNumber + 1) % pageCountPerScreen) == 0) {
        screenStartPageIndex = (((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
        screenEndPageIndex = pageNumber + 1;
    }
%>

<ul class="pagination pagination-sm">
    <li><a title="처음페이지" onclick="goPage('0');">&nbsp;<i class="fa fa-backward"></i>&nbsp;</a></li>
    <li class="disabled"><a href="#">..</a></li>
    <%
        if (screenStartPageIndex > 1) {
    %>
    <li><a title="이전페이지" onclick="goPage('<%=screenStartPageIndex-1%>');">&nbsp;<i class="fa fa-chevron-left"></i>&nbsp;</a></li>
    <%
        }

        for (int i = screenStartPageIndex; i < screenEndPageIndex; i++) {
            if (i == pageNumber) {
    %>
    <li class="active"><a href="#"><%=i + 1%>
    </a></li>
    <%
    } else {
    %>
    <li><a title="<%=i+1%>페이지" onclick="goPage('<%=i%>');"><%=i + 1%>
    </a></li>
    <% }

    }

        if (screenEndPageIndex < totalPageCount) {
    %>
    <li><a title="다음페이지" onclick="goPage('<%=screenEndPageIndex %>');">&nbsp;<i class="fa fa-chevron-right"></i>&nbsp;</a></li>
    <%
        } // end if

        int end_page = 0;
        if (totalPageCount > 0) {
            end_page = totalPageCount - 1;
        }
    %>
    <li class="disabled"><a href="#">..</a></li>
    <li><a title="마지막페이지" onclick="goPage('<%=end_page %>');">&nbsp;<i class="fa fa-forward"></i>&nbsp;</a></li>


</ul>
</div>

