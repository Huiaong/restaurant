package cn.hjc.service;


import cn.hjc.entity.CookBook;
import cn.hjc.entity.CookConditions;
import cn.hjc.entity.CookDates;
import cn.hjc.entity.User;

import java.util.List;

public interface RestaurantService {


    CookDates<CookBook> getCookByCondition(CookConditions cookConditions);

    List<CookBook> getCookFlavor();

    List<CookBook> getCookType();

    CookBook  getCookById(Integer integer);

    Long updateCook(CookBook cookBook);

    Long soldOutCookById(Integer integer);

    Long saveCook(CookBook cookBook);

    CookDates<CookBook> getPutAwayCook(CookConditions cookConditions);

    Long editEnableStatus(Integer id);

}
