package cn.hjc.service;

import cn.hjc.entity.Customer;
import cn.hjc.queryVo.MyOrder;
import cn.hjc.queryVo.OrderConditions;
import cn.hjc.queryVo.OrderDates;

import java.util.List;

public interface OrderService {

    /**
     * 根据Customer获取订单
     * @param orderConditions
     */
    OrderDates<MyOrder> getMyOrderByConditions(OrderConditions orderConditions);
}
