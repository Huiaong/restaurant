package cn.hjc.queryVo;

public class CookConditions {

    private String ProductName;
    private String ProductFlavor;
    private String ProductType;

    // 当前页码数
    private Integer page = 1;
    // 数据库从哪一条数据开始查
    private Integer start = 0;
    // 每页显示数据条数
    private final Integer rows = 5;

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String productName) {
        ProductName = productName;
    }

    public String getProductFlavor() {
        return ProductFlavor;
    }

    public void setProductFlavor(String productFlavor) {
        ProductFlavor = productFlavor;
    }

    public String getProductType() {
        return ProductType;
    }

    public void setProductType(String productType) {
        ProductType = productType;
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
