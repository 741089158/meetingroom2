package com.bcsd.dao;

import com.bcsd.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface AppointmentMeetDao {

    //根据用户Id查询用户预约的会议
    Remeet findRemeet(int userId);


    //根据用户Id查询所有预约的会议
    List<Remeet>  findAll();
    //条件查询
    List<Remeet>  findAll(@Param("meetName")String meetName);


    //增加预约本地会议
    void appointmentMeet(Remeet remeet);

    //增加预约视屏会议
    void appointmentVideoMeet(Remeet remeet);

    //
    void addUser(@Param("user") List<MeetUser> user);


    List<HistoryMeet> findPageHistory(@Param("id") Integer id,@Param("meetName") String meetName);

    List<User> findHistoryUser(Integer id);

    //取消会议
    void removeMeet(Integer meetId);

    //会议结束
      void endMeet(Integer meetId);

    Remeet findOne(Integer id);

    void update(Remeet remeet);

    List<Remeet> findMeeting(@Param("state") Integer state,@Param("repeatType") String repeatType);

    Remeet findByRid(int rid);
}
