package com.ssmtest01.service.impl;

import com.ssmtest01.bean.Account;
import com.ssmtest01.dao.AccountDao;
import com.ssmtest01.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;

    @Override
    public List<Account> findAll() {
        System.out.println("业务层，查询所有。。。");
        return accountDao.findAll();
    }

    @Override
    public void saveAccount(Account account) {
        System.out.println("业务层，保存账户。。。");
        accountDao.saveAccount(account);
    }
}
