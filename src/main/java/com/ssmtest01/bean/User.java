package com.ssmtest01.bean;

import java.util.List;

/**
 * 用户bean
 */
public class User {
    private int uid;
    private String uuidname;
    private String username;
    private String password;
    private String himage;
    private String phone;
    private String email;
    private int role;
    private String address;
    private double money;
    private String sex;
    private String text;

    private List<Order> order;


    public User() {
    }


  /*  public User(int uid, String uuidname, String username, String password, String himage, String phone, String email, int role, String address, double money, String sex, String text, User user, Order order) {
        this.uid = uid;
        this.uuidname = uuidname;
        this.username = username;
        this.password = password;
        this.himage = himage;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.address = address;
        this.money = money;
        this.sex = sex;
        this.text = text;
        this.user = user;
        this.order = order;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
*/

    public User(int uid, String uuidname, String username, String password, String himage, String phone, String email, int role, String address, double money, String sex, String text) {
        this.uid = uid;
        this.uuidname = uuidname;
        this.username = username;
        this.password = password;
        this.himage = himage;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.address = address;
        this.money = money;
        this.sex = sex;
        this.text = text;

    }


    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUuidname() {
        return uuidname;
    }

    public void setUuidname(String uuidname) {
        this.uuidname = uuidname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHimage() {
        return himage;
    }

    public void setHimage(String himage) {
        this.himage = himage;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uuidname='" + uuidname + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", himage='" + himage + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", role=" + role +
                ", address='" + address + '\'' +
                ", money=" + money +
                ", sex='" + sex + '\'' +
                ", text='" + text + '\'' +
                ", order=" + order +
                '}';
    }
}
