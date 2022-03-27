package com.ssmtest01.service;

import com.ssmtest01.bean.Order;
import com.ssmtest01.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    public User selBynameAndEmail(String username, String email);

    public void insertuser(User user);

    public User selByemail(String email);

    void updataUser(User user);

    public User selByidname(String uuidname);

    public User selAllUser(Order order);

    List<User> selUser(User user);

    int delUserById(Integer uid);
    int updataByUser(User user);

    List<User> selLikeUser(User user);

    User selSeller(Order order);
}
