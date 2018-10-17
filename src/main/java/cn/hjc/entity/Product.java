package cn.hjc.entity;

public class Product {

    private int productId;
    private String productName;
    private String productFlavor;      //菜品口味
    private int productRepertory;     //菜品库存
    private int productPrice;
    private String productImage;
    private String productType;        //菜品菜系
    private String productDesc;        //菜品介绍
    private int productEnableStatus;  //菜品上/下架情况

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductFlavor() {
        return productFlavor;
    }

    public void setProductFlavor(String productFlavor) {
        this.productFlavor = productFlavor;
    }

    public int getProductRepertory() {
        return productRepertory;
    }

    public void setProductRepertory(int productRepertory) {
        this.productRepertory = productRepertory;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public int getProductEnableStatus() {
        return productEnableStatus;
    }

    public void setProductEnableStatus(int productEnableStatus) {
        this.productEnableStatus = productEnableStatus;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productFlavor='" + productFlavor + '\'' +
                ", productRepertory=" + productRepertory +
                ", productPrice=" + productPrice +
                ", productImage='" + productImage + '\'' +
                ", productType='" + productType + '\'' +
                ", productDesc='" + productDesc + '\'' +
                ", productEnableStatus=" + productEnableStatus +
                '}';
    }
}
