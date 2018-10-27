package zw.service;

import org.springframework.transaction.annotation.Transactional;
import zw.pojo.AuthAccess;

import java.util.List;
@Transactional
public interface AuthAccessService {
    List<AuthAccess> getIdsByRoleid(Long role_id);
}
