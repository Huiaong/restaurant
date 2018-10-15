package cn.hjc.interceptor;

import cn.hjc.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BackStageInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            if (user.getEnableStatus() > 1){
                return true;
            }else {
                session.setAttribute("msg", "您好，您的权限不足，无权操作，请更换账号！");
                System.out.println(session.getAttribute("msg"));
            }
        }else {
            session.setAttribute("msg", "您好,您没有登陆，无权操作，请先登录！");
            System.out.println(session.getAttribute("msg"));
        }
        httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/BackStage/backStageManagement.action");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
