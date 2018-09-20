package cn.hjc.dao;


import cn.hjc.entity.CookBook;

import java.util.List;

public interface RestaurantDao {

    List<CookBook> getCookByCondition(CookBook cookBook);

    List<CookBook> getCookFlavor();

    List<CookBook> getCookType();

    CookBook getCookById(Integer integer);

    Long updateCook(CookBook cookBook);

    Long deleteCookById(Integer cookBookId);
}
