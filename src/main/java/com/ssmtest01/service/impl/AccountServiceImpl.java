package com.ssmtest01.service.impl;

import com.ssmtest01.bean.Account;
import com.ssmtest01.service.AccountService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Override
    public List<Account> findAll() {
        System.out.println("业务层，查询所有。。。");
        return null;
    }

    @Override
    public void saveAccount(Account account) {
        System.out.println("业务层，保存账户。。。");
    }
}
