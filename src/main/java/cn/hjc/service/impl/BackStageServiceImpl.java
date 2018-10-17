package cn.hjc.service.impl;


import cn.hjc.dao.BackStageDao;
import cn.hjc.entity.Product;
import cn.hjc.queryVo.CookConditions;
import cn.hjc.queryVo.CookDates;
import cn.hjc.service.BackStageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class BackStageServiceImpl implements BackStageService {

    @Autowired
    private BackStageDao backStageDao;

    /**
     * 根据条件查询菜品信息
     * @param cookConditions
     * @return
     */
    public CookDates<Product> getProductByCondition(CookConditions cookConditions) {
        if (cookConditions.getProductName() != null && cookConditions.getProductName().length() != 0 ||
                cookConditions.getProductFlavor() != null && cookConditions.getProductFlavor().length() != 0 ||
                cookConditions.getProductType() != null && cookConditions.getProductType().length() != 0) {

            //计算分页查询从哪条记录开始
            cookConditions.setStart((cookConditions.getPage() - 1) * cookConditions.getRows());

            //查询总记录数
            Integer total = backStageDao.getProductTotal(cookConditions);

            //查询总页数
            Integer pageNum = total / cookConditions.getRows();
            if (total % cookConditions.getRows() > 0) {
                pageNum++;
            }

            //查询每页的数据列表
            List<Product> list = backStageDao.getProductByCondition(cookConditions);

            //包装分页数据
            CookDates<Product> cookDates = new CookDates<Product>(pageNum, list);

            return cookDates;
        }
        return null;
    }

    /**
     * 查询菜品口味
     * @return
     */
    public List<Product> getProductType() {
        List<Product> cook = backStageDao.getProductType();
        return cook;
    }

    /**
     * 查询菜品菜系
     * @return
     */
    public List<Product> getProductFlavor() {
        List<Product> product = backStageDao.getProductFlavor();
        return product;
    }

    /**
     * 根据id查询菜品
     * @param integer
     * @return
     */
    @Override
    public Product getProductById(Integer integer) {
        Product product = backStageDao.getProductById(integer);
        return product;
    }

    /**
     * 更新菜品信息
     * @param product
     * @return
     */
    @Override
    public Long updateProduct(Product product) {
        Long aLong = backStageDao.updateProduct(product);
        return aLong;
    }

    /**
     * 根据id下架菜品
     * @param integer
     * @return
     */
    @Override
    public Long soldOutProductById(Integer integer) {
        Long aLong = backStageDao.soldOutProductById(integer);
        return aLong;
    }

    /**
     * 新增菜品
     * @param product
     * @return
     */
    @Override
    public Long saveProduct(Product product) {
        Long aLong = backStageDao.saveProduct(product);
        return aLong;
    }

    /**
     * 根据条件查询可上架菜品
     * @param cookConditions
     * @return
     */
    @Override
    public CookDates<Product> getPutAwayProduct(CookConditions cookConditions) {
        //计算分页查询从哪条记录开始
        cookConditions.setStart((cookConditions.getPage() - 1) * cookConditions.getRows());

        Integer total = backStageDao.getPutAwayTotal();
        //查询总页数
        Integer pageNum = total / cookConditions.getRows();
        if (total % cookConditions.getRows() > 0) {
            pageNum++;
        }

        List<Product> putAwayCook = backStageDao.getPutAwayProduct(cookConditions);

        CookDates<Product> cookDates = new CookDates<Product>(pageNum, putAwayCook);
        return cookDates;
    }

    /**
     * 修改菜品上/下架情况
     * @param id
     * @return
     */
    @Override
    public Long editProductEnableStatus(Integer id) {
        Long aLong = backStageDao.editProductEnableStatus(id);
        return aLong;
    }

    /**
     * 根据菜名下架菜品
     * @param productName
     * @return
     */
    @Override
    public Long soldOutProductByName(String productName) {
        return backStageDao.soldOutProductByName(productName);
    }

    /**
     * 根据菜名上架菜品
     * @param productName
     * @return
     */
    @Override
    public Long putAwayProductByName(String productName) {
        return backStageDao.putAwayProductByName(productName);
    }

}
