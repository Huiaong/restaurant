package cn.hjc.dao;


import cn.hjc.entity.CookBook;
import cn.hjc.entity.CookConditions;
import cn.hjc.entity.CookDates;

import java.util.List;
import java.util.concurrent.locks.Condition;

public interface RestaurantDao {

    List<CookBook> getCookByCondition(CookConditions cookConditions);

    List<CookBook> getCookFlavor();

    List<CookBook> getCookType();

    CookBook getCookById(Integer integer);

    Long updateCook(CookBook cookBook);

    Long soldOutCookById(Integer cookBookId);

    Long saveCook(CookBook cookBook);

    Integer getCookTotal(CookConditions cookConditions);

    Integer getPutAwayTotal();

    List<CookBook> getPutAwayCook(CookConditions cookConditions);

    Long editEnableStatus(Integer id);

    Long soldOutCookByName(String cookName);
}
