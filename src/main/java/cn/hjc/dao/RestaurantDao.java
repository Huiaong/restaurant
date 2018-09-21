package cn.hjc.dao;


import cn.hjc.entity.CookBook;
import cn.hjc.entity.CookConditions;
import cn.hjc.entity.CookDates;

import java.util.List;

public interface RestaurantDao {

    List<CookBook> getCookByCondition(CookConditions cookConditions);

    List<CookBook> getCookFlavor();

    List<CookBook> getCookType();

    CookBook getCookById(Integer integer);

    Long updateCook(CookBook cookBook);

    Long soldOutCookById(Integer cookBookId);

    Long saveCook(CookBook cookBook);

    Integer getCookTotal(CookConditions cookConditions);
}
