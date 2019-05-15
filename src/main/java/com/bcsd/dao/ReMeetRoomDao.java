package com.bcsd.dao;

import com.bcsd.entity.Appointment_Meeting;
import com.bcsd.entity.MeetRoom;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ReMeetRoomDao {



    //查询楼层
    List<MeetRoom> findFloor(@Param("areaid") String areaid, @Param("roombuilding")String roombuilding);

    //查询建筑
    List<MeetRoom> findBuilding( String area);

    //查询地区
    List<MeetRoom> findArea();

    //查询会议室
    List<MeetRoom> findRoom(@Param("areaid") String areaid, @Param("roombuilding")String roombuilding,@Param("roomfloor")String roomfloor,@Param("roomId")String roomId);

    //根据id查会议室
    MeetRoom findById(String id);

    //根据时间查找未被使用的会议室id
    List<Appointment_Meeting> findByDate(@Param("startTime") String startTime, @Param("endTime") String endTime);


   // List<MeetRoom> updateMeetRoom(String areaId, String building, String floor, String roomId);
}
