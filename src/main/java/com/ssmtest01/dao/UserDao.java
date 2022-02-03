package com.ssmtest01.dao;

import com.ssmtest01.bean.Order;
import com.ssmtest01.bean.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    @Results(id = "userMap" ,value = {
            @Result(id = true ,column = "uid",property = "uid"),
            @Result(column = "uuidname",property = "uuidname"),
            @Result(column = "username",property = "username"),
            @Result(column = "password",property = "password"),
            @Result(column = "himage",property = "himage"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "email",property = "email"),
            @Result(column = "role",property = "role"),
            @Result(column = "address",property = "address"),
            @Result(column = "money",property = "money"),
            @Result(column = "sex",property = "sex"),
            @Result(column = "text",property = "text")

    })



    @Select("select * from user WHERE username= #{username} or email=#{email} ")
    public User selBynameAndEmail(@Param("username") String username, @Param("email") String email);

    @Insert("INSERT INTO user(uuidname,username,password,email)  values(#{uuidname},#{username},#{password},#{email})")
    public void insertuser(User user);

    @Select("select * from user WHERE email= #{email} ")
    public User selByemail(String email);

    @Update("update user set " +
            "username=#{username},sex=#{sex},phone=#{phone}," +
            "email=#{email},address=#{address},text=#{text},himage=#{himage}" +
            "where uid=#{u_id}")
    void updataUser(User user);



    @Select("select * from user WHERE uuidname=#{uuidname} ")
    public User selByidname(String uuidname);


    @Select("select * from user WHERE uid=#{u_id}")
    @ResultMap(value = "userMap")
    public  User finById(int u_id);


    public User selAllUser(int uid);
}
