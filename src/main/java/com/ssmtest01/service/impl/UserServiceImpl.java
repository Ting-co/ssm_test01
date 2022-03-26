package com.ssmtest01.service.impl;

import com.ssmtest01.bean.User;
import com.ssmtest01.dao.UserDao;
import com.ssmtest01.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User selBynameAndEmail(String username, String email) {
        return userDao.selBynameAndEmail(username, email);
    }

    @Override
    public void insertuser(User user) {
        userDao.insertuser(user);
    }

    @Override
    public User selByemail(String email) {
        return userDao.selByemail(email);
    }

    @Override
    public void  updataUser(User user){
        System.out.println(user);
        userDao.updataUser(user);
    }

    @Override
    public User selByidname(String uuidname){
        return userDao.selByidname(uuidname);
    }

    @Override
    public User selAllUser(int uid) {
        return userDao.selAllUser(uid);
    }

    @Override
    public List<User> selUser(User user){
        return userDao.selUser(user);
    }

    @Override
    public int delUserById(int uid){
        return userDao.delUserById(uid);
    }
}
