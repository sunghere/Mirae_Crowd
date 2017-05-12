<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8"/>
<tiles:insertAttribute name="common"/>
<html>
<head>
    <tiles:insertAttribute name="header"/>
</head>
<body>
<div id="body_wrap">
    <div id="main_wrap">
        <div id="header_wrap">
            <tiles:insertAttribute name="top_inc"/>
            <tiles:insertAttribute name="top_menu"/>
        </div>

        <div id="middle_wrap">
            <div id="sidebar_wrap">
                <tiles:insertAttribute name="left_main"/>
            </div>
            <section id="two">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <tiles:insertAttribute name="main"/>
                            <hr class="primary">
                        </div>
                    </div>
                </div>

        </div><!--  //middle_wrap -->

        <div id="footer_wrap">
            <tiles:insertAttribute name="bottom_inc"/>
        </div><!--  //footer_wrap -->

    </div>    <!--  //main_wrap -->
</div><!--  //body_wrap -->

</body>
</html>
