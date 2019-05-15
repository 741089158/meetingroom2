package com.bcsd.service.Impl;

import com.bcsd.dao.MeetRoomDao;
import com.bcsd.dao.ReMeetRoomDao;
import com.bcsd.entity.Appointment_Meeting;
import com.bcsd.entity.MeetRoom;
import com.bcsd.service.ReMeetRoomService;
import com.bcsd.util.DateChange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.List;
@Service("reMeetRoomService")
public class ReMeetRoomServiceImpl implements ReMeetRoomService {
    @Autowired
    private MeetRoomDao meetRoomDao;
    @Autowired
    private ReMeetRoomDao reMeetRoomDao;


    public List<MeetRoom> findFloor(String areaid, String building) {
        return reMeetRoomDao.findFloor(areaid,building);
    }

    public List<MeetRoom> findArea() {
        return reMeetRoomDao.findArea();
    }

    public List<MeetRoom> findBuilding(String area) {
        return reMeetRoomDao.findBuilding(area);
    }

    public List<MeetRoom> findRoom(String areaid, String building, String floor,String roomId) {




        return reMeetRoomDao.findRoom(areaid,building,floor,roomId);
    }



    public MeetRoom findById(String id) {
        return reMeetRoomDao.findById(id);
    }


    public List<Appointment_Meeting> findByDate(String startTime, String endTime) {
        return reMeetRoomDao.findByDate(startTime,endTime);
    }

    @Override
    public List<MeetRoom> updateMeetRoom(String areaId, String building, String floor, String roomId) {
        return reMeetRoomDao.findRoom(areaId,building,floor,roomId);
    }
}
