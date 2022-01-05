package com.ssmtest01.controller;

import com.github.pagehelper.PageHelper;
import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.PageInfo;
import com.ssmtest01.service.CommoditysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RequestMapping("/index")
@Controller
public class IndexController {
    @Autowired
    private CommoditysService commoditysService;

    @RequestMapping("/toindex")
    public String toindex(HttpServletRequest request){
        String pageNum = request.getParameter("pageNum");
        PageInfo<Object> pageInfo = new PageInfo<>();
        if (pageNum!=null&&pageNum!=""){

            pageInfo.setPageNum(Integer.parseInt(pageNum));
        }else {
            pageInfo.setPageNum(1);
        }

        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        List<Commoditys> selall = commoditysService.mselall();
        PageInfo messagesPageInfo = new PageInfo<>(selall);
        request.setAttribute("commoditys", messagesPageInfo);
        System.out.println(messagesPageInfo);
        return "index";
    }
    @RequestMapping("/toPage")
    @ResponseBody
    public HashMap toPage(HttpServletRequest request){

        HashMap map = new HashMap<>();
        map.put("msg","成功");

        return map;

    }

}
