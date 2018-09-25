package cn.hjc.dao;

import cn.hjc.entity.User;

public interface UserDao {

    User login(User user);

    User haveUserName(User user);
}
