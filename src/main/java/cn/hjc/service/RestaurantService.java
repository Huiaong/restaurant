package cn.hjc.service;


import cn.hjc.entity.CookBook;
import cn.hjc.entity.CookConditions;
import cn.hjc.entity.CookDates;
import cn.hjc.entity.User;

import java.util.List;

public interface RestaurantService {

    /**
     * 按照条件查询cookBook
     * @param cookConditions
     * @return
     */
    CookDates<CookBook> getCookByCondition(CookConditions cookConditions);

    /**
     * 查询cook口味
     * @return
     */
    List<CookBook> getCookFlavor();

    /**
     * 查询cook菜系
     * @return
     */
    List<CookBook> getCookType();

    /**
     * 按照cookId查询cookBook
     * @param integer
     * @return
     */
    CookBook  getCookById(Integer integer);

    /**
     * 按照cookBook更新cookBook信息
     * @param cookBook
     * @return
     */
    Long updateCook(CookBook cookBook);

    /**
     * 根据id查询下架菜品
     * @param integer
     * @return
     */
    Long soldOutCookById(Integer integer);

    /**
     * 保存菜品
     * @param cookBook
     * @return
     */
    Long saveCook(CookBook cookBook);

    /**
     * 根据条件查询可上架商品
     * @param cookConditions
     * @return
     */
    CookDates<CookBook> getPutAwayCook(CookConditions cookConditions);

    /**
     * 更改菜品上/下架情况
     * @param id
     * @return
     */
    Long editEnableStatus(Integer id);

    /**
     * 根据cookName下架菜品
     * @param cookName
     * @return
     */
    Long soldOutCookByName(String cookName);

    /**
     * 根据cookName上架商品
     * @param cookName
     * @return
     */
    Long putAwayCookByName(String cookName);
}
