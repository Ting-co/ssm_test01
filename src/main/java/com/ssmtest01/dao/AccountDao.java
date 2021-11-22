package com.ssmtest01.dao;

import com.ssmtest01.bean.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
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
    @Select("select * from account")
    public List<Account> findAll();

    //保存账户
    @Insert("insert into account(name,money) values(#{name},#{money})")
    public void saveAccount(Account account);
}
