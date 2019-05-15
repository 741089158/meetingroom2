package com.bcsd.service;

import com.bcsd.entity.Remeet;
import com.bcsd.entity.RepeatMeeting;
import com.bcsd.entity.UserInternal;

import java.util.List;

public interface TaskMeetingService {
    List<RepeatMeeting> findMeeting(Integer status,String repeatType);

    void update(int id);

    void addRepeatReserve(RepeatMeeting repeatMeeting);

    List<RepeatMeeting> findRepeatMeeting(Integer page, Integer size, String meetName);
}
