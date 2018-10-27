<%--
  Created by IntelliJ IDEA.
  User: superrocye
  Date: 18/10/26
  Time: 上午11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
           <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
           <form role="search" class="navbar-form-custom" action="#">
                <div class="form-group">
                   <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
        <ul class="nav navbar-top-links navbar-right">
           <li>
                <span class="m-r-sm text-muted welcome-message">Welcome to SpringMvc</span>
           </li>
           <li>
                <a href="${pageContext.request.contextPath}/login/out">
                   <i class="fa fa-sign-out"></i> 退出
                </a>
             </li>

        </ul>
</nav>

<div style="display: none">
        <input type="text" hidden value="${controllerMethod}" class="model-url">
</div>