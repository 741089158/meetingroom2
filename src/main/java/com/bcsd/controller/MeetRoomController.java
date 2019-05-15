package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.*;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.MeetRoomService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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
     *
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
     *
     * @param
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public Object list(Integer page, Integer limit, String roomName) {
        if (page == null || page == 0) {
            page = 1;
        }
        if (limit == null || limit == 0) {
            limit = 10;
        }
        //System.out.println("查询所有会议室");

        List<MeetRoom> meetRoomList = meetRoomService.findAll(page, limit, roomName);
        PageInfo pageInfo=new PageInfo<MeetRoom>(meetRoomList);
        //String result = JSONObject.toJSONString(meetRoomList);
        ResponseData data = new ResponseData((int)pageInfo.getTotal(), 0, "查询成功", meetRoomList);

        return data;
    }


    /**
     * 会议室日程列表
     *
     * @return
     */
    @RequestMapping(value = "/fullCalendar", method = RequestMethod.GET)
    @ResponseBody
    public Object fullCalendar() {
        List<MeetRoom> list = (List<MeetRoom>) meetRoomService.findRoom();
        //System.out.println(list);
        List<FullCalendar> fullCalendar = new ArrayList<FullCalendar>();
        for (MeetRoom meetRoom : list) {
            fullCalendar.add(new FullCalendar(meetRoom.getRoomId(), meetRoom.getRoomName(), "red"));
        }
        return fullCalendar;
    }

    /**
     * 会议室日程使用事件
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
            list.add(new Events(remeet.getMeetRoomId(), start, end, remeet.getMeetDescription()));
        }
        //String result =JSONObject.toJSONString(list);

        return list;
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
        System.out.println("查询所有会议室");
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
     *
     * @param
     * @return
     */
    @RequestMapping("/findOne")
    public ModelAndView findOne(@RequestParam(value = "roomId") String roomId) {
        ModelAndView vm = new ModelAndView();
        MeetRoom meetRoom = meetRoomService.findOne(roomId);
        vm.addObject("meetRoom", meetRoom);
        vm.setViewName(PREFIX + "/meet_manager_update");
        return vm;
    }

    /**
     * 添加会议室
     *
     * @param meetRoom
     * @return
     * @throws Exception
     */
    @RequestMapping("/add")
    public String add(MeetRoom meetRoom) throws Exception {
        //ModelAndView vm=new ModelAndView();
        meetRoomService.add(meetRoom);
        //vm.addObject("addInfo","success");
        System.out.println("添加成功!");
        return "redirect:findAll";
    }

    /**
     * 修改会议室信息
     *
     * @param meetRoom
     * @return
     */
    @RequestMapping("/update")
    public String update(MeetRoom meetRoom) {
        meetRoomService.update(meetRoom);
        return "redirect:findAll";
    }

    /**
     * 删除会议室
     *
     * @param roomId
     * @return
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "roomId") String roomId) {
        // System.out.println(roomId);
        ModelAndView vm = new ModelAndView();
        meetRoomService.delete(roomId);
      /*  vm.addObject("deleteInfo","success");
        System.out.println("删除成功!");
        vm.setViewName("page/meet_management");*/
        return "redirect:findAll";
    }

    /**
     * 删除会议室
     *
     * @param
     * @return
     */
    @RequestMapping("/deletes")
    public String deletes(HttpServletRequest request) {
        String[] ids = request.getParameterValues("roomId");
        System.out.println(ids);
        for (String roomId : ids) {
            meetRoomService.delete(roomId);
        }
        return "redirect:findAll";
    }

    @RequestMapping("/findRoom")
    public void findRoomByCondition() {

    }

}
