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
                        <h5>{:lang('Auth List')}</h5>
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
                        {toolbar id="toolbar"}

                        {/toolbar}
                        <!-- 表格数据 -->
                        <table id="table" data-toggle="gridview" class="table" data-url="{:url('admin/authrule/getData');}" data-toolbar="#toolbar" data-show-columns="true" data-page-size="5" data-page-list="[5, 25, 50, All]" data-unique-id="id" data-pagination="true" data-side-pagination="client" data-click-to-select="false">
                            <thead>
                            <tr>
                                <th data-width="40"  data-align="center"  data-checkbox="true"></th>
                                <th data-width="50" data-field="id">ID</th>
                                <th data-field="title">{:lang('Auth Name')}</th>
                                <th data-field="rule_val">RULE_VAL</th>
                                <th data-width="80" data-field="operate"   data-align="center" data-formatter="operateFormatter" data-events="operateEvents">{:lang('Operate')}</th>
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
                '<a class="btn btn-xs edit" href="javascript:void(0)" title="{$Think.lang.Edit}">',
                '<i class="fa fa-edit"></i>',
                '</a>  ',
                '<a class="btn btn-xs delete" href="javascript:void(0)" title="{$Think.lang.Delete}">',
                '<i class="fa fa-trash"></i>',
                '</a>'
            ].join('');
        }

        var operateEvents = {
            'click .edit': function (e, value, row, index) {
                var param = {
                    url: "{:url('admin/authrule/edit')}",
                    data: {id: row.id}
                }
                $("#table").gridView('loadModal', param.url,param.data)
            },
            'click .delete': function (e, value, row, index) {
                $("#table").gridView('deleteModal', 'delete', row)

            }
        };


        function format_status(status,row,index) {
            if(status == 1){
                return '{:lang("Start")}'
            }else if(status == 2){
                return  '{:lang("Hide")}'
            }else if(status == 0){
                return  '{:lang("Off")}'
            }
        }

        function format_sort(sort,row,index) {
            return '<input type="text" class="form-control sort" data-id="'+row.id+'"  value="'+sort+'" />';
        }

    </script>
</tmpl:overwrite>

<%@ include file="../templete.jsp" %>
