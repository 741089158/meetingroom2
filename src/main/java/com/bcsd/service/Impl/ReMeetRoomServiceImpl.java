package com.bcsd.service.Impl;

import com.alibaba.fastjson.JSON;
import com.bcsd.dao.MeetRoomDao;
import com.bcsd.dao.ReMeetRoomDao;
import com.bcsd.entity.Appointment_Meeting;
import com.bcsd.entity.MeetRoom;
import com.bcsd.service.ReMeetRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;


@Service("reMeetRoomService")
public class ReMeetRoomServiceImpl implements ReMeetRoomService {
    @Autowired
    private ReMeetRoomDao reMeetRoomDao;

    public List<MeetRoom> floor(String areaid, String building) {
        return reMeetRoomDao.findFloor(areaid,building);
    }

    public String findFloor(String areaid, String building) {
        List<MeetRoom> list = this.reMeetRoomDao.findFloorWithRooms(areaid, building);
        Map<String, List<MeetRoom>> fMap = new TreeMap<>();
        for (MeetRoom mr : list) {
            if (fMap.get(mr.getRoomFloor()) == null) {
                fMap.put(mr.getRoomFloor(), new ArrayList<>());
            }
            fMap.get(mr.getRoomFloor()).add(mr);
        }
        return JSON.toJSONString(fMap);
    }

    public List<MeetRoom> findArea() {
        return reMeetRoomDao.findArea();
    }

    public List<MeetRoom> findBuilding(String area) {
        return reMeetRoomDao.findBuilding(area);
    }

    public List<MeetRoom> findRoom(String areaid, String building, String floor, String roomId) {
        return reMeetRoomDao.findRoom(areaid, building, floor, roomId);
    }

    public MeetRoom findById(String id) {
        return reMeetRoomDao.findById(id);
    }

    public List<Appointment_Meeting> findByDate(String startTime, String endTime) {
        return reMeetRoomDao.findByDate(startTime, endTime);
    }

    @Override
    public List<MeetRoom> updateMeetRoom(String areaId, String building, String floor, String roomId) {
        return reMeetRoomDao.findRoom(areaId, building, floor, roomId);
    }
}