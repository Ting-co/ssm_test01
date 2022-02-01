package com.ssmtest01.dao;

import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.Shopping;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingDao {

    @Insert("insert into shopping (sid,uid,sum) values(#{sid},#{uid},#{sum})")
    public int insertshop(@Param("sid") int sid, @Param("uid") int uid, @Param("sum") int sum);

    List<Shopping> all(@Param("uid") int uid);

    @Select("select * from shopping where uid=#{uid} and sid=#{sid}")
    List<Shopping> selUAndSid(@Param("uid") int uid, @Param("sid") int sid);

    @Update("update shopping set sum=#{newamounts}  where uid=#{uid} and sid=#{newsid}")
    int Upadd(@Param("uid") int uid,@Param("newsid") Integer newsid,@Param("newamounts") int newamounts);

    @Delete("delete from shopping where id=#{newid}")
    int delshopping(Integer newid);



}
