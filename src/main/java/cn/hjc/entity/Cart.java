package cn.hjc.entity;

import java.util.Date;

public class Cart {

    private Integer cartId;
    private Integer customerId;
    private String productIds;
    private Date endEditTime;

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getProductIds() {
        return productIds;
    }

    public void setProductIds(String productIds) {
        this.productIds = productIds;
    }

    public Date getEndEditTime() {
        return endEditTime;
    }

    public void setEndEditTime(Date endEditTime) {
        this.endEditTime = endEditTime;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", customerId=" + customerId +
                ", productIds='" + productIds + '\'' +
                ", endEditTime=" + endEditTime +
                '}';
    }
}
