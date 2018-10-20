package cn.hjc.queryVo;

public class TimeHorizon {

    private String minTime;
    private String maxTime;

    public TimeHorizon(String minTime, String maxTime) {
        this.minTime = minTime;
        this.maxTime = maxTime;
    }

    public String getMinTime() {
        return minTime;
    }

    public void setMinTime(String minTime) {
        this.minTime = minTime;
    }

    public String getMaxTime() {
        return maxTime;
    }

    public void setMaxTime(String maxTime) {
        this.maxTime = maxTime;
    }

    @Override
    public String toString() {
        return "TimeHorizon{" +
                "minTime='" + minTime + '\'' +
                ", maxTime='" + maxTime + '\'' +
                '}';
    }
}
