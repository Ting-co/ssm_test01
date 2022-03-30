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
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@RequestMapping("/index")
@Controller
public class IndexController {
    @Autowired
    private CommoditysService commoditysService;

    @RequestMapping("/toindex")
    public String toindex(HttpServletRequest request) {
        String pageNum = request.getParameter("pageNum");
        PageInfo<Object> pageInfo = new PageInfo<>();
        if (pageNum != null && pageNum != "") {
            pageInfo.setPageNum(Integer.parseInt(pageNum));
        } else {
            pageInfo.setPageNum(1);
        }
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        List<Commoditys> selall = commoditysService.mselall();
        PageInfo messagesPageInfo = new PageInfo<>(selall);
        request.setAttribute("commoditys", messagesPageInfo);
        request.setAttribute("select", 0);
        System.out.println("toindex");
        return "index";
    }

    @RequestMapping("/toPage")
    @ResponseBody
    public HashMap toPage(HttpServletRequest request) {

        HashMap map = new HashMap<>();
        map.put("msg", "成功");

        return map;

    }

    @RequestMapping("/select")
    public String select(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String commodity = request.getParameter("commodity");
        String pageNum = request.getParameter("pageNum");
        String select = request.getParameter("select");
        if (commodity != null && commodity != "") {

            PageInfo<Object> pageInfo = new PageInfo<>();
            if (select != null && select != "") {
                pageInfo.setPageNum(Integer.parseInt(pageNum));
            } else {
                pageInfo.setPageNum(1);
            }
            PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
            List<Commoditys> byName = commoditysService.getByName(commodity);
            PageInfo<Commoditys> commoditysPageInfo = new PageInfo<>(byName);

            request.setAttribute("commoditys", commoditysPageInfo);
            request.setAttribute("myselect", commodity);
            request.setAttribute("select", 1);
            System.out.println("select" + commodity + commoditysPageInfo);
            return "index";
        } else {
            response.sendRedirect(request.getContextPath() + "/index/toindex");
        }
        return null;

    }

    @RequestMapping("/selectBySort")
    public String selectBySort(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sort = request.getParameter("sort");
        String pageNum = request.getParameter("pageNum");
        String select = request.getParameter("select");
        if (sort != null && sort != "") {

            PageInfo<Object> pageInfo = new PageInfo<>();
            if (select != null && select != "") {
                pageInfo.setPageNum(Integer.parseInt(pageNum));
            } else {
                pageInfo.setPageNum(1);
            }
            PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
            List<Commoditys> byName = commoditysService.getBySort(sort);
            PageInfo<Commoditys> commoditysPageInfo = new PageInfo<>(byName);
            request.setAttribute("commoditys", commoditysPageInfo);
            request.setAttribute("selectBySort", sort);
            request.setAttribute("select", 3);
            System.out.println("select" + sort + commoditysPageInfo);
            return "index";
        } else {

            response.sendRedirect(request.getContextPath() + "/index/toindex");
        }
        return null;
    }

}
