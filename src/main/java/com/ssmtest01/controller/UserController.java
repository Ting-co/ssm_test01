package com.ssmtest01.controller;


import com.ssmtest01.bean.DataJson;
import com.ssmtest01.bean.User;
import com.ssmtest01.service.UserService;

import com.ssmtest01.util.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;
import java.util.UUID;

@Controller
@RequestMapping("/usermanager")
public class UserController {
    @Autowired
    private UserService userServiceImpl;


    /**
     * 登录
     * @param user
     * @param session
     * @return
     */


    @RequestMapping("/tologin")
    public String tologin(User user, HttpSession session) {
        System.out.println(user);
        User user1 = userServiceImpl.selByemail(user.getEmail());
        System.out.println(user1);
        if (!user.getEmail().isEmpty()) {

            if (user1 != null) {
                if (!user.getEmail().isEmpty()) {
                    if (user.getPassword().equals(user1.getPassword())) {
                        session.setAttribute("user", user1);
                        /*if (user1.getRole() == 1)
                            return "manager/mindex";
                        if (user1.getRole() == 0)*/
//                            return "manager/home";


                        return "index";
                    }

                }

            }

        }

        return "user/register";
    }

    /**
     * 注册
     *
     * @param user
     * @return
     */

    @RequestMapping("/toregister")
    public String register(User user) {
        System.out.println(user);
        User user1 = userServiceImpl.selBynameAndEmail(user.getUsername(), user.getEmail());


        if (user.getUsername() == "" && user.getUsername() == null) {
            System.out.println("Username is null");
            return "user/register";
        } else if (user1 != null) {

            if (user.getUsername().equals(user1.getUsername())) {
                System.out.println("Username is t");
                return "user/register";
            }

            if (user1.getEmail() == user.getEmail()) {
                System.out.println("email is t");
                return "user/register";
            }
        }
        Date date = new Date();
        Random random = new Random();
        user.setUuidname("C_" + date.getTime() + random.nextInt(800) + 100);
        userServiceImpl.insertuser(user);
        return "user/login";


    }

    /**
     * 注销
     *
     * @param session
     * @return
     */

    @RequestMapping("/tologout")
    public String logout(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            session.removeAttribute("user");
            System.out.println(user.getUsername() + "logout");
        }
        return "index";


    }


    /**
     * 头像上传
     *
     * @return {Result}
     */

    @RequestMapping("/image")
    @ResponseBody
    public DataJson image(MultipartFile file, HttpServletRequest request) {
        //调用工具类完成文件上传
        String imagePath = UploadUtils.upload(file);
        System.out.println(imagePath);
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


    @RequestMapping("/urecompose")
    public void urecompose(User user, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
        System.out.println(user);
        User sessionUser = (User) session.getAttribute("user");
        System.out.println("sex[" + user.getSex() + "]");
        if (user.getSex() == null)
            user.setSex(sessionUser.getSex());
        if (user.getText() == "")
            user.setText(sessionUser.getText());
        if (user.getHimage() == "")
            user.setHimage(sessionUser.getHimage());

        user.setU_id(sessionUser.getU_id());

        userServiceImpl.updataUser(user);
        System.out.println(sessionUser.getUuidname());
        User user1 = userServiceImpl.selByidname(sessionUser.getUuidname());

        if (sessionUser != null) {
            session.removeAttribute("user");
        }
        session.setAttribute("user", user1);
        response.sendRedirect(request.getContextPath() + "/pagerto/urecompose");


    }


    // session.setAttribute("tt","/file/kk");
    @RequestMapping("/test")
    public String test1(HttpServletRequest request) {
        String username = request.getParameter("username");
        System.out.println(username);
        return "index";

    }

}
