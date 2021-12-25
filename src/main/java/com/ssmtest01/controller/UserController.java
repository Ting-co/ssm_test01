package com.ssmtest01.controller;


import com.ssmtest01.bean.User;
import com.ssmtest01.service.UserService;

import com.ssmtest01.util.format;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("usermanager")
public class UserController {
    @Autowired
    private UserService userServiceImpl;


    /**
     * @param user
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
                        session.setAttribute("user",user1);
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

        userServiceImpl.insertuser(user);
        return "user/login";


    }

    /**
     *
     * @param session
     * @return
     */

    @RequestMapping("/tologout")
    public String logout(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user !=null){
            session.removeAttribute("user");
            System.out.println(user.getUsername() + "logout");
        }
        return "index";


    }


    /**
     * 个人信息上传
     * @return {Result}
     */
    @RequestMapping(value = "/headImg", method = {RequestMethod.POST})
    @ResponseBody
    public Object headImg(@RequestParam(value="file",required=false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*if (SecurityUtils.getSubject().isAuthenticated() == false) {
            return "redirect:/backEnd/login";
        }*/
       /* String prefix="";
        String dateStr="";
        String uploadDir="/headImg/";
        //保存上传
        OutputStream out = null;
        InputStream fileInput=null;
        try{
            if(file!=null){
                String originalName = file.getOriginalFilename();
                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
                dateStr = format.format(new Date());
                String filepath = request.getSession().getServletContext().getRealPath("/static") + uploadDir + dateStr + "." + prefix;
                filepath = filepath.replace("\\", "/");
                File files=new File(filepath);
                //打印查看上传路径
                System.out.println(filepath);
                if(!files.getParentFile().exists()){
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
            }
        }catch (Exception e){
        }finally{
            try {
                if(out!=null){
                    out.close();
                }
                if(fileInput!=null){
                    fileInput.close();
                }
            } catch (IOException e) {
            }
        }*/
        Map<String,Object> map=new HashMap<>();
        /*Map<String,Object> map2=new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",map2);
        map2.put("src","../../../static"+uploadDir + dateStr + "." + prefix);*/

        System.out.println("图片已上传");
        return map;
    }

    // session.setAttribute("tt","/file/kk");
    @RequestMapping("/test")
    public String test1(HttpServletRequest request) {
        String username = request.getParameter("username");
        System.out.println(username);
        return "index";


    }

}
