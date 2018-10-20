package cn.hjc.service;


import cn.hjc.entity.Product;
import cn.hjc.queryVo.ProductConditions;
import cn.hjc.queryVo.ProductDates;

import java.util.List;

public interface BackStageService {

    /**
     * 按照条件查询cookBook
     * @param productConditions
     * @return
     */
    ProductDates<Product> getProductByCondition(ProductConditions productConditions);

    /**
     * 查询cook口味
     * @return
     */
    List<Product> getProductFlavor();

    /**
     * 查询cook菜系
     * @return
     */
    List<Product> getProductType();

    /**
     * 按照cookId查询cookBook
     * @param integer
     * @return
     */
    Product getProductById(Integer integer);

    /**
     * 按照cookBook更新cookBook信息
     * @param product
     * @return
     */
    Long updateProduct(Product product);

    /**
     * 根据id查询下架菜品
     * @param id
     * @return
     */
    Long soldOutProductById(Integer id);

    /**
     * 保存菜品
     * @param product
     * @return
     */
    Long saveProduct(Product product);

    /**
     * 根据条件查询可上架商品
     * @param productConditions
     * @return
     */
    ProductDates<Product> getPutAwayProduct(ProductConditions productConditions);

    /**
     * 更改菜品上/下架情况
     * @param id
     * @return
     */
    Long editProductEnableStatus(Integer id);

    /**
     * 根据cookName下架菜品
     * @param productName
     * @return
     */
    Long soldOutProductByName(String productName);

    /**
     * 根据cookName上架商品
     * @param productName
     * @return
     */
    Long putAwayProductByName(String productName);
}
