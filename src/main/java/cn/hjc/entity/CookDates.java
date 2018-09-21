package cn.hjc.entity;

import java.util.List;

public class CookDates<T> {

    private int pageNum;
    private List<T> rows;

    public CookDates() {
        super();
    }


    public CookDates(int pageNum, List<T> rows) {
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
