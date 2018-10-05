package cn.hjc.dao.test;

import cn.hjc.BaseTest;
import cn.hjc.dao.BackStageDao;
import cn.hjc.entity.CookBook;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TestDao extends BaseTest {

    @Autowired
    private BackStageDao backStageDao;

    @Test
    public void testDao(){
        List<CookBook> cookType = backStageDao.getCookType();
        System.out.println(cookType);
    }
}
