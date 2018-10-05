package cn.hjc.dao;


import cn.hjc.entity.CookBook;
import cn.hjc.entity.CookConditions;
import cn.hjc.entity.CookDates;

import java.util.List;
import java.util.concurrent.locks.Condition;

public interface BackStageDao {

    /**
     * 按照条件查询cookBook
     * @param cookConditions
     * @return
     */
    List<CookBook> getCookByCondition(CookConditions cookConditions);

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
    CookBook getCookById(Integer integer);

    /**
     * 按照cookBook更新cookBook信息
     * @param cookBook
     * @return
     */
    Long updateCook(CookBook cookBook);

    /**
     * 保存菜品
     * @param cookBook
     * @return
     */
    Long saveCook(CookBook cookBook);

    /**
     * 查询符合条件的cookBook数量
     * @param cookConditions
     * @return
     */
    Integer getCookTotal(CookConditions cookConditions);

    /**
     * 查询可上架的菜品的数量
     * @return
     */
    Integer getPutAwayTotal();

    /**
     * 根据cookId下架菜品
     * @param cookBookId
     * @return
     */
    Long soldOutCookById(Integer cookBookId);

    /**
     * 按条件查询可上架菜品
     * @param cookConditions
     * @return
     */
    List<CookBook> getPutAwayCook(CookConditions cookConditions);

    /**
     * 更改菜品上/下架情况
     * @param id
     * @return
     */
    Long editEnableStatus(Integer id);

    /**
     * 按照名称下架菜品
     * @param cookName
     * @return
     */
    Long soldOutCookByName(String cookName);

    /**
     * 按照名称上架菜品
     * @param cookName
     * @return
     */
    Long putAwayCookByName(String cookName);
}
