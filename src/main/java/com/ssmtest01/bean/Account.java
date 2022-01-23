package com.ssmtest01.bean;


import java.io.Serializable;
import java.util.Objects;

/**
 * Keafmd
 *
 * @ClassName: Account
 * @Description: 账户实体类
 * @author: 牛哄哄的柯南
 * @date: 2021-02-17 21:03
 */
public class Account implements Serializable {

    private Integer id;
    private String name;
    private Double money;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", money=" + money +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Account account = (Account) o;
        return Objects.equals(id, account.id) && Objects.equals(name, account.name) && Objects.equals(money, account.money);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, money);
    }
}

