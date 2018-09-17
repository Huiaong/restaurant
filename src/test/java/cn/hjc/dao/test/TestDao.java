package cn.hjc.dao.test;

import cn.hjc.BaseTest;
import cn.hjc.dao.RestaurantDao;
import cn.hjc.entity.CookBook;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TestDao extends BaseTest {

    @Autowired
    private RestaurantDao restaurantDao;

    @Test
    public void testDao(){
        List<CookBook> cookType = restaurantDao.getCookType();
        System.out.println(cookType);
    }
}
