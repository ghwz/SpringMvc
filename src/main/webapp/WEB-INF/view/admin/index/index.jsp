<%--
  Created by IntelliJ IDEA.
  User: superrocye
  Date: 18/10/22
  Time: 上午11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../taglibs.jsp" %>

<tmpl:overwrite name="title">首页</tmpl:overwrite>
<tmpl:overwrite name="content">

    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right">Total</span>
                        <h5>Star</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins" id="github-star-count"></h1>
                        <div class="stat-percent font-bold text-success">100% <i class="fa fa-bolt"></i></div>
                        <a href="https://github.com/Astonep/tp-admin" target="_blank">
                            <small>Github</small>
                        </a>
                    </div>


                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">Annual</span>
                        <h5>Page view</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins" id="page-view">275,800</h1>
                        <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div>
                        <small>Page view</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">Today</span>
                        <h5>Unique Visitor</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">106,120</h1>
                        <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i></div>
                        <small>New Visitor</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">Today</span>
                        <h5>IP</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">{$data.ip ?? ''}</h1>
                        <div class="stat-percent font-bold text-navy">38% <i class="fa fa-level-down"></i></div>
                        <small>In first month</small>
                    </div>
                </div>
            </div>
        </div>
    </div>




</tmpl:overwrite>
<tmpl:overwrite name="page_script">
    <script type="text/javascript">

    </script>
</tmpl:overwrite>

<%@ include file="../templete.jsp" %>
