package com.ssmtest01.service.impl;

import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.Shopping;
import com.ssmtest01.dao.ShoppingDao;
import com.ssmtest01.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingServiceImpl  implements ShoppingService {

    @Autowired
    private ShoppingDao shoppingDao;

    @Override
    public int insertshop(int sid, int uid, int sum) {
        return shoppingDao.insertshop(sid,uid,sum);
    }

    @Override
    public List<Shopping> all(int uid) {
        return shoppingDao.all(uid);
    }

    @Override
    public List<Shopping> selUAndSid(int uid, int sid) {
        return  shoppingDao.selUAndSid(uid,sid);
    }

    @Override
    public int Upadd(int uid, Integer newsid, int newamounts) {
        return shoppingDao.Upadd(uid,newsid,newamounts);
    }

    @Override
    public int delshopping(Integer newid) {
        return shoppingDao.delshopping(newid);
    }


}
