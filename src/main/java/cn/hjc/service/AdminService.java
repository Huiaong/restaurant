package cn.hjc.service;

import cn.hjc.entity.Admin;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface AdminService {

    Map<String, Object> adminLogin(Admin admin, HttpServletRequest httpServletRequest);
}
