package com.bcsd.service;

import java.util.List;

import com.bcsd.entity.UserInternal;


public interface AddUserService {
   void addUser(String userId,String meetId);
   List<UserInternal> findUserByMeetId(String userId);

   void deleteUser(String userId,String meetId);

   UserInternal findByUserId(int id);
}
