package cn.hjc.entity;

public class CookBook {

    private int cookId;
    private String cookName;
    private String cookFlavor;      //菜品口味
    private int cookRepertory;     //菜品库存
    private int cookPrice;
    private String cookType;        //菜品菜系
    private String cookImgAddr;     //菜品样品图
    private int cookEnableStatus;  //菜品上/下架情况

    @Override
    public String toString() {
        return "CookBook{" +
                "cookId=" + cookId +
                ", cookName='" + cookName + '\'' +
                ", cookFlavor='" + cookFlavor + '\'' +
                ", cookRepertory=" + cookRepertory +
                ", cookPrice=" + cookPrice +
                ", cookType='" + cookType + '\'' +
                ", cookImgAddr='" + cookImgAddr + '\'' +
                ", cookEnableStatus=" + cookEnableStatus +
                '}';
    }

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

    public String getCookType() {
        return cookType;
    }

    public void setCookType(String cookType) {
        this.cookType = cookType;
    }

    public String getCookImgAddr() {
        return cookImgAddr;
    }

    public void setCookImgAddr(String cookImgAddr) {
        this.cookImgAddr = cookImgAddr;
    }

    public int getCookEnableStatus() {
        return cookEnableStatus;
    }

    public void setCookEnableStatus(int cookEnableStatus) {
        this.cookEnableStatus = cookEnableStatus;
    }
}
