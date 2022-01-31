package com.ssmtest01.service;

import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.Shopping;
import org.springframework.stereotype.Service;

import java.util.List;


public interface ShoppingService {

    int insertshop(int sid,int uid,int sum);

    List<Shopping> all(int uid);


    List<Shopping> selUAndSid(int uid, int sid);

    int Upadd(int uid, Integer newsid, int newamounts);

    int delshopping(Integer newid);
}
