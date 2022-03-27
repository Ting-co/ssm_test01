package com.ssmtest01.service;

import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.Messages;

import java.util.List;

public interface MessagesService {

    List<Messages> getall();

    List<Messages> getallmessages();

     void addM(Messages messages) ;
     int delBysId(int mid);

     List<Messages> selByIdOrName(int mid, String message, int uid);

    List<Messages> userAll(Messages messages);
}
