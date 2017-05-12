<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-04-21
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <a href="#" class="thumbnail">
                <img src="image/img02gsee.jpg" alt="...">
            </a>
            <div class="carousel-caption">
            </div>
        </div>
        <div class="item">
            <a href="#" class="thumbnail">
                <img src="image/img02gsee.jpg" alt="...">
            </a>
            <div class="carousel-caption">
                <h3>가라요</h3>
                <p>...</p>
            </div>
        </div>
        <div class="item">
            <img src="image/img02gsee.jpg" class="img4" alt="...">
            <div class="carousel-caption">
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>