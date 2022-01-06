package com.ssmtest01.dao;

import com.ssmtest01.bean.Commoditys;
import org.apache.ibatis.annotations.*;
import org.junit.runners.Parameterized;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommoditysDao {


    @Select("select * from commoditys where uid=#{uid}")
    public List<Commoditys> selall(int uid);

    @Select("select * from commoditys where sid=#{sid}")
    public Commoditys getBysId(int sid);

    @Insert("INSERT INTO commoditys(uid,commodity,synopsis,price,amount,state,sort,simage,sdate) " +
            " values(#{uid},#{commodity},#{synopsis},#{price},#{amount},#{state},#{sort},#{simage},#{sdate})")
    void insertcommoditys(Commoditys commoditys);

    @Update("update  commoditys set commodity=#{commodity},synopsis=#{synopsis}" +
            ",price=#{price},amount=#{amount},state=#{state},sort=#{sort},simage=#{simage},message=#{message} " +
            "where sid=#{sid}" )
    void updatecommoditys(Commoditys commoditys);

    @Delete("delete  from commoditys where sid=#{sid}")
    public int deletecommoditys(int sid);

    @Select("select * from commoditys where  uid=#{uid} having sid=#{sid} or commodity like concat( '%',#{name},'%' )")
    List<Commoditys>  selByIdOrName(@Param("sid") int sid,@Param("name") String name,@Param("uid") int uid);

    @Select("select * from commoditys where uid=#{uid} or sid=#{sid} or commodity like concat( '%',#{name},'%' )")
    List<Commoditys>  mselByIdOrName(@Param("sid") int sid,@Param("name") String name,@Param("uid") int uid);


    @Select("select * from commoditys ")
    public List<Commoditys> mselall();

    @Update("update commoditys set message=#{message},state=#{state}  where sid=#{sid}")
    void updateMessage(Commoditys commoditys);

    @Update("update commoditys set message=#{message},state=#{state}  where sid=#{sid}")
    void updPass(@Param("message") String message, @Param("state") int state,@Param("sid") int sid);

    @Select("select * from commoditys where commodity like concat( '%',#{name},'%' )")
    List<Commoditys> getByName(String commodity);

    @Select("select * from commoditys where sort=#{sort}")
    List<Commoditys> getBySort(String sort);
}
