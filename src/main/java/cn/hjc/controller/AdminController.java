package cn.hjc.controller;

import cn.hjc.entity.Admin;
import cn.hjc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/login")
    @ResponseBody
    public Map<String,Object> login(Model model, Admin admin, HttpServletRequest httpServletRequest){
        Map<String, Object> customerLogin = adminService.adminLogin(admin, httpServletRequest);
        return customerLogin;
    }

    @RequestMapping(value = "/loginOutPut")
    @ResponseBody
    public void adminLoginOutPut(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
    }

}
