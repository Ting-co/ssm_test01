package com.ssmtest01.service.impl;


import com.github.pagehelper.PageHelper;
import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.Messages;
import com.ssmtest01.bean.PageInfo;
import com.ssmtest01.dao.MessagesDao;
import com.ssmtest01.service.MessagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessagesServiceImpl implements MessagesService {

    @Autowired
    private MessagesDao messagesDao;

    @Override
    public List<Messages> getall(){

        List<Messages> getall = messagesDao.getall();

        return  getall;
    }


    @Override
    public void addM(Messages messages) {
         messagesDao.addM(messages);
    }

    @Override
    public List<Messages> getallmessages() {
        return messagesDao.getallmessages();
    }

    @Override
    public int delBysId(int mid) {
        return messagesDao.delBysId(mid);
    }

    @Override
    public List<Messages> selByIdOrName(int mid, String message, int uid) {
        return messagesDao.selByIdOrName(mid,message,uid);
    }
}
