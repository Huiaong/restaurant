package cn.hjc.service.impl;

import cn.hjc.dao.CustomerDao;
import cn.hjc.entity.Cart;
import cn.hjc.entity.Customer;
import cn.hjc.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public Map<String, Object> customerLogin(Customer customer, HttpServletRequest httpServletRequest) {
        Customer customerLogin = customerDao.customerLogin(customer);
        Map<String, Object> map = new HashMap<>();
        if (customerLogin == null) {
            map.put("msg", "用户名或密码错误");
        } else if (customerLogin != null) {
            map.put("msg", "loginSuccess");
            httpServletRequest.getSession().setAttribute("customer", customerLogin);
            httpServletRequest.getSession().setAttribute("msg", null);
        }
        return map;
    }

    @Override
    public Long checkPassWord(Customer customer) {
        Customer customer1 = customerDao.checkPassWord(customer);
        if (customer1 != null) {
            System.out.println("passWord true");
            return 1L;
        } else {
            System.out.println("passWord err");
            return -1L;
        }
    }

    @Override
    public Long updatePassWord(Customer customer) {
        Long aLong = customerDao.updatePassWord(customer);
        return aLong;
    }

    @Override
    public Long checkCustomerUserName(Customer customer) {
        Customer customer1 = customerDao.checkCustomerUserName(customer);
        if (customer1 == null) {
            return 1L;
        } else {
            return -1L;
        }
    }

    @Override
    public Long registerCustomer(Customer customer) {
        int customerTotal = customerDao.getCustomerTotal() + 1;
        Cart cart = new Cart();
        cart.setCustomerId(customerTotal);
        cart.setEndEditTime(new Date());

        Long bLong = customerDao.registerCustomer(customer);
        if (bLong > 0) {
            Long aLong = customerDao.registerCart(cart);
            return aLong;
        }else {
            return -1L;
        }
    }
}
