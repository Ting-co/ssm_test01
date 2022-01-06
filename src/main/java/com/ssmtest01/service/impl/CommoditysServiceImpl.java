package com.ssmtest01.service.impl;

import com.ssmtest01.bean.Commoditys;
import com.ssmtest01.dao.CommoditysDao;
import com.ssmtest01.service.CommoditysService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommoditysServiceImpl implements CommoditysService {

    @Autowired
    private CommoditysDao commoditysDao;


    @Override
    public List<Commoditys> selall(int uid){
        return commoditysDao.selall(uid);
    };

    @Override
    public Commoditys getBysId(int sid){
        return commoditysDao.getBysId(sid);
    }

    @Override
    public void insertcommoditys(Commoditys commoditys){
        commoditysDao.insertcommoditys(commoditys);
    };

    @Override
    public void updatecommoditys(Commoditys commoditys){
        commoditysDao.updatecommoditys(commoditys);
    };

    @Override
    public int deletecommoditys(int sid){
        return commoditysDao.deletecommoditys(sid);
    };
    @Override
    public List<Commoditys>  selByIdOrName(int sid,String name,int uid){
        return commoditysDao.selByIdOrName(sid,name,uid);
    }
    @Override
    public List<Commoditys>  mselByIdOrName(int sid,String name,int uid){
        return commoditysDao.mselByIdOrName(sid,name,uid);
    }

    @Override
    public List<Commoditys> mselall(){
        return commoditysDao.mselall();
    };

    @Override
    public void updateMessage( Commoditys commoditys){
        commoditysDao.updateMessage(commoditys);
    }

    @Override
    public void updPass(String message, int state,int sid){
        commoditysDao.updPass(message,state,sid);
    }

    @Override
    public List<Commoditys> getByName(String commodity) {
        return commoditysDao.getByName(commodity);
    }

    @Override
    public List<Commoditys> getBySort(String sort) {
        return commoditysDao.getBySort(sort);
    }


}

