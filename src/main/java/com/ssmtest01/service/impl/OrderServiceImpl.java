package com.ssmtest01.service.impl;

import com.ssmtest01.bean.Order;
import com.ssmtest01.dao.OrderDao;
import com.ssmtest01.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public int addOrder(Integer sidnew, Integer uidnew, Integer amountnew, int uid, String getdata, Long dataId) {
       int assccess=0;

        Order order=new Order(dataId,"买家已付款","发货中",getdata,1,amountnew,uid,uidnew,sidnew);
        int add= orderDao.addOrder(order);
        if (add>0){
           assccess= orderDao.insertsAndO(dataId,uid,uidnew);
        }

        return assccess;
    }


}
