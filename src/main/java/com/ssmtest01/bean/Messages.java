package com.ssmtest01.bean;

public class Messages {
    private int mid ;
    private int uid ;
    private String message;
    private String mdate;
    private int good;
    private User user;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMdate() {
        return mdate;
    }

    public void setMdate(String mdate) {
        this.mdate = mdate;
    }

    public int getGood() {
        return good;
    }

    public void setGood(int good) {
        this.good = good;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Messages{" +
                "mid=" + mid +
                ", uid=" + uid +
                ", message='" + message + '\'' +
                ", mdate='" + mdate + '\'' +
                ", good=" + good +
                ", user=" + user +
                '}';
    }
}
