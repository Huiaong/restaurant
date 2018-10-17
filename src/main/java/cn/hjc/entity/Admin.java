package cn.hjc.entity;

import java.util.Date;

public class Admin {
    private Integer adminId;
    private String adminUserName;
    private String adminPassWord;
    private int adminEnableStatus;
    private Date createTime;
    private Date endEditTime;

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminUserName() {
        return adminUserName;
    }

    public void setAdminUserName(String adminUserName) {
        this.adminUserName = adminUserName;
    }

    public String getAdminPassWord() {
        return adminPassWord;
    }

    public void setAdminPassWord(String adminPassWord) {
        this.adminPassWord = adminPassWord;
    }

    public int getAdminEnableStatus() {
        return adminEnableStatus;
    }

    public void setAdminEnableStatus(int adminEnableStatus) {
        this.adminEnableStatus = adminEnableStatus;
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
        return "Admin{" +
                "adminId=" + adminId +
                ", adminUserName='" + adminUserName + '\'' +
                ", adminPassWord='" + adminPassWord + '\'' +
                ", adminEnableStatus=" + adminEnableStatus +
                ", createTime=" + createTime +
                ", endEditTime=" + endEditTime +
                '}';
    }
}
