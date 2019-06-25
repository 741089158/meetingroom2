package com.bcsd.service;


import com.bcsd.entity.*;

import java.util.List;
import java.util.Map;


public interface AppointmentMeetService {

    //预约本地会议添加
    void appointmentMeet(Remeet remeet, List<Map<String,String>> user);

    //预约视屏会议
    void appointmentVideoMeet(Remeet remmet, List<UserInternal> user);


    List<Remeet> findAll();

    List<Remeet> findPage(int index, int size, String meetName);

    List<Remeet> findPage(int index, int size);


    List<HistoryMeet> findPageHistory(Integer page, Integer size, String username, String meetName);

    List<MeetUser> findHistoryUser(Integer page, Integer size, Integer id);

    //查询会议
    Remeet findOne(Integer id);

    //修改会议
    void update(Remeet remeet);

    List<Remeet> findMeeting(Integer state, String repeatType);

    Remeet findByRid(int id);

    RepeatMeeting findRepeatMeeting(Integer id);

    void updateState(Integer id);

    List<Remeet> findMeetByUserId(Integer id);

    List<Remeet> findMeetByUsername(Integer page, Integer size,String username,String meetName);

    void insertUserIdAndMeetId(Integer id, Integer id1);

    void repeatMeet(Remeet remeet, List<UserInternal> user);

    List<Remeet> findMeetByUserName(String username);

    List<Remeet> findMeetingByRoomId(String roomId);
}
