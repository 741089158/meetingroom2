package com.bcsd.controller;

import com.bcsd.entity.*;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.MeetUserService;
import com.bcsd.service.ReMeetRoomService;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.*;
import com.bcsd.util.DateChange;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/appointreet")
public class AppointmrntController {

    @Autowired
    private AppointmentMeetService appointmentMeetService;
    @Autowired
    @Qualifier("reMeetRoomService")
    private ReMeetRoomService reMeetRoomService;
    @Autowired
    private MeetUserService meetUserService;
    @Autowired
    private TaskMeetingService taskMeetingService;

  /*  @RequestMapping("/videoremeet")
    public ModelAndView video(@Param("id") String id, @RequestParam(value = "date") String date,
                              @RequestParam(value = "time") String time, @RequestParam(value = "duration") String duration) {
        String datetime = date.trim() + " " + time.trim();
        ModelAndView vm = new ModelAndView();
        MeetRoom meetRoom = reMeetRoomService.findById(id);
        vm.addObject("datetime", datetime);
        vm.addObject("duration", duration);
        vm.addObject("meetRoom", meetRoom);
        vm.setViewName("page/other/videomeet");
        return vm;
    }*/



    /**
     * 查询我的预定会议
     * @param page
     * @param size
     * @return
     */
   /* @RequestMapping("/myappointmeet")
    public ModelAndView myappointmeet(Integer page, Integer size) {
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
        ModelAndView vm = new ModelAndView();
        List<Remeet> meets = appointmentMeetService.findPage(page, size);
        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        vm.addObject("pageInfo", pageInfo);
        vm.setViewName("page/meeting/meettable");
        return vm;
    }*/

    /**
     * 根据用户id查询我的历史会议
     *
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("/history")
    @ResponseBody
    public Object findHistory(Integer page, Integer size,String meetName) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
        List<HistoryMeet> list = appointmentMeetService.findPageHistory(page, size, user.getUsername(), meetName);
        PageInfo pageInfo = new PageInfo<HistoryMeet>(list);
        ResponseData data = new ResponseData((int) pageInfo.getTotal(), 0, "查询成功", list);
        return data;
    }


    /**
     * 根据历史会议id查询参会人员
     *
     * @param page
     * @param size
     * @param id   历史会议id
     * @return
     */
    @RequestMapping("/findHistoryUser")
    @ResponseBody
    public Object findHistoryUser(Integer page, Integer size, Integer id) {
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
        List<MeetUser> list = appointmentMeetService.findHistoryUser(page, size, id);
        PageInfo<MeetUser> pageInfo = new PageInfo<MeetUser>(list);
        ResponseData data = new ResponseData((int) pageInfo.getTotal(), 0, "成功", list);
        return data;
    }

    /**
     * 查询所有循环会议列表
     * @param page
     * @param size
     * @param meetName
     * @return
     */
    @RequestMapping("/findRepeatMeeting")
    @ResponseBody
    public Object findRepeatMeeting(Integer page, Integer size, String meetName) {
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
        List<RepeatMeeting> list = taskMeetingService.findRepeatMeeting(page, size, meetName);
        PageInfo<RepeatMeeting> pageInfo = new PageInfo<RepeatMeeting>(list);
        ResponseData data = new ResponseData((int) pageInfo.getTotal(), 0, "成功", list);
        return data;
    }

    /**
     * 预定会议冲突检查
     * @param date 日期   格式  yyyy-MM-dd
     * @param time 时间   格式  HH:mm
     * @param duration 时长  格式  HH:mm
     * @return
     */
    @RequestMapping("/checkTime")
    @ResponseBody
    public Object checkTime(String date,String time,String duration) throws ParseException {
        System.out.println(date + "---" + time  + "---" + duration);
        String dateTime = date+" "+time;
        //1:查询所有预订会议
        List<Remeet> list = appointmentMeetService.findAll();
        //2:获取会议开始事件结束事件
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date startTime = sf.parse(dateTime);//预订会议开始时间
        Date endTime = new Date(startTime.getTime() + DateChange.changeTime(duration));//预订会议结束时间

        List<Remeet> meets=new ArrayList<Remeet>();
        //3判断该时间段内是否有被占用的会议室
        for (Remeet remeet : list) {
            String meetDate = remeet.getMeetDate(); //会议开始时间
            String meetTime = remeet.getMeetTime();//已预订会议时长
            Date startTime1 = sf.parse(meetDate);//已预订会议开始时间
            Date endTime1 = new Date(startTime1.getTime() + DateChange.changeTime(meetTime));//已预订会议结束时间
            if ((startTime.compareTo(startTime1)>=0&&startTime.compareTo(endTime1)<=0)||
                    (endTime.compareTo(endTime1)<=0&&endTime.compareTo(startTime1)>=0)||
                    (startTime.compareTo(startTime1)<=0&&endTime.compareTo(endTime1)>=0)){
                meets.add(remeet);
            }
        }
        //ResponseData data = new ResponseData(list.size(), 0, "成功", meets);
        return meets;
    }

    /**
     * 根据会议室id查询会议室当天会议
     * @return
     */
    @RequestMapping("/findMeetingByRoomId")
    @ResponseBody
    public ResponseData findMeetingByRoomId(String roomId){
        //获取当天时间
        String s = DateChange.dateFormat(new Date(), "yyyy-MM-dd");  //2019-06-11
        List<Remeet> list = appointmentMeetService.findMeetingByRoomId(roomId);
        List<Remeet> list1 = new ArrayList<>();
        for (Remeet remeet : list) {
            String time = remeet.getMeetDate().split(" ")[0];
            if (s.equals(time)){
                list1.add(remeet);
            }
        }
        ResponseData date =new ResponseData(list1.size(),0,"",list1);
        return date;
    }

}
