package com.ssmtest01.dao;

import com.ssmtest01.bean.Order;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDao {

    @Insert("insert into myorder (oid,sstate,bstate,odate,payment,amount) values(#{oid},#{sstate},#{bstate},#{odate},#{payment},#{amount})")
    int addOrder(Order order);

    @Insert("insert into shopping_order(oid,buyerid,sellerid,sid) values(#{oid},#{buyerid},#{sellerid},#{sid})")
    int insertsAndO(@Param("oid") Long oid,@Param("buyerid")int buyerid,@Param("sellerid")int sellerid,@Param("sid")int sid);
}
