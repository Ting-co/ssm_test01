package com.ssmtest01.dao;

import com.ssmtest01.bean.Account;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * Keafmd
 *
 * @ClassName: AccountDao
 * @Description: 账户dao接口
 * @author: 牛哄哄的柯南
 * @date: 2021-02-17 21:05
 */
@Repository
public interface AccountDao {
    //查询所有账户
    public List<Account> findAll();

    //保存账户
    public void saveAccount(Account account);
}
