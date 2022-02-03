package com.ssmtest01.test;

import com.ssmtest01.bean.Messages;
import com.ssmtest01.bean.Order;
import com.ssmtest01.dao.MessagesDao;
import com.ssmtest01.dao.OrderDao;
import com.ssmtest01.dao.ShoppingDao;
import com.ssmtest01.service.OrderService;
import com.ssmtest01.service.ShoppingService;
import com.ssmtest01.util.DataUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})//加载配置文件
public class TestOrder {
    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private MessagesDao messagesDao;

    @Test
    public void ss() {
//        List<Shopping> commoditys = shoppingService.all(2);
//        System.out.println(commoditys.get(1).getCommoditys().get(0).getCommodity());
//        List<Shopping> shoppings = shoppingService.selUAndSid(2, 7);
//        int upadd = shoppingService.Upadd(2, 7, 4);

        /* shoppingDao.insertsAndO(1,2,3,4);*/
        String getdata = DataUtils.getdata();
//        Order order = new Order(123L,"撒旦艰苦","就ask",getdata,getdata,1,4,1,2);
//        int i = orderDao.addOrder(order);
//        System.out.println(i);

    }

    @Test
    public void ss1() {
      Messages s=  new Messages(11,11,"奥斯卡的","sad",212,null);
        messagesDao.addM(s);

    }
    /*@Test
    public void ss2() {
      orderDao.delorder();
      orderDao.delorderAndshopping();
    }*/
}
