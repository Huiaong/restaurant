package cn.hjc.service;

import cn.hjc.entity.User;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface UserService {

    Map<String,Object> login(User user, HttpServletRequest httpServletRequest);

    Integer haveUserName(User user);
}
