package cn.hjc.controller;

import cn.hjc.entity.CookBook;
import cn.hjc.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @RequestMapping(value = "list")
    public String list(Model model, CookBook cookBook) {

        List<CookBook> bookList = null;
        List<CookBook> flavorList = restaurantService.getCookFlavor();
        List<CookBook> typeList = restaurantService.getCookType();

        System.out.println(flavorList);
        System.out.println(typeList);

        bookList = restaurantService.getCookByCondition(cookBook);
        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);
        model.addAttribute("bookList", bookList);
        return "restaurant";
    }

    @RequestMapping(value = "update")
    public String update(Model model, CookBook cookBook) {


        return "update";
    }

    @RequestMapping(value = "delete")
    public String delete() {

        return "delete";
    }
}
