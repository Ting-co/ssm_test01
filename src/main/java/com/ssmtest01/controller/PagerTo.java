package com.ssmtest01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pagerto")
public class PagerTo {


    /**
     * 跳转到manager的主页index
     * @return
     */
    @RequestMapping("/mindex")
    public String tomindex()  {

        return "/manager/index";
    }

    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping("/login")
    public String tologin()  {

        return "/user/login";
    }

    /**
     * 跳转到注册页面
     * @return
     */
    @RequestMapping("/register")
    public String toregister()  {

        return "/user/register";
    }

}
