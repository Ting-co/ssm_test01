package com.ssmtest01.test;

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
        User sss =  userDao.selAllUser(2);
        System.out.println(sss.getOrder().get(1).getCommoditys().getCommodity());
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
        User user = new User();
        System.out.println(user.getMoney());


    }
}
