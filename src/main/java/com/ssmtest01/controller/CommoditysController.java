package com.ssmtest01.controller;

import com.google.gson.Gson;
import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.DataJson;
import com.ssmtest01.bean.User;
import com.ssmtest01.service.CommoditysService;
import com.ssmtest01.service.impl.CommoditysServiceImpl;
import com.ssmtest01.util.DataUtils;
import com.ssmtest01.util.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/commoditys")
public class CommoditysController {

    @Autowired
    private CommoditysService commoditysServiceImpl;

    /**
     * 返回所有商品
     *
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/all")
    public String all(HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Commoditys> selall = commoditysServiceImpl.selall(user.getUid());
        request.setAttribute("commoditys", selall);
        return "user/commoditys";

    }

    /**
     * 添加商品
     *
     * @param request
     * @param response
     * @param session
     * @param commoditys
     * @throws IOException
     */
    @RequestMapping("/add")
    public void add(HttpServletRequest request, HttpServletResponse response, HttpSession session, Commoditys commoditys) throws IOException {
        User user = (User) session.getAttribute("user");
        commoditys.setUid(user.getUid());
        commoditys.setSdate(DataUtils.getdata());
        if (commoditys.getAmount() > 0)
            commoditys.setState(1);
        commoditysServiceImpl.insertcommoditys(commoditys);
        response.sendRedirect(request.getContextPath() + "/commoditys/all");
    }

    /**
     * 获取id，返回去编辑商品
     *
     * @param request
     * @param response
     * @param session
     * @param id
     * @return
     * @throws IOException
     */
    @RequestMapping("/getBysId")
    @ResponseBody
    public Commoditys getBysId(HttpServletRequest request, HttpServletResponse response, HttpSession session, int id) throws IOException {
        Commoditys bysId = commoditysServiceImpl.getBysId(id);
        System.out.println(bysId);
        /*System.out.println(bysId);
        Gson gson = new Gson();
        String s = gson.toJson(bysId);
        response.getWriter().write(s);*/
        return bysId;
    }

    /**
     * 商品上传
     *
     * @return {Result}
     */

    @RequestMapping("/image")
    @ResponseBody
    public DataJson image(MultipartFile file, HttpServletRequest request) {
        //调用工具类完成文件上传
        String imagePath = UploadUtils.supload(file);
        DataJson dataJson = new DataJson();
        if (imagePath != null) {
            //创建一个HashMap用来存放图片路径
            HashMap hashMap = new HashMap();
            hashMap.put("src", imagePath);
            dataJson.setCode(0);
            dataJson.setMsg("上传成功");
            dataJson.setData(hashMap);
            System.out.println("成功！！！！！！！");

        } else {
            dataJson.setCode(1);
            dataJson.setMsg("上传失败");
            System.out.println("失败！！！！！！！！");
        }
        return dataJson;
    }

    @RequestMapping("/update")
    public void update(HttpServletRequest request, HttpServletResponse response, Commoditys commoditys) throws IOException {



        if (commoditys.getAmount() == 0)
            commoditys.setState(0);
        if (commoditys.getAmount() > 0)
            commoditys.setState(1);
        commoditysServiceImpl.updatecommoditys(commoditys);
        response.sendRedirect(request.getContextPath() + "/commoditys/all");
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(HttpServletRequest request, HttpServletResponse response, int sid) throws IOException {
        Commoditys bysId = commoditysServiceImpl.getBysId(sid);
        UploadUtils.deleteimage(bysId.getSimage());
        return commoditysServiceImpl.deletecommoditys(sid);

    }

    @RequestMapping("/look/{sid}")
    public String look(HttpServletRequest request, HttpServletResponse response, @PathVariable("sid") int sid) throws IOException {
        Commoditys bysId = commoditysServiceImpl.getBysId(sid);
        request.setAttribute("commodity", bysId);
        return "user/lookCommoditys";

    }

    @RequestMapping("/select")
    public String select(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String commodity = request.getParameter("commodity");
        if (commodity != null && commodity != "") {
            User user = (User) session.getAttribute("user");
            int uid = user.getUid();
            int sid;
            String name;
            if (DataUtils.isInteger(commodity)) {
                sid = Integer.parseInt(commodity);
                name = commodity;
            } else {
                sid = 0;
                name = commodity;
            }
            List<Commoditys> selByIdOrName = commoditysServiceImpl.selByIdOrName(sid, name, uid);
            request.setAttribute("commoditys", selByIdOrName);
            request.setAttribute("myselect", commodity);
            return "user/commoditys";
        } else {
            response.sendRedirect(request.getContextPath() + "/commoditys/all");
        }

        return null;
    }



}
