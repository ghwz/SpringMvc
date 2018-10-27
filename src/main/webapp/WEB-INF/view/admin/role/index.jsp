<%--
  Created by IntelliJ IDEA.
  User: superrocye
  Date: 18/10/22
  Time: 上午11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../taglibs.jsp" %>

<tmpl:overwrite name="content">

    <!-- Data Tables -->
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins" style="background: white;padding: 10px">
                    <!-- 表单标题概要 -->
                    <div class="ibox-title">
                        <h5>角色列表</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <!-- 表单内容 -->
                    <div class="ibox-content">
                        <!-- 用户控件（操作） -->
                        <tmpl:toolbar dataid="toolbar" url="admin/role"></tmpl:toolbar>
                        <!-- 表格数据 -->
                        <table id="table" data-toggle="gridview" class="table" data-url="${pageContext.request.contextPath}/admin/role/getListJSON" data-toolbar="#toolbar" data-show-columns="true" data-page-size="10" data-page-list="[10, 25, 50, All]" data-unique-id="id" data-pagination="true" data-side-pagination="client" data-search="true" data-click-to-select="false">
                            <thead>
                            <tr>
                                <th data-width="40" data-checkbox="true"></th>
                                <th data-width="100" data-field="name">角色名称</th>
                                <th data-width="100" data-field="status" data-formatter="format_status">状态</th>
                                <th data-field="remark">备注</th>
                                <th data-width="100" data-field="operate" data-align="center" data-formatter="operateFormatter" data-events="operateEvents">操作</th>

                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>




</tmpl:overwrite>
<tmpl:overwrite name="page_script">

    <script type="text/javascript">
        function operateFormatter(value, row, index) {
            return [
                '<a class="btn btn-xs access_menu" href="javascript:void(0)" title="用户授权">',
                '<i class="fa fa-certificate"></i>',
                '</a>  ',
                '<a class="btn btn-xs edit" href="javascript:void(0)" title="编辑">',
                '<i class="fa fa-edit"></i>',
                '</a>  ',
                '<a class="btn btn-xs delete" href="javascript:void(0)" title="删除">',
                '<i class="fa fa-trash"></i>',
                '</a>'
            ].join('');
        }

        var operateEvents = {
            'click .access_menu': function (e, value, row, index) {
                var param = {
                    url: '${pageContext.request.contextPath}/admin/authrule/setauth',
                    data: {id: row.id}
                }
                window.location.href = param.url + '?id=' + param.data.id;
            },
            'click .edit': function (e, value, row, index) {
                var param = {
                    url: "${pageContext.request.contextPath}/admin/role/edit",
                    data: {id: row.id}
                }
                $("#table").gridView('loadModal', param.url,param.data)
            },
            'click .delete': function (e, value, row, index) {
                $("#table").gridView('deleteModal', 'delete', row)

            }
        };

        function format_status(status, row, index) {
            if(status == 1){
                return '开启'
            }else if(status == 0){
                return '关闭'
            }
        }
    </script>



</tmpl:overwrite>

<%@ include file="../templete.jsp" %>
