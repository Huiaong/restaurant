package cn.hjc.dao;

import cn.hjc.entity.Cart;
import cn.hjc.entity.CookBook;

import java.util.List;

public interface RestaurantDao {

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

    /**
     * 添加商品到购物车中
     *
     * @param cart
     * @return
     */
    Long addToCart(Cart cart);

    /**
     * 获取购物车内商品的CookId
     *
     * @return
     */
    String getCart(Cart cart);

    /**
     * 根据cookId批量查询CookBook
     *
     * @param cookId
     * @return
     */
    List<CookBook> getCartList(int[] cookId);
}
