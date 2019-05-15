package com.bcsd.controller;


import com.bcsd.entity.Remeet;
import com.bcsd.entity.RepeatMeeting;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.AddUserService;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.TaskMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Component
public class TaskMeetingController {


    @Autowired
    private AppointmentMeetService appointmentMeetService;

    @Autowired
    private TaskMeetingService taskMeetingService;

    @Autowired
    private AddUserService addUserService;

    /**
     * 日重复会议
     */
    @Scheduled(cron = "0 0 0 * * ?") // 每天凌晨执行
    //@Scheduled(cron="0/10 * *  * * ? ")   //每10秒执行一次
    public void dayRepeat() throws ParseException {
        //查询状态为 1 且重复类型为 "每日"  的会议
        Integer state = 1;
        String repeatType = "everydays";
        //List<Remeet> list = appointmentMeetService.findMeeting(state ,repeatType);
        //获取重复会议开始时间及结束时间  获取开会时刻
        List<RepeatMeeting> list = taskMeetingService.findMeeting(state, repeatType);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        //获取当前时间
        Date date = new Date();
        String s = sf.format(date);//2019-05-09
        //获取当月工作日
        String[] split = s.split("-");
        int year = Integer.parseInt(split[0]);
        int month = Integer.parseInt(split[1]);
        List<Date> workDates = getWorkDates(year, month);
        List workDay = new ArrayList();//当前工作日集合
        for (Date workDate : workDates) {
            //转换时间格式
            String format = sf.format(workDate);
            //添加集合中
            workDay.add(format);
        }
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        //处理所有循环会议
        for (RepeatMeeting repeatMeeting : list) {

            //解析开始时间
            Date createTime = format.parse(repeatMeeting.getCreateTime());
            //结束时间
            Date endTime = format.parse(repeatMeeting.getEndTime());
            //当前时间大于开始时间   &&   当前时间 小于结束时间   && 当前时间为工作日
            if (date.compareTo(createTime) > 0 && date.compareTo(endTime) < 0 && workDay.contains(s)) {
                //将当前次会议添加到预定会议中
                //增加联系人
                List<UserInternal> user = addUserService.findUserByMeetId(String.valueOf(repeatMeeting.getId()));
                //添加会议数据
                Remeet remeet = new Remeet();
                remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                remeet.setMeetDate(sf.format(createTime));//设置当前会议时间
                remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                remeet.setMeetLaber("重复会议");
                remeet.setMeetType("循环会议");
                remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                remeet.setMeetRoomName(repeatMeeting.getRoomName());//会议室名
                remeet.setState(1);
                remeet.setRepeatType(repeatMeeting.getRepeatType());
                remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
                remeet.setUserId(repeatMeeting.getUserId());
                remeet.setRid(repeatMeeting.getId());//添加循环会议id
                //添加循环会议前,先根据循环会议id查询普通会议中是否已存在
                Remeet meeting = appointmentMeetService.findByRid(repeatMeeting.getId());
                if (meeting == null) {//会议不存在
                    //如果当前时间在结束时间之前,  发送邮件,添加到我的预定会议中
                    appointmentMeetService.appointmentMeet(remeet, user);//添加会议
                    System.out.println("日循环会议添加成功");
                }
            } else if (date.compareTo(createTime) < 0) {
                //跳过
                continue;
            } else {
                // 如果当前时间超过结束时间,修改会议状态(逻辑删除)
                //修改循环会议的状态为0
                taskMeetingService.update(repeatMeeting.getId());
            }
        }
    }

    /**
     * 周重复会议
     */
    //@Scheduled(cron = "0/20 * * * * MON ") // 每周一凌晨执行
    @Scheduled(cron = "0 0 0 * * ?") // 每天凌晨执行
    //@Scheduled(cron="0/30 * *  * * ? ")   //每30秒执行一次
    public void weekRepeat() throws ParseException {
        //查询状态为 1 且重复类型为 "每日"  的会议
        Integer status = 1;
        String repeatType = "everyweeks";
        List<RepeatMeeting> list = taskMeetingService.findMeeting(status, repeatType);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        //获取当前时间
        Date date = new Date();
        //处理所有循环会议
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for (RepeatMeeting repeatMeeting : list) {
            //解析开始时间
            Date createTime = format.parse(repeatMeeting.getCreateTime());
            //结束时间
            Date endTime = sf.parse(repeatMeeting.getEndTime());
            String week = repeatMeeting.getWeeks();
            String[] split = week.split(",");
            //获取重复会议  星期数组
            List<String> strings = Arrays.asList(split);
            //获取当前日期 星期几
            String weekOfDate = getWeekOfDate(date);

            //当前时间大于开始时间   &&   当前时间 小于结束时间   && 当前时间为工作日
            if (date.compareTo(createTime) > 0 && date.compareTo(endTime) < 0&&strings.contains(weekOfDate)) {
                //将当前次会议添加到预定会议中
                //增加联系人
                List<UserInternal> user = addUserService.findUserByMeetId(String.valueOf(repeatMeeting.getId()));
                //添加会议数据
                Remeet remeet = new Remeet();
                remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                remeet.setMeetDate(format.format(createTime));//设置当前会议时间
                remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                remeet.setMeetLaber("重复会议");
                remeet.setMeetType("循环会议");
                remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                remeet.setMeetRoomName(repeatMeeting.getRoomName());//会议室名
                remeet.setState(1);
                remeet.setRepeatType(repeatMeeting.getRepeatType());
                remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
                remeet.setUserId(repeatMeeting.getUserId());
                remeet.setRid(repeatMeeting.getId());//添加循环会议id
                Remeet meeting = appointmentMeetService.findByRid(repeatMeeting.getId());
                if (meeting == null) {//会议不存在
                    //如果当前时间在结束时间之前,  发送邮件,添加到我的预定会议中
                    appointmentMeetService.appointmentMeet(remeet, user);//添加会议
                    System.out.println("周循环会议添加成功");
                }
            } else if (date.compareTo(createTime) < 0) {
                //跳过
                continue;
            }
            // 如果当前时间超过结束时间,修改会议状态(逻辑删除)
            //修改循环会议的状态为0
            if (date.compareTo(endTime)>0){
                taskMeetingService.update(repeatMeeting.getId());
            }
        }
    }


    /**
     * 月重复会议
     */
    @Scheduled(cron = "0 0 0 * * ?")   // 每天凌晨执行
    //@Scheduled(cron="0/30 * *  * * ? ")   //每30秒执行一次
    public void monthRepeat() throws ParseException {
        Integer status = 1;
        String repeatType = "everymouths";
        List<RepeatMeeting> list = taskMeetingService.findMeeting(status, repeatType);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        //获取当前时间
        Date date = new Date();
        //处理所有循环会议
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for (RepeatMeeting repeatMeeting : list) {
            //解析开始时间
            Date createTime = format.parse(repeatMeeting.getCreateTime());
            //结束时间
            Date endTime = sf.parse(repeatMeeting.getEndTime());
            //获取预定日
            int repeatDay = Integer.parseInt(repeatMeeting.getWeeks());
            //获取当月天数
            int dayNum = getDayOfMonth();
            //获取今天多少号
            int today = Calendar.getInstance().getTime().getDate();

            //当前时间大于开始时间   &&   当前时间 小于结束时间
            //当月要包含预定日  -->预定日<=当月天数       当前日期<=预定日
            if (date.compareTo(createTime) > 0 && date.compareTo(endTime) < 0 && repeatDay<=dayNum && today<= repeatDay) {
                //将当前次会议添加到预定会议中
                //增加联系人
                List<UserInternal> user = addUserService.findUserByMeetId(String.valueOf(repeatMeeting.getId()));
                //添加会议数据
                Remeet remeet = new Remeet();
                remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                remeet.setMeetDate(format.format(createTime));//设置当前会议时间
                remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                remeet.setMeetLaber("重复会议");
                remeet.setMeetType("循环会议");
                remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                remeet.setMeetRoomName(repeatMeeting.getRoomName());//会议室名
                remeet.setState(1);
                remeet.setRepeatType(repeatMeeting.getRepeatType());
                remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
                remeet.setUserId(repeatMeeting.getUserId());
                remeet.setRid(repeatMeeting.getId());//添加循环会议id
                Remeet meeting = appointmentMeetService.findByRid(repeatMeeting.getId());
                if (meeting == null) {//会议不存在
                    //如果当前时间在结束时间之前,  发送邮件,添加到我的预定会议中
                    appointmentMeetService.appointmentMeet(remeet, user);//添加会议
                    System.out.println("月循环会议添加成功");
                }
            } else if (date.compareTo(createTime) < 0) {
                //跳过
                continue;
            }
            // 如果当前时间超过结束时间,修改会议状态(逻辑删除)
            //修改循环会议的状态为0
            if (date.compareTo(endTime)>0){
                taskMeetingService.update(repeatMeeting.getId());
            }
        }
    }


    /**
     * 获取每月的工作日
     *
     * @param year
     * @param month
     * @return
     */
    public static List<Date> getWorkDates(int year, int month) {
        List<Date> dates = new ArrayList<Date>();
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DATE, 1);
        while (cal.get(Calendar.YEAR) == year &&
                cal.get(Calendar.MONTH) < month) {
            int day = cal.get(Calendar.DAY_OF_WEEK);

            if (!(day == Calendar.SUNDAY || day == Calendar.SATURDAY)) {
                dates.add((Date) cal.getTime().clone());
            }
            cal.add(Calendar.DATE, 1);
        }
        return dates;
    }


    /**
     * 获取当前日期是星期几<br>
     * @param dt
     * @return 当前日期是星期几
     */
    public static String getWeekOfDate(Date dt) {
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);

        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        return weekDays[w];
    }

    /**
     * java获取当前月的天数
     * @return
     */
    public int getDayOfMonth(){
        Calendar aCalendar = Calendar.getInstance(Locale.CHINA);
        int day=aCalendar.getActualMaximum(Calendar.DATE);
        return day;
    }


}
