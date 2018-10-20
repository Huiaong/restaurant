package cn.hjc.queryVo;

import cn.hjc.entity.Customer;

public class OrderConditions {

    private String date;
    private String time;
    private TimeHorizon timeHorizon;
    private Customer customer;

    // 当前页码数
    private Integer page = 1;
    // 数据库从哪一条数据开始查
    private Integer start = 0;
    // 每页显示数据条数
    private final Integer rows = 5;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public TimeHorizon getTimeHorizon() {
        return timeHorizon;
    }

    public void setTimeHorizon(TimeHorizon timeHorizon) {
        this.timeHorizon = timeHorizon;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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

    @Override
    public String toString() {
        return "OrderConditions{" +
                "date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", timeHorizon=" + timeHorizon +
                ", customer=" + customer +
                ", page=" + page +
                ", start=" + start +
                ", rows=" + rows +
                '}';
    }
}
