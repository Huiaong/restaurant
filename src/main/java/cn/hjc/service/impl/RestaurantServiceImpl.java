package cn.hjc.service.impl;

import cn.hjc.dao.RestaurantDao;
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
}
