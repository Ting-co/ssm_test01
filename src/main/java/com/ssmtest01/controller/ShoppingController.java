package com.ssmtest01.controller;

import com.ssmtest01.bean.Shopping;
import com.ssmtest01.bean.User;
import com.ssmtest01.service.ShoppingService;
import com.ssmtest01.util.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

        List<Shopping> shoppings = shoppingService.selUAndSid(user.getUid(), newsid);
        int insertshop = 0;
        int upadd=0;
        if(shoppings.isEmpty()){
            insertshop= shoppingService.insertshop(newsid, user.getUid(), newamounts);
        }else {
            int addamount = shoppings.get(0).getSum() + newamounts;
            upadd = shoppingService.Upadd(user.getUid(), newsid, addamount);
        }

        HashMap map = new HashMap();
        if (insertshop>0||upadd>0 ){
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

    @RequestMapping("/del")
    @ResponseBody
    public HashMap delshopping(HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("id");
        Integer newid = new Integer(id);
        int delshopping = shoppingService.delshopping(newid);

        HashMap map = new HashMap();
        if (delshopping>0){
            map.put("msg","删除购物车成功");
        }else {
            map.put("msg","删除购物车失败");
        }

        return map;
    }




}
