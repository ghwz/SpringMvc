package zw.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zw.dao.RoleDao;
import zw.pojo.Role;
import zw.service.RoleService;

import java.util.List;
import java.util.Map;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    public List<Role> getAllRoleList(Map<String, Object> params) {
        return roleDao.getAllRoleList(params);
    }
}
