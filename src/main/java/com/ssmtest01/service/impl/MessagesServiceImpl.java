package com.ssmtest01.service.impl;


import com.ssmtest01.bean.Messages;
import com.ssmtest01.dao.MessagesDao;
import com.ssmtest01.service.MessagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessagesServiceImpl implements MessagesService {

    @Autowired
    private MessagesDao messagesDao;

    public List<Messages> getall(){
        return messagesDao.getall();
    }

}
