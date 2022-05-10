package com.ssmtest01.controller;


import com.github.pagehelper.PageHelper;
import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.Messages;
import com.ssmtest01.bean.PageInfo;
import com.ssmtest01.bean.User;
import com.ssmtest01.service.impl.MessagesServiceImpl;
import com.ssmtest01.util.DataUtils;
import com.ssmtest01.util.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/messages")
public class MessagesController {

    @Autowired
    private MessagesServiceImpl messagesService;


    @RequestMapping("/all")
    public String all(HttpServletRequest request) {
        String pageNum = request.getParameter("pageNum");
        PageInfo<Object> pageInfo = new PageInfo<>();
        if (pageNum != null && pageNum != "") {
            pageInfo.setPageNum(Integer.parseInt(pageNum));
        } else {
            pageInfo.setPageNum(1);
        }
        PageHelper.startPage(pageInfo.getPageNum(), 10);

        List<Messages> getall = messagesService.getall();
        PageInfo messagesPageInfo = new PageInfo<>(getall);
        request.setAttribute("messages", messagesPageInfo);
        return "user/message";

    }
    @RequestMapping("/mall")
    public String mall(HttpServletRequest request) {

        List<Messages> getallmessages = messagesService.getallmessages();
        request.setAttribute("messages", getallmessages);
        return "manager/messages";

    }

    @RequestMapping("/add")
    @ResponseBody
    public HashMap add(HttpServletRequest request, HttpServletResponse response, HttpSession session, Messages messages) throws IOException {
        HashMap hashMap = new HashMap();
        User user = (User) session.getAttribute("user");
        if (user == null) {

            hashMap.put("msg", "请登录再评论");
            return hashMap;
        }
        if (messages.getMessage() == "" || messages.getMessage() == null) {

            hashMap.put("msg","留言不能为空");
            return hashMap;
        }



            messages.setUid(user.getUid());
            messages.setMdate(DataUtils.getdata());
            messagesService.addM(messages);
        return null;

    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(HttpServletRequest request, HttpServletResponse response, int mid) throws IOException {
        return messagesService.delBysId(mid);
    }

    @RequestMapping("/select")
    public String select (HttpServletRequest request,HttpServletResponse response) throws IOException {
        String messagesOrId = request.getParameter("messagesOrId");
//        System.out.println(commodity);

        if (messagesOrId != null && messagesOrId != "") {

            int uid ;

            int mid;
            String message="";
            if (DataUtils.isInteger(messagesOrId)) {
                mid = Integer.parseInt(messagesOrId);
                uid = Integer.parseInt(messagesOrId);
                message=null;

            } else {
                mid = 0;
                uid = 0;
                message = messagesOrId;
            }
            List<Messages> messages = messagesService.selByIdOrName(mid, message, uid);
            request.setAttribute("messages", messages);
            request.setAttribute("messagesOrId", messagesOrId);
            return "manager/messages";
        } else {
            response.sendRedirect(request.getContextPath() + "/messages/mall");
        }


        return null;
    }

    @RequestMapping("/userAll")
    public String userAll(HttpServletRequest request, HttpSession session,Messages myMessages) {
        User user = (User) session.getAttribute("user");
        Messages messages = new Messages();
        messages.setUid(user.getUid());
        messages.setMessage(myMessages.getMessage());
        List<Messages> getall = messagesService.userAll(messages);
        request.setAttribute("myMessages", getall);
        request.setAttribute("request",myMessages);
        return "user/myMessage";
    }

}
