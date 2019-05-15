package com.bcsd.service.Impl;

import com.bcsd.dao.AppointmentMeetDao;
import com.bcsd.dao.HistoryMeetDao;
import com.bcsd.entity.HistoryMeet;
import com.bcsd.service.HistoryMeetService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("historyMeetService")
public class HistorymentServiceimpl implements HistoryMeetService {

    @Autowired
    private HistoryMeetDao historyMeetDao;


    public List<HistoryMeet> findAll(int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);//分页
        return historyMeetDao.findAll();
    }

    public List<HistoryMeet> findByUserId(int UserId) {
        return null;
    }
}
