package cn.hjc.entity;

public class CookConditions {

    private String cookName;
    private String cookFlavor;
    private String cookType;

    // 当前页码数
    private Integer page = 1;
    // 数据库从哪一条数据开始查
    private Integer start = 0;
    // 每页显示数据条数
    private final Integer rows = 5;

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

    public String getCookType() {
        return cookType;
    }

    public void setCookType(String cookType) {
        this.cookType = cookType;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }
}
