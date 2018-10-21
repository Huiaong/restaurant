package cn.hjc.dao;

import cn.hjc.entity.Cart;
import cn.hjc.entity.Customer;

public interface CustomerDao {

    Customer customerLogin(Customer customer);

    Customer checkPassWord(Customer customer);

    Long updatePassWord(Customer customer);

    Customer checkCustomerUserName(Customer customer);

    Long registerCustomer(Customer customer);

    int getCustomerTotal();

    Long registerCart(Cart cart);
}
