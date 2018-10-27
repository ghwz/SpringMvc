<%--
  Created by IntelliJ IDEA.
  User: superrocye
  Date: 18/10/23
  Time: 上午10:18
  To change this template use File | Settings | File Templates.
--%>
 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar-collapse">
    <ul class="nav metismenu" id="side-menu">
        <!-- 个人信息 -->
        <li class="nav-header">
            <div class="dropdown profile-element">
                <a href="${pageContext.request.contextPath}/admin/index/index">
                <span><img alt="image" width="64" height="64" class="img-circle" src="${pageContext.request.contextPath}/images/logo.jpg" /></span>
                </a>
            </div>
            <div class="logo-element">
                Admin
            </div>
        </li>
        <!-- 菜单列表 -->
        <!-- 一级菜单 -->
        <li>
            <a href="${pageContext.request.contextPath}/admin/index/index" data-model="/admin/index/index"><i class="fa fa-th-large"></i> <span class="nav-label">首页</span></a>
        </li>
        <c:if test="${not empty menus}">
            <c:forEach var="item" items="${menus}" varStatus="loop">
                <li>
                    <c:if test="${not empty item.children}">
                        <a href="#"><i class="fa fa-cog"></i> <span class="nav-label">${item.title}</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <c:forEach var="subitem" items="${item.children}">
                             <li><a href="${pageContext.request.contextPath}/${subitem.ruleVal}" data-model="${pageContext.request.contextPath}/${subitem.ruleVal}">${subitem.title}</a></li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <c:if test="${empty item.children}">
                        <a href="${pageContext.request.contextPath}/${item.ruleVal}" data-model="${pageContext.request.contextPath}/${item.ruleVal}"><i class="fa fa-th-large"></i> <span class="nav-label">${item.title}</span></a>
                    </c:if>
                </li>
            </c:forEach>
        </c:if>

    </ul>
</div>