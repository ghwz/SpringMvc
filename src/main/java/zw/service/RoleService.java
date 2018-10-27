package zw.service;

import zw.pojo.Role;

import java.util.List;
import java.util.Map;

public interface RoleService {
    /**
     * 查询所有角色
     * @param params
     * @return
     */
    List<Role> getAllRoleList(Map<String,Object> params);
}
