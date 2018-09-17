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
                cookBook.getCookFlavour() != null && cookBook.getCookFlavour().length() != 0 ||
                cookBook.getCookType() != null && cookBook.getCookType().length() != 0) {
            return restaurantDao.getCookByCondition(cookBook);
        }
        return null;
    }

    public List<CookBook> getCookType() {
        return restaurantDao.getCookType();
    }

    public List<CookBook> getCookFlavour() {
        return restaurantDao.getCookFlavour();
    }

}
