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

        List<CookBook> cookBooks = null;
        List<CookBook> cookFlavour = restaurantService.getCookFlavour();
        List<CookBook> cookType = restaurantService.getCookType();

        cookBooks = restaurantService.getCookByCondition(cookBook);
        model.addAttribute("cookType", cookType);
        model.addAttribute("cookFlavour", cookFlavour);
        model.addAttribute("cookBooks", cookBooks);
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
