package zw.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zw.dao.UserDao;
import zw.pojo.User;
import zw.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }
}
