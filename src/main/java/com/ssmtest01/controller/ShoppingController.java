package com.ssmtest01.controller;

import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.Shopping;
import com.ssmtest01.bean.User;
import com.ssmtest01.service.ShoppingService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {

    @Autowired
    private ShoppingService shoppingService;

    @RequestMapping("/add")
    @ResponseBody
    public HashMap shoppingAdd(HttpServletRequest request, HttpSession session) {
        String sid = request.getParameter("sid");
        String amounts = request.getParameter("amounts");
        System.out.println(sid+amounts);

        User user = (User) session.getAttribute("user");

        Integer newsid = new Integer(sid);
        Integer newamounts = new Integer(amounts);

        int insertshop = shoppingService.insertshop(newsid, user.getUid(), newamounts);

        HashMap map = new HashMap();
        if (insertshop>0){
        map.put("msg","成功加入购物车");
        }else {
            map.put("msg","加入购物车失败");
        }

        return map;


    }

    @RequestMapping("/all")
    public String all(HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Shopping> commoditys = shoppingService.all(user.getUid());
        System.out.println(commoditys);
        request.setAttribute("all",commoditys);
        return "user/shopping";
    }

}
