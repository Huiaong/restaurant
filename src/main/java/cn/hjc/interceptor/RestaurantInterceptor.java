package cn.hjc.interceptor;

import cn.hjc.entity.Admin;
import cn.hjc.entity.Customer;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RestaurantInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            return true;
        }else {
            session.setAttribute("msg", "您好,您没有登陆，无权操作，请先登录！");
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/restaurant/welcome.action");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
