package zw.dao;

import zw.pojo.Role;

import java.util.List;
import java.util.Map;

public interface RoleDao {
    /**
     * 查询所有角色
     * @param params
     * @return
     */
    List<Role> getAllRoleList(Map<String,Object> params);
}
