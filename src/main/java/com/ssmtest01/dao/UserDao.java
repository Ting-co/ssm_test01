package com.ssmtest01.dao;

import com.ssmtest01.bean.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;

@Repository
public interface UserDao {

    @Select("select * from user WHERE username= #{username} or email=#{email} ")
    public User selBynameAndEmail(@Param("username") String username, @Param("email") String email);

    @Insert("INSERT INTO user(u_id,username,password,phone,email)  values(#{u_id},#{username},#{password},#{phone},#{email})")
    public void insertuser(User user);

    @Select("select * from user WHERE email= #{email} ")
    public User selByemail(String email);
}
