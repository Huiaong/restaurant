package cn.hjc.dao;

import cn.hjc.entity.Cart;
import cn.hjc.entity.Product;

import java.util.List;

public interface RestaurantDao {

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
     *
     * @param cart
     * @return
     */
    Long addToCart(Cart cart);

    /**
     * 获取购物车内商品的ProductId
     *
     * @return
     */
    String getCart(Cart cart);

    /**
     * 根据cookId批量查询ProductBook
     *
     * @param productIds
     * @return
     */
    List<Product> getCartList(int[] productIds);

    /**
     * 根据提交的订单，将相应的菜品数量减一
     * @param productIds
     * @return
     */
    Long submitOrder(int[] productIds);

}
