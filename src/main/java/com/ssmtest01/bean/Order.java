package com.ssmtest01.bean;

public class Order {
    private Long oid;
    private String sstate;
    private String bstate;
    private String odate;
    private String okdate;
    private int payment;
    private int amount;
    private  int uid;
    private  int sid;
    private  int cid;
    private User user;
    private Commoditys commoditys;


    public Order() {
    }



    public Order(Long oid, String sstate, String bstate, String odate, int payment, int amount, int uid, int sid, int cid) {
        this.oid = oid;
        this.sstate = sstate;
        this.bstate = bstate;
        this.odate = odate;
        this.payment = payment;
        this.amount = amount;
        this.uid = uid;
        this.sid = sid;
        this.cid = cid;
    }

    public Order(Long oid, String sstate, String bstate, String odate, String okdate, int payment, int amount, int uid, int sid, int cid) {
        this.oid = oid;
        this.sstate = sstate;
        this.bstate = bstate;
        this.odate = odate;
        this.okdate = okdate;
        this.payment = payment;
        this.amount = amount;
        this.uid = uid;
        this.sid = sid;
        this.cid = cid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Long getOid() {
        return oid;
    }

    public void setOid(Long oid) {
        this.oid = oid;
    }

    public String getSstate() {
        return sstate;
    }

    public void setSstate(String sstate) {
        this.sstate = sstate;
    }

    public String getBstate() {
        return bstate;
    }

    public void setBstate(String bstate) {
        this.bstate = bstate;
    }

    public String getOdate() {
        return odate;
    }

    public void setOdate(String odate) {
        this.odate = odate;
    }

    public String getOkdate() {
        return okdate;
    }

    public void setOkdate(String okdate) {
        this.okdate = okdate;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Commoditys getCommoditys() {
        return commoditys;
    }

    public void setCommoditys(Commoditys commoditys) {
        this.commoditys = commoditys;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid=" + oid +
                ", sstate='" + sstate + '\'' +
                ", bstate='" + bstate + '\'' +
                ", odate='" + odate + '\'' +
                ", okdate='" + okdate + '\'' +
                ", payment=" + payment +
                ", amount=" + amount +
                ", uid=" + uid +
                ", sid=" + sid +
                ", user=" + user +
                ", commoditys=" + commoditys +
                '}';
    }
}
