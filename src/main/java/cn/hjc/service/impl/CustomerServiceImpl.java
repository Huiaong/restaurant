package cn.hjc.service.impl;

import cn.hjc.dao.CustomerDao;
import cn.hjc.entity.Customer;
import cn.hjc.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public Map<String,Object> customerLogin(Customer customer, HttpServletRequest httpServletRequest) {
        Customer customerLogin = customerDao.customerLogin(customer);
        Map<String,Object> map = new HashMap<>();
        if (customerLogin == null) {
            map.put("msg","用户名或密码错误");
        }else if (customerLogin != null){
            map.put("msg","loginSuccess");
            httpServletRequest.getSession().setAttribute("customer",customerLogin);
            httpServletRequest.getSession().setAttribute("msg",null);
        }
        return map;
    }
}
