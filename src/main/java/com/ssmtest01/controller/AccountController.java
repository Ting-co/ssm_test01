package com.ssmtest01.controller;

import com.ssmtest01.bean.Account;
import com.ssmtest01.service.impl.AccountServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountServiceImpl accountService;
    /**
     * 查询所有
     * @param
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model){
        System.out.println("表现层，查询所有账户信息。。。");
        //调用service的方法
        List<Account> list = accountService.findAll();
        System.out.println(list);
        model.addAttribute("list",list);
        return "list";
    }

    /**
     * 保存
     * @param account
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/save")
    public void save(Account account, HttpServletRequest request, HttpServletResponse response) throws IOException {
        accountService.saveAccount(account);
        System.out.println(account);
        response.sendRedirect(request.getContextPath()+"/account/findAll");
        return;
    }
}
