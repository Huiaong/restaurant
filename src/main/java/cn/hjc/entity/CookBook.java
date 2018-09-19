package cn.hjc.entity;

public class CookBook {

    private int cookId;
    private String cookName;
    private String cookFlavor;
    private int cookRepertory;
    private int cookPrice;
    private String cookType;

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

    @Override
    public String toString() {
        return "CookBook{" +
                "cookId=" + cookId +
                ", cookName='" + cookName + '\'' +
                ", cookFlavor='" + cookFlavor + '\'' +
                ", cookRepertory=" + cookRepertory +
                ", cookPrice=" + cookPrice +
                ", cookType='" + cookType + '\'' +
                '}';
    }
}
