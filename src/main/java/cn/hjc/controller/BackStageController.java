package cn.hjc.controller;

import cn.hjc.entity.Product;
import cn.hjc.queryVo.ProductConditions;
import cn.hjc.queryVo.ProductDates;
import cn.hjc.service.BackStageService;
import cn.hjc.util.UploadPictureUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "/backStage")
public class BackStageController {

    @Autowired
    private BackStageService backStageService;

    /**
     * 菜品管理后台端入口
     * @param model
     * @return
     */
    @RequestMapping(value = "/backStageManagement")
    public String backStageManagement(Model model){
        List<Product> flavorList = backStageService.getProductFlavor();
        List<Product> typeList = backStageService.getProductType();
        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);
        return "backStage";
    }

    /**
     * 菜品管理主菜单
     * @param model
     * @param productConditions
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(Model model, ProductConditions productConditions) {

        List<Product> flavorList = backStageService.getProductFlavor();
        List<Product> typeList = backStageService.getProductType();

        ProductDates<Product> productDates = backStageService.getProductByCondition(productConditions);

        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);
        model.addAttribute("cookDates", productDates);

        model.addAttribute("cookConditions", productConditions);
        return "backStage";
    }

    /**
     * 获取需上架商品列表
     * @param model
     * @param productConditions
     * @return
     */
    @RequestMapping(value = "/putAwayProduct")
    public String putAwayProduct(Model model, ProductConditions productConditions) {
        ProductDates<Product> putAwayCook = backStageService.getPutAwayProduct(productConditions);

        List<Product> flavorList = backStageService.getProductFlavor();
        List<Product> typeList = backStageService.getProductType();
        model.addAttribute("typeList", typeList);
        model.addAttribute("flavorList", flavorList);
        model.addAttribute("cookDates", putAwayCook);
        model.addAttribute("cookConditions", productConditions);
        return "backStage";
    }

    /**
     * 修改菜品上/下架情况
     * @param id
     * @return
     */
    @RequestMapping(value = "/editProductEnableStatus")
    @ResponseBody
    public Long editProductEnableStatus(Integer id) {
        Long aLong = backStageService.editProductEnableStatus(id);
        return aLong;
    }

    /**
     * 根据id查询编辑信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/getProduct")
    @ResponseBody
    public Product getProduct(Integer id) {
        Product product = backStageService.getProductById(id);
        return product;
    }

    /**
     * 更新菜品信息
     * @param product
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/updateProduct")
    @ResponseBody
    public Long updateProduct(Product product, MultipartFile file, HttpServletRequest request) throws IOException {
        String filePath = UploadPictureUtil.addMutiparFile(file, request);
        product.setProductImage(filePath);
        Long aLong = backStageService.updateProduct(product);
        return aLong;
    }

    /**
     * 根据id下架菜品
     * @param productId
     * @return
     */
    @RequestMapping(value = "/soldOutProduct")
    @ResponseBody
    public Long soldOutProduct(Integer productId) {
        Long aLong = backStageService.soldOutProductById(productId);
        return aLong;
    }

    /**
     * 新增菜品
     * @param product
     * @return
     */
    @RequestMapping(value = "/saveProduct")
    @ResponseBody
    public Long saveProduct(Product product, MultipartFile file, HttpServletRequest request) throws IOException {
        String filePath = UploadPictureUtil.addMutiparFile(file, request);
        product.setProductImage(filePath);
        Long aLong = backStageService.saveProduct(product);
        return aLong;
    }

    /**
     * 根据名称下架菜品
     * @param productName
     * @return
     */
    @RequestMapping(value = "/batchSoldOutProduct")
    @ResponseBody
    public Long batchSoldOutOffProduct(String productName){
        Long aLong = backStageService.soldOutProductByName(productName);
        return aLong;
    }

    /**
     * 根据名称上架菜品
     * @param productName
     * @return
     */
    @RequestMapping(value = "/batchPutAwayProduct")
    @ResponseBody
    public Long batchPutAwayProduct(String productName){
        Long aLong = backStageService.putAwayProductByName(productName);
        return aLong;
    }

}
