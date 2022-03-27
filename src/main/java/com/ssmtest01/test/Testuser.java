package com.ssmtest01.test;

import com.ssmtest01.bean.Messages;
import com.ssmtest01.bean.Order;
import com.ssmtest01.bean.User;
import com.ssmtest01.dao.MessagesDao;
import com.ssmtest01.dao.OrderDao;
import com.ssmtest01.dao.UserDao;
import com.ssmtest01.service.OrderService;
import com.ssmtest01.util.DataUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})//加载配置文件

public class Testuser {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private MessagesDao messagesDao;

    @Autowired
    private UserDao userDao;

    @Test
    public void ss() {
//        User sss =  userDao.selAllUser(2);
//        System.out.println(sss.getOrder().get(1).getCommoditys().getCommodity());
    }

    @Test
    public void t1() {
        User user = new User();
        user.setUid(14);
//        user.setUsername("gg");
        user.setRole(0);
        int i = userDao.updataByUser(user);
        System.out.println(i);

    }
    @Test
    public void t2() {
        User user = new User();
        user.setUid(1);
        System.out.println(userDao.selLikeUser(user));
        System.out.println(userDao.selUser(user).isEmpty());

    }
    @Test
    public void t3() {

//        User user1 = userDao.selAllUser(2);
//        User user2 = userDao.selSeller();
        Order order = new Order();
        order.setUid(2);
        order.setSstate("买家已付款，待发货");
        User AllOrder = userDao.selSeller(order);
        /*User{uid=2, uuidname='null', username='gg', password='null', himage='null', phone='18300071361', email='123@qq.com', role=0, address='null', money=0.0, sex='null', text='iiiiiiiiiiiii',
        order=[Order{oid=1648375882029, sstate='买家已付款，待发货', bstate='发货中', odate='2022-03-27 06:11', okdate='null', payment=1, amount=1, uid=2, sid=2,
            user=User{uid=2, uuidname='null', username='gg', password='null', himage='null', phone='18300071361', email='123@qq.com', role=0, address='null', money=0.0, sex='null', text='iiiiiiiiiiiii', order=null},
            commoditys=Commoditys{sid=2, uid=2, commodity='123', synopsis='123', price=123.0, amount=1, state=0, sort='null', simage='1640860216779.png', sdate='null', message='null'}}]}*/
        System.out.println(AllOrder);

    }
    @Test
    public void t4() {
        Messages messages = new Messages();
        messages.setUid(2);
        List<Messages> messages1 = messagesDao.userAll(messages);

        System.out.println(messages1);

    }
}
