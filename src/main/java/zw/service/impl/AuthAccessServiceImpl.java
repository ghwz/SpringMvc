package zw.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zw.dao.AuthAccessDao;
import zw.pojo.AuthAccess;
import zw.service.AuthAccessService;

import java.util.List;

@Service("authAccessService")
public class AuthAccessServiceImpl implements AuthAccessService {
    @Autowired
    private AuthAccessDao authAccessDao;
    public List<AuthAccess> getIdsByRoleid(Long role_id) {
        return authAccessDao.getIdsByRoleid(role_id);
    }
}
