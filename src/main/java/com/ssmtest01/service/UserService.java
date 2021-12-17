package com.ssmtest01.service;

import com.ssmtest01.bean.User;

public interface UserService {
   public User selBynameAndEmail(String username,String email);
   public void insertuser(User user);
   public User selByemail(String email);

}
