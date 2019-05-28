package com.bcsd.service.Impl;

import com.bcsd.dao.TaskMeetingDao;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.RepeatMeeting;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.AddUserService;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.TaskMeetingService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class TaskMeetingServiceImpl implements TaskMeetingService {

    @Autowired
    private TaskMeetingDao taskMeetingDao;

    @Autowired
    private AddUserService addUserService;

    @Autowired
    private AppointmentMeetService appointmentMeetService;

    @Override
    public List<RepeatMeeting> findMeeting(Integer status,String repeatType) {
        return taskMeetingDao.findMeeting(status,repeatType);
    }

    @Override
    public void update(int id) {
        taskMeetingDao.update(id);
    }

    //添加循环会议
    @Override
    public void addRepeatReserve(RepeatMeeting repeatMeeting) throws Exception {
        taskMeetingDao.addRepeatReserve(repeatMeeting);
        //循环类型
        String repeatType = repeatMeeting.getRepeatType();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        //开始时间
        Date createTime = sf.parse(repeatMeeting.getCreateTime());
        //结束时间
        Date endTime = sf.parse(repeatMeeting.getEndTime());

        String[] s = repeatMeeting.getCreateTime().split(" ");
        //每日循环会议
        if (repeatType.equals("everydays")){
            //循环天数
            int days = 0;
            try {
                days = caculateTotalTime(repeatMeeting.getCreateTime(),repeatMeeting.getEndTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            //增加联系人
            List user = getInternal(repeatMeeting.getUserId());
            Date date=null;
            for (int i = 0; i < days; i++) {
                //开会时间
                if (i==0){
                    date=createTime;
                }else {
                    date=getNextDay(date);
                }
                //添加会议数据
                Remeet remeet = new Remeet();
                remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                remeet.setMeetDate(sf.format(date)+" "+s[1]);//设置当前会议时间
                remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                remeet.setMeetLaber("重复会议");
                remeet.setMeetType("循环会议");
                remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                remeet.setMeetRoomName(repeatMeeting.getMeetRoomName());//会议室名
                remeet.setState(1);
                remeet.setRepeatType(repeatMeeting.getRepeatType());
                remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
                remeet.setUserId(repeatMeeting.getUserId());
                remeet.setRid(repeatMeeting.getId());//添加循环会议id
                try {
                    appointmentMeetService.appointmentMeet(remeet, user);//添加会议
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        //工作日循环会议
        if (repeatType.equals("everyworks")){

            //循环天数
            int days = 0;
            try {
                days = caculateTotalTime(repeatMeeting.getCreateTime(),repeatMeeting.getEndTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            //增加联系人
            List user = getInternal(repeatMeeting.getUserId());
            Date date=null;
            for (int i = 0; i < days; i++) {
                //开会时间
                if (i==0){
                    date=createTime;
                }else {
                    date=getNextDay(date);
                }
                String weekOfDate = getWeekOfDate(date);
                String day1 ="周六";
                String day2 ="周日";
                //如果日期为周六或周日  跳过
                if (weekOfDate.equals(day1) || weekOfDate.equals(day2)){
                    continue;
                }else {
                    //添加会议数据
                    Remeet remeet = new Remeet();
                    remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                    remeet.setMeetDate(sf.format(date)+" "+s[1]);//设置当前会议时间
                    remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                    remeet.setMeetLaber("重复会议");
                    remeet.setMeetType("循环会议");
                    remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                    remeet.setMeetRoomName(repeatMeeting.getMeetRoomName());//会议室名
                    remeet.setState(1);
                    remeet.setRepeatType(repeatMeeting.getRepeatType());//设置会议类型
                    remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
                    remeet.setUserId(repeatMeeting.getUserId());
                    remeet.setRid(repeatMeeting.getId());//添加循环会议id
                    try {
                        appointmentMeetService.appointmentMeet(remeet, user);//添加会议
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }

            }
        }

        //每周循环会议
        if(repeatType.equals("everyweeks")){

            //循环天数
            int days = 0;
            try {
                days = caculateTotalTime(repeatMeeting.getCreateTime(),repeatMeeting.getEndTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            //增加联系人
            List user = getInternal(repeatMeeting.getUserId());
            Date date=null;

            String week = repeatMeeting.getWeeks();
            String[] split = week.split(",");
            //获取重复会议  星期数组
            List<String> strings = Arrays.asList(split);
            for (int i = 0; i < days; i++) {
                //开会时间
                if (i==0){
                    date=createTime;
                }else {
                    date=getNextDay(date);
                }

                String weekOfDate = getWeekOfDate(date);

                for (String string : strings) {
                    if (weekOfDate.equals(string)){
                        //添加会议数据
                        Remeet remeet = new Remeet();
                        remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                        remeet.setMeetDate(sf.format(date)+" "+s[1]);//设置当前会议时间
                        remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                        remeet.setMeetLaber("重复会议");
                        remeet.setMeetType("循环会议");
                        remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                        remeet.setMeetRoomName(repeatMeeting.getMeetRoomName());//会议室名
                        remeet.setState(1);
                        remeet.setRepeatType(repeatMeeting.getRepeatType());//设置会议类型
                        remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
                        remeet.setUserId(repeatMeeting.getUserId());
                        remeet.setRid(repeatMeeting.getId());//添加循环会议id
                        try {
                            appointmentMeetService.appointmentMeet(remeet, user);//添加会议
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }

        //每月循环会议
        if(repeatType.equals("everymonths")){

            //循环天数
            int days = 0;
            try {
                days = caculateTotalTime(repeatMeeting.getCreateTime(),repeatMeeting.getEndTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            //增加联系人
            List user = getInternal(repeatMeeting.getUserId());
            Date date=null;


            String[] split = repeatMeeting.getWeeks().split(",");
            //获取重复会议  循环日期数组
            List<String> strings = Arrays.asList(split);
            for (int i = 0; i < days; i++) {
                //开会时间
                if (i==0){
                    date=createTime;
                }else {
                    date=getNextDay(date);
                }
                int num = Integer.parseInt(sf.format(date).split("-")[2]);//多少号  01,11...

                String weekOfDate = getWeekOfDate(date);

                for (String string : strings) {
                    if (Integer.parseInt(string)==num){
                        //添加会议数据
                        Remeet remeet = new Remeet();
                        remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                        remeet.setMeetDate(sf.format(date)+" "+s[1]);//设置当前会议时间
                        remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                        remeet.setMeetLaber("重复会议");
                        remeet.setMeetType("循环会议");
                        remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                        remeet.setMeetRoomName(repeatMeeting.getMeetRoomName());//会议室名
                        remeet.setState(1);
                        remeet.setRepeatType(repeatMeeting.getRepeatType());//设置会议类型
                        remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
                        remeet.setUserId(repeatMeeting.getUserId());
                        remeet.setRid(repeatMeeting.getId());//添加循环会议id
                        try {
                            appointmentMeetService.appointmentMeet(remeet, user);//添加会议
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }

        }
    }

    @Override
    public List<RepeatMeeting> findRepeatMeeting(Integer page, Integer size, String meetName) {
        PageHelper.startPage(page,size);
        return taskMeetingDao.findRepeatMeeting(meetName);
    }


    public static int caculateTotalTime(String startTime,String endTime) throws ParseException{
        SimpleDateFormat formatter =   new SimpleDateFormat( "yyyy-MM-dd" );
        Date date1=null;
        Date date = formatter.parse(startTime);
        long ts = date.getTime();
        date1 =  formatter.parse(endTime);
        long ts1 = date1.getTime();
        long ts2=ts1-ts;
        int totalTime = 0;
        totalTime=(int) (ts2/(24*3600*1000)+1);
        return totalTime;
    }



    //根据会议id查询参会人员
    public List getInternal(String userId){
        //查询联系人
        List<UserInternal> user =new ArrayList<UserInternal>();
        String strip = StringUtils.strip(userId, "[]");
        String[] split = strip.split(",");
        for (String s : split) {
            UserInternal internal = addUserService.findByUserId(Integer.parseInt(s));
            user.add(internal);
        }
        return user;
    }

    //获取当前系统下一天日期
    public static Date getNextDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        date = calendar.getTime();
        return date;
    }

    /**
     * 获取当前日期是星期几<br>
     * @param dt
     * @return 当前日期是星期几
     */
    public static String getWeekOfDate(Date dt) {
        String[] weekDays = {"周日", "周一", "周二", "周三", "周四", "周五", "周六"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);

        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        return weekDays[w];
    }
}
