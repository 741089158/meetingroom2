package com.bcsd.service;

import com.bcsd.entity.Appointment_Meeting;
import com.bcsd.entity.MeetRoom;

import java.text.ParseException;
import java.util.List;


public interface ReMeetRoomService {

    //查询楼层
    List<MeetRoom> findFloor(String areaid,String building);
    //查询地区
   List<MeetRoom>  findArea();
    //查询大楼
    List<MeetRoom> findBuilding( String area);
    //查询会议室
    List<MeetRoom> findRoom(String areaid,String building,String floor,String roomId);

    //List<MeetRoom> findRooms(String areaid,String building,String floor,String date,String  time, String duration) throws ParseException;

    //根据Roomid查询会议室
    MeetRoom findById(String id);

    List<Appointment_Meeting> findByDate(String startTime,String endTime);

    //修改会议室
    List<MeetRoom> updateMeetRoom(String areaId, String building, String floor, String roomId);
}
