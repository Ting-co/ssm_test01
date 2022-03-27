package com.ssmtest01.dao;

import com.ssmtest01.bean.Order;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {

    @Insert("insert into myorder (oid,sstate,bstate,odate,payment,amount,uid,sid,cid) " +
            "values(#{oid},#{sstate},#{bstate},#{odate},#{payment},#{amount},#{uid},#{sid},#{cid})")
    int addOrder(Order order);

    @Insert("insert into shopping_order(oid,buyerid,sellerid) values(#{oid},#{buyerid},#{sellerid})")
    int insertsAndO(@Param("oid") Long oid,@Param("buyerid")int buyerid,@Param("sellerid")int sellerid);


//    List<Order> selNowOrder(int uid);

    @Delete("delete from myorder where uid is null")
    void delorder();

    void delorderAndshopping();

    int updataOrder(@Param("order") Order order);
}
