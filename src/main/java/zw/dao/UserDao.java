package zw.dao;

import zw.pojo.User;

public interface UserDao {
    /**
     * 	根据用户名和密码查询用户
     * @param username
     * @return
     */
    User findByUsername(String username);
}
