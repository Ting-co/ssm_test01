package com.ssmtest01.service;

import com.ssmtest01.bean.Order;

public interface OrderService {
    int addOrder(Integer sidnew, Integer uidnew, Integer amountnew, int uid, String getdata, Long dataId);

    int updataOrder(Order order);
}
