package cn.hjc.service.impl;

import cn.hjc.dao.RestaurantDao;
import cn.hjc.entity.Cart;
import cn.hjc.entity.CookBook;
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
    public List<CookBook> getCookType() {

        List<CookBook> type = restaurantDao.getCookType();
        return type;

    }

    /**
     * 获取所有菜品信息
     *
     * @return
     */
    @Override
    public List<CookBook> getAllCookBook() {
        List<CookBook> allCookBook = restaurantDao.getAllCookBook();
        return allCookBook;
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
     * 获取购物车内商品的cookId
     *
     * @return
     */
    @Override
    public int[] getCart(Cart cart) {

        String cook = restaurantDao.getCart(cart);
        int[] cookArray = new int[0];
        if (cook != null && !"".equals(cook)) {
            String[] cookList = cook.split(",");
            cookArray = new int[cookList.length];
            for (int i = 0; i < cookList.length; i++) {
                cookArray[i] = Integer.parseInt(cookList[i]);
            }
        }
        return cookArray;
    }

    @Override
    public List<CookBook> getCartList(int[] cookId) {
        List<CookBook> cartList = null;
        if (cookId.length > 0) {
            cartList = restaurantDao.getCartList(cookId);
        }
        return cartList;
    }

    @Override
    public Long deleteCartListByCookId(Cart cart) {
        int[] cartArray = getCart(cart);
        List<Integer> cartList = new ArrayList<Integer>();
        String[] array = cart.getCookId().split(",");
        for (int i : cartArray) {
            cartList.add(i);
        }
        for (String b : array) {
            cartList.remove((Integer)Integer.parseInt(b));
        }
        Integer[] Array = cartList.toArray(new Integer[0]);
        cart.setCookId(Arrays.toString(Array).replace("[", "").replace("]", "").replace(" ", ""));
        Long aLong = addToCart(cart);
        return aLong;
    }

    @Override
    public Long submitOrder(Cart cart) {
        String[] array = cart.getCookId().split(",");
        int[] cookId = new int[array.length];
        if (array.length > 0) {
            for (int i = 0; i < array.length; i++) {
                cookId[i] = Integer.parseInt(array[i]);
            }
        }
        deleteCartListByCookId(cart);
        return restaurantDao.submitOrder(cookId);
    }

}
