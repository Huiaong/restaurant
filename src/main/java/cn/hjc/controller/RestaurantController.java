package cn.hjc.controller;

import cn.hjc.entity.CookBook;
import cn.hjc.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/restaurant/")
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @RequestMapping(value = "welcome")
    public String welcome(Model model){

        List<CookBook> typeList = restaurantService.getCookType();

        List<CookBook> cookDates = restaurantService.getAllCookBook();

        System.out.println("============================================");
        System.out.println(cookDates);


        model.addAttribute("typeList",typeList);
        model.addAttribute("cookDates",cookDates);

        return "restaurant";
    }

    @RequestMapping(value = "index")
    public String index(){

        return "index";
    }


}
