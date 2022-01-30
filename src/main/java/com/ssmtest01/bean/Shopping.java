package com.ssmtest01.bean;

import java.util.List;

public class Shopping {
    private int id;
    private int uid;
    private int sid;
    private int sum;
    private List<Commoditys> commoditys;

    public Shopping() {
    }

    public Shopping(int id, int uid, int sid, int sum) {
        this.id = id;
        this.uid = uid;
        this.sid = sid;
        this.sum = sum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public List<Commoditys> getCommoditys() {
        return commoditys;
    }

    public void setCommoditys(List<Commoditys> commoditys) {
        this.commoditys = commoditys;
    }

    @Override
    public String toString() {
        return "Shopping{" +
                "id=" + id +
                ", uid=" + uid +
                ", sid=" + sid +
                ", sum=" + sum +
                ", commoditys=" + commoditys +
                '}';
    }
}
