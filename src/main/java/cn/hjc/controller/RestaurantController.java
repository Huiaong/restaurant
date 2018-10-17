package cn.hjc.controller;

import cn.hjc.entity.Cart;
import cn.hjc.entity.Product;
import cn.hjc.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/restaurant")
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @RequestMapping(value = "/welcome")
    public String welcome(Model model) {
        List<Product> typeList = restaurantService.getProductType();
        List<Product> cookDates = restaurantService.getAllProduct();
        model.addAttribute("typeList", typeList);
        model.addAttribute("cookDates", cookDates);
        return "restaurant";
    }

    @RequestMapping(value = "/addToCart")
    @ResponseBody
    public Long index(Cart cart) {
        Long aLong = restaurantService.addToCart(cart);
        return aLong;
    }

    @RequestMapping(value = "/getCart")
    @ResponseBody
    public int[] getCart(Model model,Cart cart) {
        int[] cartArray = restaurantService.getCart(cart);
        return cartArray;
    }

    @RequestMapping(value = "/getCartList")
    @ResponseBody
    public List<Product> getCartList(int[] productIds){
        List<Product> cartList = restaurantService.getCartList(productIds);
        return cartList;
    }

    @RequestMapping(value = "/deleteCartList")
    @ResponseBody
    public Long deleteCartListByProductId(Cart cart){
        Long aLong = restaurantService.deleteCartListByProductId(cart);
        return aLong;
    }

    @RequestMapping(value = "/submitOrder")
    @ResponseBody
    public Long submitOrder(Model model,Cart cart) {
        Long aLong = restaurantService.submitOrder(cart);
        return aLong;

    }

}
