package cn.hjc.service;

import cn.hjc.entity.Customer;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface CustomerService {

    Map<String,Object> customerLogin(Customer customer, HttpServletRequest httpServletRequest);

    Long checkPassWord(Customer customer);

    Long updatePassWord(Customer customer);
}
