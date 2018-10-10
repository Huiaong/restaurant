package cn.hjc.controller;

import cn.hjc.entity.Cart;
import cn.hjc.entity.CookBook;
import cn.hjc.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/restaurant/")
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @RequestMapping(value = "welcome")
    public String welcome(Model model) {

        List<CookBook> typeList = restaurantService.getCookType();

        List<CookBook> cookDates = restaurantService.getAllCookBook();

        System.out.println("============================================");
        System.out.println(cookDates);


        model.addAttribute("typeList", typeList);
        model.addAttribute("cookDates", cookDates);

        return "restaurant";
    }

    @RequestMapping(value = "addToCart")
    @ResponseBody
    public Long index(Cart cart) {
        System.out.println("============================================");
        System.out.println(cart);

        Long aLong = restaurantService.addToCart(cart);
        return aLong;
    }

    @RequestMapping(value = "getCart")
    @ResponseBody
    public int[] getCart(Model model,Cart cart) {
        int[] cartArray = restaurantService.getCart(cart);
        return cartArray;
    }

    @RequestMapping(value = "getCartList")
    @ResponseBody
    public List<CookBook> getCartList(int[] cookId){
        List<CookBook> cartList = restaurantService.getCartList(cookId);
        return cartList;
    }


}
