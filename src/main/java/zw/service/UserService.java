package zw.service;

import org.springframework.transaction.annotation.Transactional;
import zw.pojo.User;

@Transactional
public interface UserService {
    public User findByUsername(String username);
}
