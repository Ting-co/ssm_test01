package com.ssmtest01.test;

import com.ssmtest01.bean.Shopping;
import com.ssmtest01.dao.ShoppingDao;
import com.ssmtest01.service.ShoppingService;
import com.ssmtest01.util.DataUtils;
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

    @Autowired
    private ShoppingDao shoppingDao;

    @Test
    public void ss(){
//        List<Shopping> commoditys = shoppingService.all(2);
//        System.out.println(commoditys.get(1).getCommoditys().get(0).getCommodity());
//        List<Shopping> shoppings = shoppingService.selUAndSid(2, 7);
//        int upadd = shoppingService.Upadd(2, 7, 4);

       /* shoppingDao.insertsAndO(1,2,3,4);*/
        Long getdata = DataUtils.getdataId();
        System.out.println(getdata);

    }
}
