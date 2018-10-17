package cn.hjc.controller;

import cn.hjc.entity.Customer;
import cn.hjc.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/login")
    @ResponseBody
    public Map<String,Object> login(Model model, Customer customer, HttpServletRequest httpServletRequest){
        Map<String, Object> customerLogin = customerService.customerLogin(customer, httpServletRequest);
        return customerLogin;
    }

    @RequestMapping(value = "/loginOutPut")
    @ResponseBody
    public void customerLoginOutPut(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
    }

}
