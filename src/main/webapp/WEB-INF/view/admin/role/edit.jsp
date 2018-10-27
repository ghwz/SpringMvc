<%--
  Created by IntelliJ IDEA.
  User: superrocye
  Date: 18/10/27
  Time: 下午6:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form data-method="post" data-action="{:url('admin/role/saveData')}" data-submit="ajax" data-validate="true" class="form-horizontal" data-root="${pageContext.request.contextPath}">
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title">${data['id']?'编辑':'新增'}角色</h3>
                </div>
                <input type="hidden" name="id" value="${data.id ?data.id : ''}">
                <div class="modal-body">
                    <div class="modal-body-content">
                        <div class="form-group must">
                            <label class="col-sm-3 control-label">角色名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" maxlength="8"  placeholder="至多8个字符" required value="${data.name ?data.name: ''}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态</label>
                            <div class="col-sm-7">
                                <select name="status" class="form-control" required>
                                    <option value="1" ${data['status']==1 ? 'selected' : ''}>开启</option>
                                    <option value="0" ${$data['status']==0 ? 'selected' : ''}>关闭</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">备注</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="remark" maxlength="10" placeholder="至多10个字符"  value="${data.remark ?data.remark: ''}"  >
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>
</form>
