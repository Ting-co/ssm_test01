package com.ssmtest01.controller;

import com.ssmtest01.bean.Order;
import com.ssmtest01.bean.User;
import com.ssmtest01.service.OrderService;
import com.ssmtest01.util.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping("/myOrder")
public class OrderController {
    @Autowired
    private OrderService orderService;


    @RequestMapping("/add")
    @ResponseBody
    public HashMap clearshopping(HttpServletRequest request, HttpSession session) {
        /*获取发过来的值*/
        String sid = request.getParameter("sid");
        String uid = request.getParameter("uid");
        String amount = request.getParameter("amount");
        /*商品id*/
        Integer sidnew = new Integer(sid);
        /*卖家id*/
        Integer uidnew = new Integer(uid);
        Integer amountnew = new Integer(amount);

        /*获取当前用户*/
        User user = (User) session.getAttribute("user");

        /*获取当前时间*/
        String getdata = DataUtils.getdata();

        /*获取随机id*/
        Long dataId = DataUtils.getdataId();



        int i = orderService.addOrder(sidnew, uidnew, amountnew, user.getUid(), getdata, dataId);


        HashMap map = new HashMap();
        if (i>0){
            map.put("msg","购买成功");
        }else {
            map.put("msg","购买失败");
        }

        return map;
    }


}
