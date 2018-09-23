package cn.hjc.controller;

import cn.hjc.entity.CookBook;
import cn.hjc.entity.CookConditions;
import cn.hjc.entity.CookDates;
import cn.hjc.service.RestaurantService;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @RequestMapping(value = "list")
    public String list(Model model, CookConditions cookConditions) {

        List<CookBook> flavorList = restaurantService.getCookFlavor();
        List<CookBook> typeList = restaurantService.getCookType();

        CookDates<CookBook> cookDates = restaurantService.getCookByCondition(cookConditions);

        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);
        model.addAttribute("cookDates", cookDates);

        model.addAttribute("cookConditions", cookConditions);
        return "restaurant";
    }

    @RequestMapping(value = "putAway")
    public String putAway(Model model, CookConditions cookConditions) {
        CookDates<CookBook> putAwayCook = restaurantService.getPutAwayCook(cookConditions);

        List<CookBook> flavorList = restaurantService.getCookFlavor();
        List<CookBook> typeList = restaurantService.getCookType();
        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);
        model.addAttribute("cookDates", putAwayCook);
        model.addAttribute("cookConditions", cookConditions);
        return "restaurant";
    }

    @RequestMapping(value = "editEnableStatus")
    @ResponseBody
    public Long editEnableStatus(Integer id){
        return restaurantService.editEnableStatus(id);
    }

    @RequestMapping(value = "editCook")
    @ResponseBody
    public CookBook editCook(Integer id) {

        CookBook cookBook = restaurantService.getCookById(id);
        return cookBook;
    }

    @RequestMapping(value = "update")
    @ResponseBody
    public Long update(CookBook cookBook) {
        System.out.println("========================================");
        System.out.println(cookBook);

        Long aLong = restaurantService.updateCook(cookBook);
        return aLong;
    }

    @RequestMapping(value = "soldOut")
    @ResponseBody
    public Long soldOut(Integer cookId) {
        Long aLong = restaurantService.soldOutCookById(cookId);
        return aLong;
    }

    @RequestMapping(value = "save")
    @ResponseBody
    public Long saveCookBook(CookBook cookBook) {
        System.out.println("==========================");
        System.out.println(cookBook);
        Long aLong = restaurantService.saveCook(cookBook);
        return aLong;
    }

}
