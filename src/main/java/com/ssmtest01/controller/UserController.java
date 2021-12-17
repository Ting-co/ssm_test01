package com.ssmtest01.controller;


import com.ssmtest01.bean.User;
import com.ssmtest01.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/usermanager")
public class UserController {
    @Autowired
    private UserService userServiceImpl ;


    /**
     *
     * @param user
     * @return
     */

    @RequestMapping("/tologin")
    public  String tologin(User user){
        System.out.println(user);
        User user1 = userServiceImpl.selByemail(user.getEmail());
        System.out.println(user1);
        if(!user.getEmail().isEmpty()) {

            if(user1 !=null) {
                if(!user.getEmail().isEmpty()) {
                    if(user.getPassword().equals(user1.getPassword())){
                        if(user1.getRole()==1)
                            return "manager/index";
                        if(user1.getRole()==0)
                            return "manager/home";
                    }

                }

            }

        }

        return "user/register";
    }

    /**
     *
     * @param user
     * @return
     */

    @RequestMapping("/toregister")
    public  String register(User user) {
        System.out.println(user);
        User user1 = userServiceImpl.selBynameAndEmail(user.getUsername(),user.getEmail());


        if (user.getUsername() == "" && user.getUsername() == null) {
            System.out.println("Username is null");
            return "user/register";
        } else if (user1!=null) {

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
}
