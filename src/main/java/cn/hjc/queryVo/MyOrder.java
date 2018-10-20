package cn.hjc.queryVo;

import cn.hjc.entity.Product;

import java.util.List;

public class MyOrder {

    private List<Product> products;
    private String  createTime;

    public MyOrder(List<Product> products, String createTime) {
        this.products = products;
        this.createTime = createTime;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
