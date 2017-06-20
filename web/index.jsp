<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-04-13
  Time: 오후 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
%>
<html>
<head>
    <title>어서와</title>
</head>
<body>
<%
    response.sendRedirect("main.do");
%>
</body>
</html>
