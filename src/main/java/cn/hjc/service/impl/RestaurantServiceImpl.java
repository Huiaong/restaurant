package cn.hjc.service.impl;

import cn.hjc.dao.RestaurantDao;
import cn.hjc.entity.Cart;
import cn.hjc.entity.Product;
import cn.hjc.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class RestaurantServiceImpl implements RestaurantService {

    @Autowired
    private RestaurantDao restaurantDao;

    /**
     * 获取所有菜系
     *
     * @return
     */
    @Override
    public List<Product> getProductType() {

        List<Product> type = restaurantDao.getProductType();
        return type;

    }

    /**
     * 获取所有菜品信息
     *
     * @return
     */
    @Override
    public List<Product> getAllProduct() {
        List<Product> allProduct = restaurantDao.getAllProduct();
        return allProduct;
    }

    /**
     * 将商品加入购物车
     *
     * @param cart
     * @return
     */
    @Override
    public Long addToCart(Cart cart) {

        Long aLong = restaurantDao.addToCart(cart);
        return aLong;
    }

    /**
     * 获取购物车内商品的productId
     *
     * @return
     */
    @Override
    public int[] getCart(Cart cart) {

        String product = restaurantDao.getCart(cart);
        int[] productArray = new int[0];
        if (product != null && !"".equals(product)) {
            String[] productList = product.split(",");
            productArray = new int[productList.length];
            for (int i = 0; i < productList.length; i++) {
                productArray[i] = Integer.parseInt(productList[i]);
            }
        }
        return productArray;
    }

    @Override
    public List<Product> getCartList(int[] productIds) {
        List<Product> cartList = null;
        if (productIds.length > 0) {
            cartList = restaurantDao.getCartList(productIds);
        }
        return cartList;
    }

    @Override
    public Long deleteCartListByProductId(Cart cart) {
        int[] cartArray = getCart(cart);
        List<Integer> cartList = new ArrayList<Integer>();
        String[] array = cart.getProductIds().split(",");
        for (int i : cartArray) {
            cartList.add(i);
        }
        for (String b : array) {
            cartList.remove((Integer)Integer.parseInt(b));
        }
        Integer[] Array = cartList.toArray(new Integer[0]);
        cart.setProductIds(Arrays.toString(Array).replace("[", "").replace("]", "").replace(" ", ""));
        Long aLong = addToCart(cart);
        return aLong;
    }

    @Override
    public Long submitOrder(Cart cart) {
        String[] array = cart.getProductIds().split(",");
        int[] productIds = new int[array.length];
        if (array.length > 0) {
            for (int i = 0; i < array.length; i++) {
                productIds[i] = Integer.parseInt(array[i]);
            }
        }
        deleteCartListByProductId(cart);
        Long aLong = restaurantDao.submitOrder(productIds);
        return aLong;
    }

}
