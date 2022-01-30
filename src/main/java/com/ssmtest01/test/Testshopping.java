package com.ssmtest01.test;

import com.ssmtest01.bean.Shopping;
import com.ssmtest01.service.ShoppingService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})//加载配置文件
public class Testshopping {
    @Autowired
    private ShoppingService shoppingService;

    @Test
    public void ss(){
        List<Shopping> commoditys = shoppingService.all(2);
//        System.out.println(commoditys.get(1).getCommoditys().get(0).getCommodity());
  System.out.println(commoditys);
    }
}
