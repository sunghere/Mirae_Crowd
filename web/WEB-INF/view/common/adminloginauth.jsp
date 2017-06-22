<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8"/>

<c:if test="${(empty login ) or (login.id eq '') or (login.auth eq 3) }">
    <%
        session.invalidate();
    %>
    <script type="text/javascript">
        alert("관리자가 아닙니다.");

       location.href= 'main.do';
    </script>
    <%
        if (true) return;
    %>
</c:if>
