package com.bcsd.service.Impl;

import com.bcsd.dao.AppointmentMeetDao;
import com.bcsd.dao.MailDao;
import com.bcsd.entity.*;
import com.bcsd.service.AppointmentMeetService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service("appointmentMeetService")
public class AppointmentServiceimpl implements AppointmentMeetService {

    @Autowired
    private AppointmentMeetDao appointmentMeetDao;
    @Autowired
    private MailDao mailDao;
    //预定本地会议
    public void appointmentMeet(Remeet remeet,List<UserInternal> user) {
        appointmentMeetDao.appointmentMeet(remeet);
        for (UserInternal u:user){
            appointmentMeetDao.insertUserIdAndMeetId(u.getId(),remeet.getId());
            Mail mail=new Mail(u.getEmail(),remeet.getMeetName(),remeet.getMeetName(),remeet.getMeetDescription(),null,null,1,0,null);
            mailDao.add(mail);
        }

    }
    //预定视屏会议
    public void appointmentVideoMeet(Remeet remeet,List<UserInternal> user) {
        int num = (int)(Math.random()*1000000);
        remeet.setUri(num);
        remeet.setRequireCallId("false");
        remeet.setDefaultLayout("speakerOnly");
        remeet.setCallId(num);
        remeet.setNonMemberAccess("false");
        remeet.setCallProfile("067a6834-b86a-4264-903a-9b4148e1b83b");
        remeet.setCallLegProfile("23d4aca0-db3b-42d7-9cd1-184d4be6e198");
        for (UserInternal u:user){
            System.out.println(u.getEmail());
            Mail mail=new Mail(u.getEmail(),remeet.getMeetName(),remeet.getMeetName(),remeet.getMeetDescription(),null,null,1,0,null);
            mailDao.add(mail);
        }

        appointmentMeetDao.appointmentVideoMeet(remeet);
    }

    public List<Remeet> findAll() {
        return appointmentMeetDao.findAll();
}

    public List<Remeet> findPage(int page, int size, String meetName) {
        PageHelper.startPage(page,size);
        return appointmentMeetDao.findAll(meetName);
    }

    //查询所有会议
    public List<Remeet> findPage(int page,int size) {
        PageHelper.startPage(page,size);
        return appointmentMeetDao.findAll();
    }



    public List<HistoryMeet> findPageHistory(Integer page, Integer size, String username,String meetName) {
        PageHelper.startPage(page,size);
        return appointmentMeetDao.findPageHistory(username,meetName);
    }

    public List<MeetUser> findHistoryUser(Integer page, Integer size, Integer id) {
        PageHelper.startPage(page,size);
        return appointmentMeetDao.findHistoryUser(id);
    }

    @Override
    public Remeet findOne(Integer id) {
        return appointmentMeetDao.findOne(id);
    }

    @Override
    public void update(Remeet remeet) {
        appointmentMeetDao.update(remeet);
    }

    @Override
    public List<Remeet> findMeeting(Integer state, String repeatType) {
        return appointmentMeetDao.findMeeting(state,repeatType);
    }

    @Override
    public Remeet findByRid(int rid) {
        return appointmentMeetDao.findByRid(rid);
    }

    @Override
    public RepeatMeeting findRepeatMeeting(Integer id) {
        return appointmentMeetDao.findRepeatMeeting(id);
    }

    @Override
    public void updateState(Integer id) {
        appointmentMeetDao.updateState(id);
    }

    @Override
    public List<Remeet> findMeetByUserId(Integer id) {
        return appointmentMeetDao.findMeetByUserId(id);
    }

    @Override
    public List<Remeet> findMeetByUsername(Integer page, Integer size,String username, String meetName) {
        PageHelper.startPage(page,size);
        return appointmentMeetDao.findMeetByUsername(username,meetName);
    }

    @Override
    public void insertUserIdAndMeetId(Integer userId, Integer meetId) {
        appointmentMeetDao.insertUserIdAndMeetId(userId,meetId);
    }

    @Override
    public void repeatMeet(Remeet remeet, List<UserInternal> user) {
        appointmentMeetDao.repeatMeet(remeet);
        for (UserInternal u:user){
            appointmentMeetDao.insertUserIdAndMeetId(u.getId(),remeet.getId());
            Mail mail=new Mail(u.getEmail(),remeet.getMeetName(),remeet.getMeetName(),remeet.getMeetDescription(),null,null,1,0,null);
            mailDao.add(mail);
        }
    }

    @Override
    public List<Remeet> findMeetByUserName(String username) {
        return appointmentMeetDao.findMeetByUsername(username,"");
    }

    @Override
    public List<Remeet> findMeetingByRoomId(String roomId) {
        return appointmentMeetDao.findMeetingByRoomId(roomId);
    }
}
