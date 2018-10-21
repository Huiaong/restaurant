package cn.hjc.dao;

import cn.hjc.entity.Customer;

public interface CustomerDao {

    Customer customerLogin(Customer customer);

    Customer checkPassWord(Customer customer);

    Long updatePassWord(Customer customer);
}
