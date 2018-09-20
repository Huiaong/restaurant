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


    public List<CookBook> getCookByCondition(CookBook cookBook) {
        if (cookBook.getCookName() != null && cookBook.getCookName().length() != 0 ||
                cookBook.getCookFlavor() != null && cookBook.getCookFlavor().length() != 0 ||
                cookBook.getCookType() != null && cookBook.getCookType().length() != 0) {

            List<CookBook> cookByCondition = restaurantDao.getCookByCondition(cookBook);
            return cookByCondition;
        }
        return null;
    }

    public List<CookBook> getCookType() {
        List<CookBook> cook = restaurantDao.getCookType();
        return cook;
    }

    @Override
    public CookBook getCookById(Integer integer) {
        CookBook cook = restaurantDao.getCookById(integer);
        return cook;
    }

    @Override
    public Long updateCook(CookBook cookBook) {
        Long aLong = restaurantDao.updateCook(cookBook);
        return aLong;
    }

    @Override
    public Long deleteCookById(Integer integer) {
        Long aLong = restaurantDao.deleteCookById(integer);
        return aLong;
    }

    public List<CookBook> getCookFlavor() {
        List<CookBook> cook = restaurantDao.getCookFlavor();
        return cook;
    }

}
