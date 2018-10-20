package cn.hjc.service.impl;

import cn.hjc.dao.OrderDao;
import cn.hjc.dao.RestaurantDao;
import cn.hjc.entity.Order;
import cn.hjc.entity.Product;
import cn.hjc.queryVo.MyOrder;
import cn.hjc.queryVo.OrderConditions;
import cn.hjc.queryVo.OrderDates;
import cn.hjc.queryVo.TimeHorizon;
import cn.hjc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private RestaurantDao restaurantDao;


    @Override
    public OrderDates<MyOrder> getMyOrderByConditions(OrderConditions orderConditions) {
        OrderDates<MyOrder> orderDates;
        List<MyOrder> myOrders = new ArrayList<MyOrder>();
        MyOrder myOrder;

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        if (orderConditions.getDate() != null && orderConditions.getDate() != "") {
            orderConditions.setDate(orderConditions.getDate().replace("-", "").trim());
        } else if (orderConditions.getTime() != null && orderConditions.getTime() != "") {
            calendar.setTime(new Date());
            Date date;
            switch (orderConditions.getTime()) {
                case "一周以内":
                    calendar.add(Calendar.DATE, -7);
                    break;
                case "一月以内":
                    calendar.add(Calendar.MONTH, -1);
                    break;
                case "一年以内":
                    calendar.add(Calendar.YEAR, -1);
                    break;
            }
            date = calendar.getTime();
            orderConditions.setTimeHorizon(new TimeHorizon(format.format(date), format.format(new Date())));
        }
        //计算分页查询从哪条记录开始
        orderConditions.setStart((orderConditions.getPage() - 1) * orderConditions.getRows());

        Integer total = orderDao.getTotalByConditions(orderConditions);
        //查询总页数
        Integer pageNum = total / orderConditions.getRows();
        if (total % orderConditions.getRows() > 0) {
            pageNum++;
        }
        List<Order> orders = orderDao.getMyOrderByConditions(orderConditions);
        for (Order order : orders) {

            String[] productIds = order.getProductIds().split(",");
            int[] productArray = new int[productIds.length];
            for (int i = 0; i < productIds.length; i++) {
                productArray[i] = Integer.parseInt(productIds[i]);
            }
            List<Product> products = restaurantDao.getCartList(productArray);
            myOrder = new MyOrder(products, format.format(order.getCreateTime()));
            myOrders.add(myOrder);
        }
        orderDates = new OrderDates<>(pageNum, myOrders);
        return orderDates;
    }
}
