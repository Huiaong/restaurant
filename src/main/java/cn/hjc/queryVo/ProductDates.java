package cn.hjc.queryVo;

import java.util.List;

public class ProductDates<T> {

    private int pageNum;    //当前页数
    private List<T> rows;    //存放查询结果

    public ProductDates() {
        super();
    }


    public ProductDates(int pageNum, List<T> rows) {
        super();
        this.pageNum = pageNum;
        this.rows = rows;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

}
