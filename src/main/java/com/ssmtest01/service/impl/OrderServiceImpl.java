package com.ssmtest01.service.impl;

import com.ssmtest01.bean.Order;
import com.ssmtest01.bean.User;
import com.ssmtest01.dao.OrderDao;
import com.ssmtest01.dao.UserDao;
import com.ssmtest01.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;
    @Autowired
    private UserDao userDao;

    @Override
    public int addOrder(Integer sidnew, Integer uidnew, Integer amountnew, int uid, String getdata, Long dataId) {
        int assccess = 0;

        Order order = new Order(dataId, "买家已付款，待发货", "发货中", getdata, 1, amountnew, uid, uidnew, sidnew);
        int add = orderDao.addOrder(order);
        if (add > 0) {
            assccess = orderDao.insertsAndO(dataId, uid, uidnew);
        }

        return assccess;
    }

    @Override
    public int updataOrder(Order order) {
        return orderDao.updataOrder(order);
    }

    @Override
    public double selOrder(Order order) {

        List<Order> order1 = orderDao.selOrder(order);
       if (order1!=null){
        User user = new User();
        user.setUid(order1.get(0).getSid());
        user.setMoney(order1.get(0).getAmount() * order1.get(0).getCommoditys().getPrice());
        userDao.updataByUser(user);
        return order1.get(0).getAmount() * order1.get(0).getCommoditys().getPrice();
       }else { return 0.0;}

    }

    @Override
    public List<Order> selAllOrder(Order order) {
        return orderDao.selOrder(order);
    }


}
