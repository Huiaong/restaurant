package cn.hjc.controller;

import cn.hjc.entity.User;
import cn.hjc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping(value = "/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login")
    @ResponseBody
    public Map<String,Object> login(Model model, User user, HttpServletRequest httpServletRequest){
        Map<String, Object> login = userService.login(user, httpServletRequest);
        return login;
    }

    @RequestMapping(value = "loginOutPut")
    @ResponseBody
    public void loginOutPut(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
    }

    @RequestMapping(value = "haveUserName")
    @ResponseBody
    public Integer haveUserName(User user){
        Integer integer = userService.haveUserName(user);
        return integer;
    }

}
