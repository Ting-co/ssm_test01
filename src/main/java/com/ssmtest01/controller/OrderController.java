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
import java.util.List;

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

    @RequestMapping("/buyIndex")
    @ResponseBody
    public HashMap buyIndex(HttpServletRequest request, HttpSession session) {
        /*获取发过来的值*/
//        session.getAttribute('user');

        String sid = request.getParameter("sid");
        String uid = request.getParameter("uid");
        String amount = request.getParameter("amount");
        String payment = request.getParameter("payment");
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




        User user1 = new User();
        user1.setUid(user.getUid());
        user1.setAddress(request.getParameter("address"));
        user1.setPhone(request.getParameter("phone"));
        user1.setMoney(user.getMoney() - Double.valueOf(request.getParameter("price")));
//        if ()
        int i = orderService.indexOrder(sidnew, uidnew, amountnew, user.getUid(), getdata, dataId,new Integer(payment),user1);


        HashMap map = new HashMap();
        if (i>0){
            map.put("msg","购买成功");
        }else {
            map.put("msg","购买失败");
        }


        return map;
    }

    @RequestMapping("/buyerOkOrder")
    @ResponseBody
    public HashMap buyerOkOrder(HttpServletRequest request, HttpSession session) {
        String oid = request.getParameter("oid");
        Order order = new Order();
        /*获取当前时间*/
        String getdata = DataUtils.getdata();
        order.setOkdate(getdata);
        order.setOid(Long.parseLong(oid));
        order.setBstate("完成");
        order.setSstate("用户已确认收货");

        int i = orderService.updataOrder(order);

        HashMap map = new HashMap();
        if (i>0){
            map.put("msg","订单完成成功");
        }else {
            map.put("msg","订单完成失败");
        }
        return map;
    }

    @RequestMapping("/sellerOkOrder")
    @ResponseBody
    public HashMap sellerOkOrder(HttpServletRequest request, HttpSession session) {
        String oid = request.getParameter("oid");
        int i=0;
        Order order = new Order();
        order.setOid(Long.parseLong(oid));

        double price = orderService.selOrder(order);
        if (price>0){
            order.setSstate("完成");
            i = orderService.updataOrder(order);
        }
        HashMap map = new HashMap();
        if (i>0){
            map.put("msg","订单完成成功,金额"+price+"已到账");
        }else {
            map.put("msg","订单完成失败");
        }
        return map;
    }

    /*管理员管理订单*/
    @RequestMapping("/selAllOrder")
    public String selAllOrder(HttpServletRequest request, HttpSession session) {
        List<Order> orders = orderService.selAllOrder(new Order());
        request.setAttribute("mOrder",orders);
        return "manager/mOrder";
    }
}
