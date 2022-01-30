package com.ssmtest01.dao;

import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.bean.Shopping;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingDao {

    @Insert("insert into shopping (sid,uid,sum) values(#{sid},#{uid},#{sum})")
    public int insertshop(@Param("sid") int sid, @Param("uid") int uid, @Param("sum") int sum);

    List<Shopping> all(@Param("uid") int uid);
}
