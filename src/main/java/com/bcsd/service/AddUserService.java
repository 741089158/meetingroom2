package com.bcsd.service;

import com.bcsd.entity.Mail;
import com.bcsd.entity.UserInternal;

import java.util.List;


public interface AddUserService {
   void addUser(String userId,String meetId);
   List<UserInternal> findUserByMeetId(String userId);

   void deleteUser(String userId,String meetId);
}
