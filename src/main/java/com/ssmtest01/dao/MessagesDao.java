package com.ssmtest01.dao;

import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.Messages;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessagesDao {


    @Select("select * from messages  ORDER BY messages.mdate DESC")
    @Results(id = "messagesMap" ,value = {
            @Result(id = true ,column = "mid",property = "mid"),
            @Result(column = "uid",property = "uid"),
            @Result(column = "message",property = "message"),
            @Result(column = "mdate",property = "mdate"),
            @Result(column = "good",property = "good"),
            @Result(column = "uid",property = "user", one = @One( select="com.ssmtest01.dao.UserDao.finById"
                    ,fetchType=FetchType.LAZY))

    })
     List<Messages> getall();

    @Insert("insert into messages (uid,message,mdate) value (#{uid},#{message},#{mdate})")
    void addM(Messages messages);


    @Select("select * from messages")
    List<Messages> getallmessages();



     int delBysId(int mid);

    @Select("<script>select * from messages where mid=#{mid} or uid=#{uid} or" +
            "<when test='#{message} !=null '>  message like concat ('%',#{message,jdbcType=VARCHAR},'%')</when></script>")
    List<Messages> selByIdOrName(@Param("mid") int mid, @Param("message") String message, @Param("uid") int uid);

    List<Messages> userAll(@Param("messages") Messages messages);


}
