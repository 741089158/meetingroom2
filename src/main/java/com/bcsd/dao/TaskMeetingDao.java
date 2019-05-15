package com.bcsd.dao;

import com.bcsd.entity.RepeatMeeting;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TaskMeetingDao {
    List<RepeatMeeting> findMeeting(Integer status,@Param("repeatType") String repeatType);

    void update(int id);

    void addRepeatReserve(RepeatMeeting repeatMeeting);

    List<RepeatMeeting> findRepeatMeeting(@Param("meetName") String meetName);
}
