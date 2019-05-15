package com.bcsd.service;

import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Result;
import org.springframework.stereotype.Service;


import java.text.ParseException;
import java.util.List;


public interface MeetRoomService {
    List<MeetRoom> findAll(Integer page,Integer size,String roomName);

    void add(MeetRoom meetRoom) throws ParseException;

    MeetRoom findOne(String id);


    void delete(String id);

    void update(MeetRoom meetRoom);

    List<MeetRoom> findRoomName(String areaid, String roombuilding, String roomfloor);

    Object findRoom();
}
