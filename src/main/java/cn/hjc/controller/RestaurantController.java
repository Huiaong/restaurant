package cn.hjc.controller;

import cn.hjc.entity.CookBook;
import cn.hjc.service.RestaurantService;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@JsonIgnoreProperties(ignoreUnknown = true)
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

    @RequestMapping(value = "editCook")
    @ResponseBody
    public CookBook editCook(Integer id) {

        CookBook cookBook = restaurantService.getCookById(id);
        return cookBook;
    }

    @RequestMapping(value = "update")
    @ResponseBody
    public Long update(String cookId,String cookName,String cookFlavor,String cookRepertory,String cookPrice,String cookType) {
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

    @RequestMapping(value = "delete")
    public String delete() {

        return "delete";
    }
}
