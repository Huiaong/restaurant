package cn.hjc.service.impl;

import cn.hjc.dao.AdminDao;
import cn.hjc.entity.Admin;
import cn.hjc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public Map<String,Object> adminLogin(Admin admin, HttpServletRequest httpServletRequest) {
        Admin admin1Login = adminDao.adminLogin(admin);
        Map<String,Object> map = new HashMap<>();
        if (admin1Login == null) {
            map.put("msg","用户名或密码错误");
        }else if (admin1Login != null){
            map.put("msg","loginSuccess");
            httpServletRequest.getSession().setAttribute("admin",admin1Login);
            httpServletRequest.getSession().setAttribute("msg",null);
        }
        return map;
    }
}
