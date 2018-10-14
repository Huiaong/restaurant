package cn.hjc.service.impl;

import cn.hjc.dao.RestaurantDao;
import cn.hjc.entity.Cart;
import cn.hjc.entity.CookBook;
import cn.hjc.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        System.out.println("cook:"+cook);
        int[] cookArray = new int[0];
        if (cook!=null) {
            String[] cookList = cook.split(",");
            cookArray = new int[cookList.length];
            for (int i = 0; i < cookList.length; i++) {
                cookArray[i] = Integer.parseInt(cookList[i]);
                System.out.println(cookArray[i]);
            }
        }
        System.out.println("cookArray:" + cookArray);
        return cookArray;
    }

    @Override
    public List<CookBook> getCartList(int[] cookId) {

        List<CookBook> cartList = restaurantDao.getCartList(cookId);
        return cartList;
    }
}
