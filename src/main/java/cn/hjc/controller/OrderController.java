package cn.hjc.controller;

import cn.hjc.entity.Customer;
import cn.hjc.queryVo.MyOrder;
import cn.hjc.queryVo.OrderConditions;
import cn.hjc.queryVo.OrderDates;
import cn.hjc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/myOrder")
    public String myOrder(OrderConditions orderConditions, Model model, HttpServletRequest request) {
        orderConditions.setCustomer((Customer) request.getSession().getAttribute("customer"));
        OrderDates<MyOrder> orderDates = orderService.getMyOrderByConditions(orderConditions);
        model.addAttribute("orderDates", orderDates);
        model.addAttribute("orderConditions",orderConditions);
        return "order";
    }

}
