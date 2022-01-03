package com.ssmtest01.dao;

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
            @Result(column = "uid",property = "user", one = @One( select="com.ssmtest01.dao.finById"
                    ,fetchType=FetchType.LAZY))

    })
     List<Messages> getall();
}
