package cn.hjc.service.impl;

import cn.hjc.dao.UserDao;
import cn.hjc.entity.User;
import cn.hjc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public Map<String,Object> login(User user, HttpServletRequest httpServletRequest) {
        User login = userDao.login(user);
        Map<String,Object> map = new HashMap<>();
        System.out.println("==========================");
        System.out.println(login);
        if (login == null) {
            map.put("msg","用户名或密码错误");
            System.out.println("login=null");
        }else if (login != null){
            System.out.println("login!=null");
            map.put("enableStatus",login.getEnableStatus());
            map.put("msg","loginSuccess");
            httpServletRequest.getSession().setAttribute("user",login);
        }
        return map;
    }

    @Override
    public Integer haveUserName(User user) {
        User user1 = userDao.haveUserName(user);
        if (user1 != null) {
            return 1;
        }
        return -1;
    }
}