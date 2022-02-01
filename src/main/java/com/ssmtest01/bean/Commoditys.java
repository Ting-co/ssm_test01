package com.ssmtest01.bean;

public class Commoditys {
    private int sid;
    private int uid;
    private String commodity;
    private String synopsis;
    private double price;
    private int amount;
    private int state;
    private String sort;
    private String simage;
    private String sdate;
    private String message;

    public Commoditys() {
    }

    public Commoditys(int sid, int uid, String commodity, String synopsis, double price, int amount, int state, String sort, String simage, String sdate, String message) {
        this.sid = sid;
        this.uid = uid;
        this.commodity = commodity;
        this.synopsis = synopsis;
        this.price = price;
        this.amount = amount;
        this.state = state;
        this.sort = sort;
        this.simage = simage;
        this.sdate = sdate;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getCommodity() {
        return commodity;
    }

    public void setCommodity(String commodity) {
        this.commodity = commodity;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getSimage() {
        return simage;
    }

    public void setSimage(String simage) {
        this.simage = simage;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    @Override
    public String toString() {
        return "Commoditys{" +
                "sid=" + sid +
                ", uid=" + uid +
                ", commodity='" + commodity + '\'' +
                ", synopsis='" + synopsis + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                ", state=" + state +
                ", sort='" + sort + '\'' +
                ", simage='" + simage + '\'' +
                ", sdate='" + sdate + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
