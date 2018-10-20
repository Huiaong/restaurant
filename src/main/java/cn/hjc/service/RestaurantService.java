package cn.hjc.service;

import cn.hjc.entity.Cart;
import cn.hjc.entity.Product;

import java.util.List;

public interface RestaurantService {

    /**
     * 获取所有菜系
     *
     * @return
     */
    List<Product> getProductType();

    /**
     * 获取所有菜品信息
     *
     * @return
     */
    List<Product> getAllProduct();

    /**
     * 添加商品到购物车中
     * @param cart
     * @return
     */
    Long addToCart(Cart cart);

    /**
     * 获取购物车内商品的ProductId
     * @return
     */
    int[] getCart(Cart cart);

    /**
     * 根据cookId批量查询ProductBook
     * @param cookId
     * @return
     */
    List<Product> getCartList(int[] cookId);

    /**
     * 根据ProductId删除购物车内的菜品
     * @param cart
     * @return
     */
    Long deleteCartListByProductId(Cart cart);

    /**
     * 提交订单，即将对应Product数量减一
     * @param cart
     * @return
     */
    Long submitOrder(Cart cart);

}
