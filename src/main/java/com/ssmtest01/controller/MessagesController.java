package com.ssmtest01.controller;


import com.ssmtest01.bean.Messages;
import com.ssmtest01.service.impl.MessagesServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/messages")
public class MessagesController {

    @Autowired
    private MessagesServiceImpl messagesService;


    @RequestMapping("/all")
    public String all(HttpServletRequest request){

        List<Messages> getall = messagesService.getall();
        System.out.println(getall);
//        request.setAttribute("messages",getall);
        return "user/message";

    }

}
