<%--
  Created by IntelliJ IDEA.
  User: superrocye
  Date: 18/10/22
  Time: 上午11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="./taglibs.jsp" %>
<%@ include file="layout/head.jsp" %>

<body>
<div id="wrapper">
    <!-- 左侧菜单 -->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <%@ include file="layout/navbar.jsp" %>
    </nav>

    <!-- 右侧 -->
    <div id="page-wrapper" class="gray-bg">
        <!-- 头部 -->
        <div class="row border-bottom">
            <%@ include file="layout/top.jsp" %>
        </div>

        <!-- 内容 -->
        <div>
            <tmpl:block name="content" />
        </div>

        <!-- 页脚 -->
        <div>
            <%@ include file="layout/foot.jsp" %>
        </div>
    </div>
</div>

<%@ include file="layout/bottom.jsp" %>


</body>
</html>



