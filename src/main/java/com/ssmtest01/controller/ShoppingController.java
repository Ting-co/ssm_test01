package com.ssmtest01.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {

    @RequestMapping("/add")
    @ResponseBody
    public HashMap mrecompose(HttpServletRequest request) {
        String sid = request.getParameter("sid");
        String amounts = request.getParameter("amounts");

        HashMap map = new HashMap();
        map.put("sid",sid);
        map.put("amounts",amounts);
        map.put("msg","amounts");
        System.out.println(map);
        return map;


    }

}
