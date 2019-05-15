package com.bcsd.dao;

import com.bcsd.entity.Mail;
import com.bcsd.entity.UserInternal;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author TANGXIAN
 */
public interface AddUserDao {
   void addUser(@Param("userId") String  userId,@Param("meetId") String meetId);

   void deleteUser(@Param("userId") String  userId,@Param("meetId") String meetId);

   List<UserInternal> findUserByMeetId(String id);
}
