package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.*;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.MeetRoomService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 会议室管理功能
 */

@Controller
@RequestMapping("/meet")
public class MeetRoomController {

    private String PREFIX = "page/meet_management";

    @Autowired
    @Qualifier("meetRoomService")
    private MeetRoomService meetRoomService;

    @Autowired
    private AppointmentMeetService appointmentMeetService;


    /**
     * 查询所有会议室
     * @param
     * @return
     */
    @RequestMapping("/findAll")
    @ResponseBody
    public Object findAll(Integer page, Integer limit, String roomName) {
        if (page == null || page == 0) {
            page = 1;
        }
        if (limit == null || limit == 0) {
            limit = 10;
        }
        List<MeetRoom> meetRoomList = meetRoomService.findAll(page, limit, roomName);
        PageInfo<MeetRoom> pageInfo = new PageInfo<MeetRoom>(meetRoomList);
        ResponseData data = new ResponseData((int)pageInfo.getTotal(), 0, "查询成功", meetRoomList);
        return data;
    }

    /**
     * 查询所有会议室
     * @param
     * @return
     */
    @RequestMapping("/findList")
    @ResponseBody
    public Object findList() {
        List<MeetRoom> meetRoomList = meetRoomService.findList();
        PageInfo pageInfo=new PageInfo<MeetRoom>(meetRoomList);
        ResponseData data = new ResponseData(meetRoomList.size(), 0, "查询成功", meetRoomList);
        return data;
    }


    /**
     * 会议室日程列表
     * @return
     */
    @RequestMapping(value = "/fullCalendar")
    @ResponseBody
    public Object fullCalendar(@Param("areaId") String areaId,@Param("building") String building, @Param("floor")String floor) {
        //System.out.println(areaId+"--"+building+"--"+floor);
        List<MeetRoom> list =  meetRoomService.findRoom(areaId,building,floor);
        List<FullCalendar> fullCalendar = new ArrayList<FullCalendar>();
        for (MeetRoom meetRoom : list) {
            fullCalendar.add(new FullCalendar(meetRoom.getRoomId(), meetRoom.getRoomName(), "blue"));
        }
        return fullCalendar;
    }

    /**
     * 会议室日程事件
     *
     * @return
     * @throws ParseException
     */
    @RequestMapping(value = "/fullEvents", method = RequestMethod.GET)
    @ResponseBody
    public Object fullEvents() throws ParseException {
        List<Remeet> remeets = appointmentMeetService.findAll();
        ArrayList<Events> list = new ArrayList<Events>();
        for (Remeet remeet : remeets) {
            //开始时间
            String meetDate = remeet.getMeetDate();
            String[] s = meetDate.split(" ");
            String start = s[0] + "T" + s[1];
            //结束时间
            String meetTime = remeet.getMeetTime();
            String[] split = meetTime.split(":");
            long second = Integer.parseInt(split[0]) * 60 * 60 * 1000 + Integer.parseInt(split[1]) * 60 * 1000;
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            long time = sf.parse(meetDate).getTime();
            String endTime = sf.format(new Date(time + second));
            String[] s1 = endTime.split(" ");
            String end = s1[0] + "T" + s1[1];
            list.add(new Events(remeet.getMeetRoomId(), start, end, remeet.getMeetName()));
        }
        return list;
    }

    /**
     * 根据登陆用户名查询预订会议日程列表
     * @return
     */
    @RequestMapping(value = "/meetFullCalendar", method = RequestMethod.GET)
    @ResponseBody
    public Object userFullCalendar() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<Remeet> list = appointmentMeetService.findMeetByUserName(user.getUsername());
        List<FullCalendar> fullCalendar = new ArrayList<FullCalendar>();
        for (Remeet remeet : list) {
            fullCalendar.add(new FullCalendar(remeet.getId().toString(), remeet.getMeetName(), "blue"));
        }
        return fullCalendar;
    }

    /**
     * 会议日程事件
     *
     * @return
     * @throws ParseException
     */
    @RequestMapping(value = "/meetFullEvents")
    @ResponseBody
    public Object meetFullEvents() throws ParseException {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<Remeet> list = appointmentMeetService.findMeetByUserName(user.getUsername());
        List<Events> events = new ArrayList<Events>();
        for (Remeet remeet : list) {
            //开始时间
            String meetDate = remeet.getMeetDate();
            String[] s = meetDate.split(" ");
            String start = s[0] + "T" + s[1];
            //结束时间
            String meetTime = remeet.getMeetTime();
            String[] split = meetTime.split(":");
            long second = Integer.parseInt(split[0]) * 60 * 60 * 1000 + Integer.parseInt(split[1]) * 60 * 1000;
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            long time = sf.parse(meetDate).getTime();
            String endTime = sf.format(new Date(time + second));
            String[] s1 = endTime.split(" ");
            String end = s1[0] + "T" + s1[1];
            events.add(new Events(remeet.getId().toString(), start, end, remeet.getMeetName()));
        }
        return events;

    }



    /**
     * 查询所有会议室
     *
     * @param
     * @return
     */
    @RequestMapping("/findAllRoom")
    public ModelAndView findAllRoom(Integer page, Integer size, String roomName) {
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
        ModelAndView vm = new ModelAndView();
        List<MeetRoom> meetRoomList = meetRoomService.findAll(page, size, roomName);
        PageInfo pageInfo = new PageInfo<MeetRoom>(meetRoomList);
        vm.addObject("pageInfo", pageInfo);
        if (roomName != null || roomName != "") {
            vm.addObject("roomName", roomName);
        }
        vm.setViewName("page/meeting/meeting_list");
        return vm;
    }


    /**
     * 查询会议室信息
     * @param
     * @return
     */
    @RequestMapping("/findOne")
    public String findOne(@RequestParam(value = "roomId") String roomId,HttpServletRequest request) {
        MeetRoom meetRoom = meetRoomService.findOne(roomId);
        request.setAttribute("meetRoom",meetRoom);
        return PREFIX + "/room_add";
    }

    /**
     * 添加会议室
     *
     * @param meetRoom
     * @return
     * @throws Exception
     */
    @RequestMapping("/add")
    @ResponseBody
    @Transactional
    public ResponseData add(MeetRoom meetRoom) throws Exception {
        ResponseData data = new ResponseData();
        MeetRoom room = meetRoomService.findRoomByRoomName(meetRoom.getRoomName());
        if (room==null){
            meetRoomService.add(meetRoom);
            data.setCode(200);
            data.setMessage("添加成功");
            return data;
        }else {
            data.setCode(404);
            data.setMessage("会议室名已存在!");
            return data;
        }
    }

    /**
     * 修改会议室信息
     *
     * @param meetRoom
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    @Transactional
    public ResponseData update(MeetRoom meetRoom) {
        ResponseData data = new ResponseData();
        try {
            meetRoomService.update(meetRoom);
            data.setCode(200);
            data.setMessage("修改成功");
            return data;
        } catch (Exception e) {
            e.printStackTrace();

            data.setCode(404);
            data.setMessage("会议室名已存在!");
            return data;
        }
    }

    /**
     * 删除会议室
     *
     * @param roomId
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(@RequestParam(value = "roomId") String roomId) {
        ResponseData data = new ResponseData();
        try {
            meetRoomService.delete(roomId);
            data.setMessage("删除成功");
            data.setCode(200);
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            data.setMessage("删除失败");
            data.setCode(404);
            return data;
        }


    }

}
