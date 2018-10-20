package cn.hjc.dao;

import cn.hjc.entity.Customer;
import cn.hjc.entity.Order;
import cn.hjc.queryVo.OrderConditions;

import java.util.List;

public interface OrderDao {

    /**
     * 根据用户获取我的所有订单
     * @param orderConditions
     * @return
     */
    List<Order> getMyOrderByConditions(OrderConditions orderConditions);

    /**
     * 根据条件查询符合条件的记录数
     * @param orderConditions
     * @return
     */
    Integer getTotalByConditions(OrderConditions orderConditions);
}
