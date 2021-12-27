package com.ssmtest01.dao;

import com.ssmtest01.bean.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;

@Repository
public interface UserDao {

    @Select("select * from user WHERE username= #{username} or email=#{email} ")
    public User selBynameAndEmail(@Param("username") String username, @Param("email") String email);

    @Insert("INSERT INTO user(uuidname,username,password,email)  values(#{uuidname},#{username},#{password},#{email})")
    public void insertuser(User user);

    @Select("select * from user WHERE email= #{email} ")
    public User selByemail(String email);

    @Update("update user set " +
            "username=#{username},sex=#{sex},phone=#{phone}," +
            "email=#{email},address=#{address},text=#{text},himage=#{himage}" +
            "where u_id=#{u_id}")
    void updataUser(User user);

    @Select("select * from user WHERE uuidname=#{uuidname} ")
    public User selByidname(String uuidname);
}
