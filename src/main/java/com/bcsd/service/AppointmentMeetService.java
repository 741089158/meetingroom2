package com.bcsd.service;


import com.bcsd.entity.HistoryMeet;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.UserInternal;
import com.bcsd.entity.User;

import java.util.List;
import java.util.Map;


public interface AppointmentMeetService {

    //预约本地会议添加
    void appointmentMeet(Remeet remeet, List<UserInternal> user);

    //预约视屏会议
    void appointmentVideoMeet(Remeet remmet, List<UserInternal> user);

    //根据用户Id查询用户预约的会议
    Remeet findRemeet(int userId);

    //取消会议
    void removeMeet(Integer meetId);

    //会议结束
    void endMeet(Integer meetId);

    //根据用户Id查询所有预约的会议
    List<Remeet> findAll();

    List<Remeet> findPage(int index, int size, String meetName);

    List<Remeet> findPage(int index, int size);


    List<HistoryMeet> findPageHistory(Integer page, Integer size, Integer id, String meetName);

    List<User> findHistoryUser(Integer page, Integer size, Integer id);

    //查询会议
    Remeet findOne(Integer id);

    //修改会议
    void update(Remeet remeet);

    List<Remeet> findMeeting(Integer state, String repeatType);

    Remeet findByRid(int id);
}
