package cn.hjc.controller;

import cn.hjc.entity.CookBook;
import cn.hjc.entity.CookConditions;
import cn.hjc.entity.CookDates;
import cn.hjc.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

@Controller
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    /**
     * 菜品管理后台端入口
     * @param model
     * @return
     */
    @RequestMapping(value = "backStageManagement")
    public String bSManagement(Model model){
        List<CookBook> flavorList = restaurantService.getCookFlavor();
        List<CookBook> typeList = restaurantService.getCookType();
        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);

        return "backStage";
    }

    /**
     * 菜品管理主菜单
     * @param model
     * @param cookConditions
     * @return
     */
    @RequestMapping(value = "list")
    public String list(Model model, CookConditions cookConditions) {

        List<CookBook> flavorList = restaurantService.getCookFlavor();
        List<CookBook> typeList = restaurantService.getCookType();

        CookDates<CookBook> cookDates = restaurantService.getCookByCondition(cookConditions);

        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);
        model.addAttribute("cookDates", cookDates);

        model.addAttribute("cookConditions", cookConditions);
        return "backStage";
    }

    /**
     *
     * @param model
     * @param cookConditions
     * @return
     */
    @RequestMapping(value = "putAway")
    public String putAway(Model model, CookConditions cookConditions) {
        CookDates<CookBook> putAwayCook = restaurantService.getPutAwayCook(cookConditions);

        List<CookBook> flavorList = restaurantService.getCookFlavor();
        List<CookBook> typeList = restaurantService.getCookType();
        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);
        model.addAttribute("cookDates", putAwayCook);
        model.addAttribute("cookConditions", cookConditions);
        return "backStage";
    }

    /**
     * 修改菜品上/下架情况
     * @param id
     * @return
     */
    @RequestMapping(value = "editEnableStatus")
    @ResponseBody
    public Long editEnableStatus(Integer id) {
        return restaurantService.editEnableStatus(id);
    }

    /**
     * 根据id查询编辑信息
     * @param id
     * @return
     */
    @RequestMapping(value = "editCook")
    @ResponseBody
    public CookBook editCook(Integer id) {
        CookBook cookBook = restaurantService.getCookById(id);
        return cookBook;
    }

    /**
     * 更新菜品信息
     * @param cookBook
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "update")
    @ResponseBody
    public Long update(CookBook cookBook) {
        Long aLong = restaurantService.updateCook(cookBook);
        return aLong;
    }

    /**
     * 根据id下架菜品
     * @param cookId
     * @return
     */
    @RequestMapping(value = "soldOut")
    @ResponseBody
    public Long soldOut(Integer cookId) {
        Long aLong = restaurantService.soldOutCookById(cookId);
        return aLong;
    }

    /**
     * 新增菜品
     * @param cookBook
     * @return
     */
    @RequestMapping(value = "save")
    @ResponseBody
    public Long saveCookBook(CookBook cookBook) {
        Long aLong = restaurantService.saveCook(cookBook);
        return aLong;
    }

    /**
     * 根据名称下架菜品
     * @param cookName
     * @return
     */
    @RequestMapping(value = "batchSoldOut")
    @ResponseBody
    public Long batchSoldOut(String cookName){
        Long aLong = restaurantService.soldOutCookByName(cookName);
        return aLong;
    }

    /**
     * 根据名称上架菜品
     * @param cookName
     * @return
     */
    @RequestMapping(value = "batchPutAway")
    @ResponseBody
    public Long batchPutAway(String cookName){
        return restaurantService.putAwayCookByName(cookName);
    }
}
