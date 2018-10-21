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
    public Map<String, Object> login(Model model, Customer customer, HttpServletRequest httpServletRequest) {
        Map<String, Object> customerLogin = customerService.customerLogin(customer, httpServletRequest);
        return customerLogin;
    }

    @RequestMapping(value = "/loginOutPut")
    @ResponseBody
    public void customerLoginOutPut(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().invalidate();
    }

    @RequestMapping(value = "/changePassWord")
    public String changePassWord() {
        return "changePassWord";
    }

    @RequestMapping(value = "/checkPassWord")
    @ResponseBody
    public Long checkPassWord(Customer customer, HttpServletRequest request) {
        Customer customer1 = (Customer) request.getSession().getAttribute("customer");
        customer.setCustomerUserName(customer1.getCustomerUserName());
        Long aLong = customerService.checkPassWord(customer);
        return aLong;
    }

    @RequestMapping(value = "/updatePassWord")
    public String updatePassWord(Customer customer, HttpServletRequest request) {
        Customer customer1 = (Customer) request.getSession().getAttribute("customer");
        customer.setCustomerUserName(customer1.getCustomerUserName());
        Long along = customerService.updatePassWord(customer);
        if (along > 0) {
            request.getSession().invalidate();
            return "redirect:/restaurant/welcome.action";
        }else {
            return "changePassWord";
        }
    }
}
