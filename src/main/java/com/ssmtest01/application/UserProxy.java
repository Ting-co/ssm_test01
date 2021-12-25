package com.ssmtest01.application;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class UserProxy {
    @Before(value = "execution(* com.ssmtest01.service.impl.AccountServiceImpl.findAll())")
    public void before() {
        System.out.println("UserProxy.before()");
    }

}
