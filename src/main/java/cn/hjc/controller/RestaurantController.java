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

        System.out.println("========================================");
        System.out.println(cookConditions.getCookName());
        System.out.println(cookConditions.getCookFlavor());
        System.out.println(cookConditions.getCookType());
        System.out.println(cookConditions.getPage());

        List<CookBook> flavorList = restaurantService.getCookFlavor();
        List<CookBook> typeList = restaurantService.getCookType();

        CookDates<CookBook> cookDates = restaurantService.getCookByCondition(cookConditions);

        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);
        model.addAttribute("cookDates", cookDates);

        model.addAttribute("cookConditions",cookConditions);
        System.out.println("=====================================");
        return "restaurant";
    }


    @RequestMapping(value = "editCook")
    @ResponseBody
    public CookBook editCook(Integer id) {

        CookBook cookBook = restaurantService.getCookById(id);
        return cookBook;
    }

    @RequestMapping(value = "update")
    @ResponseBody
    public Long update(String cookId, String cookName, String cookFlavor, String cookRepertory, String cookPrice, String cookType) {
        CookBook cookBook = new CookBook();
        cookBook.setCookId(Integer.valueOf(cookId));
        cookBook.setCookName(cookName);
        cookBook.setCookFlavor(cookFlavor);
        cookBook.setCookRepertory(Integer.valueOf(cookRepertory));
        cookBook.setCookPrice(Integer.valueOf(cookPrice));
        cookBook.setCookType(cookType);
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
    public Long saveCookBook(String cookName, String cookFlavor, String cookRepertory, String cookPrice, String cookType) {
        CookBook cookBook = new CookBook();
        cookBook.setCookName(cookName);
        cookBook.setCookFlavor(cookFlavor);
        cookBook.setCookRepertory(Integer.valueOf(cookRepertory));
        cookBook.setCookPrice(Integer.valueOf(cookPrice));
        cookBook.setCookType(cookType);
        Long aLong = restaurantService.saveCook(cookBook);
        return aLong;
    }
}
