package com.ssmtest01.service;

import com.ssmtest01.bean.Commoditys;

import java.util.List;

public interface CommoditysService {

    List<Commoditys> selall(int uid);



    void insertcommoditys(Commoditys commoditys);

    Commoditys getBysId(int sid);

    void updatecommoditys(Commoditys commoditys);

    int deletecommoditys(int sid);

    List<Commoditys>  selByIdOrName(int sid,String name,int uid);

    List<Commoditys>  mselByIdOrName(int sid,String name,int uid);



    List<Commoditys> mselall();
    List<Commoditys> msgelall();

     void updateMessage( Commoditys commoditys);

    void updPass(String message, int state,int sid);



    List<Commoditys> getByName(String commodity);

    List<Commoditys> getBySort(String sort);

}
