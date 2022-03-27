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


      /*  [User
            {uid=2, uuidname='C_1640526849734', username='gg', password='123', himage='1640853434780.png', phone='18300071361', email='123@qq.com', role=0, address='', money=666666.0, sex='男', text='iiiiiiiiiiiii',
                    order=[Order{oid=1643862838706, sstate='买家已付款', bstate='发货中', odate='2022-02-03 12:33', okdate='null', payment=1, amount=3, uid=2, sid=2,
                                user=User{uid=2, uuidname='C_1640526849734', username='gg', password='123', himage='1640853434780.png', phone='18300071361', email='123@qq.com', role=0, address='', money=666666.0, sex='男', text='iiiiiiiiiiiii', order=null}},
                            Order{oid=1643862839594, sstate='买家已付款', bstate='发货中', odate='2022-02-03 12:33', okdate='null', payment=1, amount=4, uid=2, sid=2,
                                user=User{uid=2, uuidname='C_1640526849734', username='gg', password='123', himage='1640853434780.png', phone='18300071361', email='123@qq.com', role=0, address='', money=666666.0, sex='男', text='iiiiiiiiiiiii', order=null}},
                            Order{oid=1643862840710, sstate='买家已付款', bstate='发货中', odate='2022-02-03 12:34', okdate='null', payment=1, amount=2, uid=2, sid=2,
                                user=User{uid=2, uuidname='C_1640526849734', username='gg', password='123', himage='1640853434780.png', phone='18300071361', email='123@qq.com', role=0, address='', money=666666.0, sex='男', text='iiiiiiiiiiiii', order=null}}]}]
*/
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

        Order order = new Order();
        order.setOid(Long.parseLong(oid));
        order.setSstate("完成");
        int i = orderService.updataOrder(order);
        double price = orderService.selOrder(order);
        HashMap map = new HashMap();
        if (i>0){
            map.put("msg","订单完成成功,金额"+price+"已到账");
        }else {
            map.put("msg","订单完成失败");
        }
        return map;
    }
}
