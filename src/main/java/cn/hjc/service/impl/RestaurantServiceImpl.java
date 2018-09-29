package cn.hjc.service.impl;


import cn.hjc.dao.RestaurantDao;
import cn.hjc.entity.CookBook;
import cn.hjc.entity.CookConditions;
import cn.hjc.entity.CookDates;
import cn.hjc.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class RestaurantServiceImpl implements RestaurantService {

    @Autowired
    private RestaurantDao restaurantDao;

    /**
     * 根据条件查询菜品信息
     * @param cookConditions
     * @return
     */
    public CookDates<CookBook> getCookByCondition(CookConditions cookConditions) {
        if (cookConditions.getCookName() != null && cookConditions.getCookName().length() != 0 ||
                cookConditions.getCookFlavor() != null && cookConditions.getCookFlavor().length() != 0 ||
                cookConditions.getCookType() != null && cookConditions.getCookType().length() != 0) {

            //计算分页查询从哪条记录开始
            cookConditions.setStart((cookConditions.getPage() - 1) * cookConditions.getRows());

            //查询总记录数
            Integer total = restaurantDao.getCookTotal(cookConditions);

            //查询总页数
            Integer pageNum = total / cookConditions.getRows();
            if (total % cookConditions.getRows() > 0) {
                pageNum++;
            }

            //查询每页的数据列表
            List<CookBook> list = restaurantDao.getCookByCondition(cookConditions);

            //包装分页数据
            CookDates<CookBook> cookDates = new CookDates<CookBook>(pageNum, list);

            return cookDates;
        }
        return null;
    }

    /**
     * 查询菜品口味
     * @return
     */
    public List<CookBook> getCookType() {
        List<CookBook> cook = restaurantDao.getCookType();
        return cook;
    }

    /**
     * 查询菜品菜系
     * @return
     */
    public List<CookBook> getCookFlavor() {
        List<CookBook> cook = restaurantDao.getCookFlavor();
        return cook;
    }

    /**
     * 根据id查询菜品
     * @param integer
     * @return
     */
    @Override
    public CookBook getCookById(Integer integer) {
        CookBook cook = restaurantDao.getCookById(integer);
        return cook;
    }

    /**
     * 更新菜品信息
     * @param cookBook
     * @return
     */
    @Override
    public Long updateCook(CookBook cookBook) {
        Long aLong = restaurantDao.updateCook(cookBook);
        return aLong;
    }

    /**
     * 根据id下架菜品
     * @param integer
     * @return
     */
    @Override
    public Long soldOutCookById(Integer integer) {
        Long aLong = restaurantDao.soldOutCookById(integer);
        return aLong;
    }

    /**
     * 新增菜品
     * @param cookBook
     * @return
     */
    @Override
    public Long saveCook(CookBook cookBook) {
        Long aLong = restaurantDao.saveCook(cookBook);
        return aLong;
    }

    /**
     * 根据条件查询可上架菜品
     * @param cookConditions
     * @return
     */
    @Override
    public CookDates<CookBook> getPutAwayCook(CookConditions cookConditions) {
        //计算分页查询从哪条记录开始
        cookConditions.setStart((cookConditions.getPage() - 1) * cookConditions.getRows());

        Integer total = restaurantDao.getPutAwayTotal();
        //查询总页数
        Integer pageNum = total / cookConditions.getRows();
        if (total % cookConditions.getRows() > 0) {
            pageNum++;
        }

        List<CookBook> putAwayCook = restaurantDao.getPutAwayCook(cookConditions);

        CookDates<CookBook> cookDates = new CookDates<CookBook>(pageNum, putAwayCook);
        return cookDates;
    }

    /**
     * 修改菜品上/下架情况
     * @param id
     * @return
     */
    @Override
    public Long editEnableStatus(Integer id) {
        Long aLong = restaurantDao.editEnableStatus(id);
        return aLong;
    }

    /**
     * 根据菜名下架菜品
     * @param cookName
     * @return
     */
    @Override
    public Long soldOutCookByName(String cookName) {
        return restaurantDao.soldOutCookByName(cookName);
    }

    /**
     * 根据菜名上架菜品
     * @param cookName
     * @return
     */
    @Override
    public Long putAwayCookByName(String cookName) {
        return restaurantDao.putAwayCookByName(cookName);
    }

}
