package cn.hjc.entity;

import java.util.Date;

public class User {
    private Integer userId;
    private String userName;
    private String passWord;
    private String gender;
    private String address;
    private String phone;
    private int enableStatus;
    private Date createTime;
    private Date endEditTime;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getEnableStatus() {
        return enableStatus;
    }

    public void setEnableStatus(int enableStatus) {
        this.enableStatus = enableStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getEndEditTime() {
        return endEditTime;
    }

    public void setEndEditTime(Date endEditTime) {
        this.endEditTime = endEditTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", enableStatus=" + enableStatus +
                ", createTime=" + createTime +
                ", endEditTime=" + endEditTime +
                '}';
    }
}
