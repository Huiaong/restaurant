package cn.hjc.service;

import cn.hjc.entity.CookBook;

import java.util.List;

public interface RestaurantService {

    /**
     * 获取所有菜系
     *
     * @return
     */
    List<CookBook> getCookType();

    /**
     * 获取所有菜品信息
     *
     * @return
     */
    List<CookBook> getAllCookBook();
}
