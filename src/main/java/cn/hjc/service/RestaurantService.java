package cn.hjc.service;


import cn.hjc.entity.CookBook;

import java.util.List;

public interface RestaurantService {


    List<CookBook> getCookByCondition(CookBook cookBook);

    List<CookBook> getCookType();

    List<CookBook> getCookFlavour();
}
