package com.ssmtest01.service;

import com.ssmtest01.bean.Commoditys;
import org.springframework.stereotype.Service;

import java.util.List;


public interface ShoppingService {

    int insertshop(int sid,int uid,int sum);

    List<Commoditys> all(int uid);


}
