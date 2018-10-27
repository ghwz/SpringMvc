package zw.dao;

import zw.pojo.AuthAccess;

import java.util.List;

public interface AuthAccessDao {
    /**
     * 查询角色的菜单权限
     * @param role_id
     * @return
     */
    List<AuthAccess> getIdsByRoleid(Long role_id);
}
