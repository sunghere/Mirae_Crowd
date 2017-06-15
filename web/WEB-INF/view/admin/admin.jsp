<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-05-17
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="menu-tab">
    <ul id="menu_tab" class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#">Site</a></li>
        <li role="presentation"><a href="#">User</a></li>
        <li role="presentation"><a href="#">Crowd</a></li>
    </ul>
    <div class="tab-pane fade active in" role="tabpanel" id="site_tab" aria-labelledby="Site_tab">
        1
    </div>
    <div class="tab-pane fade" role="tabpanel" id="user_tab" aria-labelledby="User_tab">
        2
    </div>
    <div class="tab-pane fade" role="tabpanel" id="crowd_tab" aria-labelledby="Crowd_tab">
        3
    </div>
</div>
<script>

    $('#menu_tab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show')
    })
</script>