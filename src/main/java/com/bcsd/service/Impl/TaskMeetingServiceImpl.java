package com.bcsd.service.Impl;

import com.bcsd.dao.TaskMeetingDao;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.RepeatMeeting;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.TaskMeetingService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskMeetingServiceImpl implements TaskMeetingService {

    @Autowired
    private TaskMeetingDao taskMeetingDao;
    @Override
    public List<RepeatMeeting> findMeeting(Integer status,String repeatType) {
        return taskMeetingDao.findMeeting(status,repeatType);
    }

    @Override
    public void update(int id) {
        taskMeetingDao.update(id);
    }

    @Override
    public void addRepeatReserve(RepeatMeeting repeatMeeting) {
        taskMeetingDao.addRepeatReserve(repeatMeeting);
    }

    @Override
    public List<RepeatMeeting> findRepeatMeeting(Integer page, Integer size, String meetName) {
        PageHelper.startPage(page,size);
        return taskMeetingDao.findRepeatMeeting(meetName);
    }
}
