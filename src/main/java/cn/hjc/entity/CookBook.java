package cn.hjc.entity;

public class CookBook {

    private int cookId;
    private String cookName;
    private String cookFlavor;      //菜品口味
    private int cookRepertory;     //菜品库存
    private int cookPrice;
    private String cookImage;
    private String cookType;        //菜品菜系
    private String cookDesc;        //菜品介绍
    private int cookEnableStatus;  //菜品上/下架情况

    public int getCookId() {
        return cookId;
    }

    public void setCookId(int cookId) {
        this.cookId = cookId;
    }

    public String getCookName() {
        return cookName;
    }

    public void setCookName(String cookName) {
        this.cookName = cookName;
    }

    public String getCookFlavor() {
        return cookFlavor;
    }

    public void setCookFlavor(String cookFlavor) {
        this.cookFlavor = cookFlavor;
    }

    public int getCookRepertory() {
        return cookRepertory;
    }

    public void setCookRepertory(int cookRepertory) {
        this.cookRepertory = cookRepertory;
    }

    public int getCookPrice() {
        return cookPrice;
    }

    public void setCookPrice(int cookPrice) {
        this.cookPrice = cookPrice;
    }

    public String getCookImage() {
        return cookImage;
    }

    public void setCookImage(String cookImage) {
        this.cookImage = cookImage;
    }

    public String getCookType() {
        return cookType;
    }

    public void setCookType(String cookType) {
        this.cookType = cookType;
    }

    public String getCookDesc() {
        return cookDesc;
    }

    public void setCookDesc(String cookDesc) {
        this.cookDesc = cookDesc;
    }

    public int getCookEnableStatus() {
        return cookEnableStatus;
    }

    public void setCookEnableStatus(int cookEnableStatus) {
        this.cookEnableStatus = cookEnableStatus;
    }

    @Override
    public String toString() {
        return "CookBook{" +
                "cookId=" + cookId +
                ", cookName='" + cookName + '\'' +
                ", cookFlavor='" + cookFlavor + '\'' +
                ", cookRepertory=" + cookRepertory +
                ", cookPrice=" + cookPrice +
                ", cookImage='" + cookImage + '\'' +
                ", cookType='" + cookType + '\'' +
                ", cookDesc='" + cookDesc + '\'' +
                ", cookEnableStatus=" + cookEnableStatus +
                '}';
    }
}
