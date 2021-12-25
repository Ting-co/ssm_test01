package com.ssmtest01.test;

import com.ssmtest01.service.AccountService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.UUID;

public class TestSpring {
    @Test
    public void run1() {
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        AccountService as = (AccountService) ac.getBean("accountService");
        //调用方法
        as.findAll();

    }


    public static String randomUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    @Test
    public void run2(HttpServletRequest request) {
//        System.out.println(randomUUID());
//        Date date = new Date();
//        String dateStr=""+date.getTime();
//        System.out.println(dateStr);
//        Date date1 = new Date(1640418383241L);
        String realPath = request.getSession().getServletContext().getRealPath("/static");
        System.out.println(realPath);


    }

}