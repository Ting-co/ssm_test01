package com.ssmtest01.service;

import com.ssmtest01.bean.Order;

import java.util.List;

public interface OrderService {
    int addOrder(Integer sidnew, Integer uidnew, Integer amountnew, int uid, String getdata, Long dataId);

    int updataOrder(Order order);

    double selOrder(Order order);

    List<Order> selAllOrder(Order order);
}
