package com.ssmtest01.controller;

import com.ssmtest01.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/pagerto")
public class PagerTo {


    /**
     * 跳转到manager的主页index
     *
     * @return
     */
    @RequestMapping("/mindex")
    public String tomindex() {

        return "/manager/mindex";
//        return "/common/uheader";
    }

    @RequestMapping("/mrecompose")
    public String mrecompose() {

        return "/manager/mrecompose";

    }

















    /**
     * 跳转到user的主页uindex
     *
     * @return
     */
    @RequestMapping("/uindex")
    public String touindex() {

        return "/user/uindex";
    }

    /**
     * 跳转到登录页面
     *
     * @return
     */
    @RequestMapping("/login")
    public String tologin() {

        return "/user/login";
    }

    /**
     * 跳转到注册页面
     *
     * @return
     */
    @RequestMapping("/register")
    public String toregister() {

        return "/user/register";
    }
    /**
     * 跳转到测试专用
     *
     * @return
     */
    @RequestMapping("/test")
    public String totest() {

//        return "/manager/test";
//        return "/user/wallet";
        return "/common/uheader";

    }


    /**
     * 跳转到home首页
     *
     * @return
     */
    @RequestMapping("/homeindex")
    public String homeindex() {

        return "/index";
    }

    /**
     * 跳转到留言区
     *
     * @return
     */
    @RequestMapping("/message")
    public String message() {

        return "/user/message";
    }

    /**
     * 从首页跳转到个人中心
     *
     * @return
     */
    @RequestMapping("/toindex")
    public String toindex(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user.getRole()==1)
        return "/manager/mindex";
        return "/user/uindex";
    }


    /**
     * 用户页面跳转
     */

    @RequestMapping("/urecompose")
    public String urecompose(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user.getRole()==0)
        return "/user/urecompose";
        return "/manager/mrecompose";
    }

    @RequestMapping("/commoditys")
    public String commoditys() {

        return "/user/commoditys";
    }




}
