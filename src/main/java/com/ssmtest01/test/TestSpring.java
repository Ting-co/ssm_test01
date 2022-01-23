package com.ssmtest01.test;

import com.ssmtest01.service.AccountService;
import com.ssmtest01.util.DataUtils;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Random;
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
    public void run2() {
//        System.out.println(randomUUID());
        Date date = new Date();
        String dateStr=""+date.getTime();
//        System.out.println(dateStr);
//        Date date1 = new Date(1640418383241L);
        /*String realPath = request.getSession().getServletContext().getRealPath("/static");
        System.out.println(realPath);*/


        /*int  num = (int)(Math.random()*9999+1000);
        for (int i=0;i<100;i++){

            System.out.println(num);
        }*/
        Random r = new Random();
        for (int i = 0; i < 500; i++) {
            int ran1 = r.nextInt(800);
            System.out.println(ran1+100);
        }

    }
    @Test
    public void run3() {
        String str="123";
        String str2=" 1 2,3";
        String str1=null;
        System.out.println(DataUtils.isInteger(str));
        int i = Integer.parseInt(str);
        System.out.println();
        System.out.println(i);
        int i1 = str.hashCode();
        int i2 = str.charAt(2);
        String trim = str2.trim();
        System.out.println(trim);



    }
    @Test
    public void run4() {
        StringBuffer hello = new StringBuffer("Hello");

        if (false);
        System.out.println(hello);
        System.out.println(hello.length() > 5 && (hello.append("there").equals("False")));



    }
    @Test
    public void run5() {
        System.out.println(4>=5);
        System.out.println(5>=5);
        System.out.println(6>=5);

    }



}