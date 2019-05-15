package com.bcsd.dao;

import com.bcsd.entity.HistoryMeet;
import com.bcsd.entity.Remeet;

import java.util.List;


public interface HistoryMeetDao {

   //根据用户id查询历史会议
    List<HistoryMeet> findByUserId(int UserId);

    //查询所有会议
    List<HistoryMeet> findAll();
}
