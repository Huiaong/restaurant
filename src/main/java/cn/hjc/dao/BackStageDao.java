package cn.hjc.dao;


import cn.hjc.entity.Product;
import cn.hjc.queryVo.CookConditions;

import java.util.List;

public interface BackStageDao {

    /**
     * 按照条件查询cookBook
     * @param cookConditions
     * @return
     */
    List<Product> getProductByCondition(CookConditions cookConditions);

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
     * 保存菜品
     * @param product
     * @return
     */
    Long saveProduct(Product product);

    /**
     * 查询符合条件的cookBook数量
     * @param cookConditions
     * @return
     */
    Integer getProductTotal(CookConditions cookConditions);

    /**
     * 查询可上架的菜品的数量
     * @return
     */
    Integer getPutAwayTotal();

    /**
     * 根据cookId下架菜品
     * @param productId
     * @return
     */
    Long soldOutProductById(Integer productId);

    /**
     * 按条件查询可上架菜品
     * @param cookConditions
     * @return
     */
    List<Product> getPutAwayProduct(CookConditions cookConditions);

    /**
     * 更改菜品上/下架情况
     * @param id
     * @return
     */
    Long editProductEnableStatus(Integer id);

    /**
     * 按照名称下架菜品
     * @param productName
     * @return
     */
    Long soldOutProductByName(String productName);

    /**
     * 按照名称上架菜品
     * @param productName
     * @return
     */
    Long putAwayProductByName(String productName);
}
