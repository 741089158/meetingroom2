package com.bcsd.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.Appointment_Meeting;
import com.bcsd.entity.HistoryMeet;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.MeetUser;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.RepeatMeeting;
import com.bcsd.entity.ResponseData;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.AddUserService;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.HistoryMeetService;
import com.bcsd.service.LdapService;
import com.bcsd.service.MeetRoomService;
import com.bcsd.service.MeetUserService;
import com.bcsd.service.ReMeetRoomService;
import com.bcsd.service.TaskMeetingService;
import com.bcsd.util.DateChange;
import com.bcsd.util.GetUser;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/meetroom")
public class ReMeetRoomController {

    private String PREFIX = "page/meeting";

    @Autowired
    @Qualifier("reMeetRoomService")
    private ReMeetRoomService reMeetRoomService;
    @Autowired
    private AppointmentMeetService appointmentMeetService;
    @Autowired
    private HistoryMeetService historyMeetService;
    @Autowired
    private AddUserService addUserService;



    /**
     * 查询地区
     *
     * @param
     * @return
     */
    @RequestMapping("remeetroom")
    public ModelAndView remeetroom() {
        ModelAndView vm = new ModelAndView();
        List<MeetRoom> meetRoomBuilding = reMeetRoomService.findBuilding("ch-wh");
        List<MeetRoom> meetRoomArea = reMeetRoomService.findArea();
        vm.addObject("meetRoomArea", meetRoomArea);
        vm.addObject("meetRoomBuilding", meetRoomBuilding);
        vm.setViewName("page/home");
        return vm;
    }

    /**
     * 查询地区
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/meetarea", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetarea() {
        String result = JSONObject.toJSONString(reMeetRoomService.findArea());
        return result;
    }

    /**
     * 查询大楼
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/meetbuilding", method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetbuilding(@RequestParam(value = "key") String key) {
        String result = JSONObject.toJSONString(reMeetRoomService.findBuilding(key));
        return result;
    }

    /**
     * 查询楼层    linwenle
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/floor", method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Object floor(@RequestParam(value = "area") String area, @RequestParam(value = "building") String building) {
        String result = JSONObject.toJSONString(reMeetRoomService.floor(area, building));
        return result;
    }

    /**
     * 查询楼层   xuefan
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/meetfloor", method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String roomfloor(@RequestParam(value = "area") String area, @RequestParam(value = "building") String building) {
        //String result =JSONObject.toJSONString(reMeetRoomService.findFloor(area,building));
        return this.reMeetRoomService.findFloor(area, building);
    }


    /**
     * 查询会议室
     *
     * @return
     */
    @RequestMapping(value = "/findRoom", method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Object findRoom(@RequestParam(value = "areaId") String areaId, @RequestParam(value = "building") String building, @RequestParam(value = "floor") String floor) {
        // System.out.println(areaId+"--"+building+"--"+floor);
        String result = JSONObject.toJSONString(reMeetRoomService.findRoom(areaId, building, floor, ""));
        //System.out.println(result);
        return result;
    }


    /**
     * 修改会议室
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/updateMeetRoom", method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Object updateMeetRoom(@RequestParam(value = "areaId") String areaId, @RequestParam(value = "building") String building, @RequestParam(value = "floor") String floor, @RequestParam(value = "roomId") String roomId) {
        String result = JSONObject.toJSONString(reMeetRoomService.updateMeetRoom(areaId, building, floor, roomId));
        return result;
    }


    /**
     * 按地区大楼楼层日期查询会议室
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/meetroom", method = RequestMethod.POST,
            produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetrooom(@RequestParam(value = "area") String area, @RequestParam(value = "building") String building, @RequestParam(value = "floor") String floor,
                            @RequestParam(value = "date") String date, @RequestParam(value = "time") String time, @RequestParam(value = "duration") String duration) throws ParseException {
        //到时候放到service层
        String datetime = date.trim() + " " + time.trim();
        String endTime = DateChange.getTime(datetime, duration);
        List<Appointment_Meeting> roomId = reMeetRoomService.findByDate(datetime, endTime);
        String roomid = "(";
        int i = 1;
        for (Appointment_Meeting id : roomId) {
            //System.out.println(roomId.size());
            if (i == roomId.size()) {
                // System.out.println(id.getMeetRoomId());
                roomid = roomid + id.getMeetRoomId();
            } else {
                roomid = roomid + id.getMeetRoomId() + ",";
            }
            i++;
        }
        roomid = roomid + ")";
        String result = JSONObject.toJSONString(reMeetRoomService.findRoom(area, building, floor.trim(), roomid));
        return result;
    }


    /**
     * 跳转到预定会议页面
     *
     * @param
     * @return
     */
    @RequestMapping("remmet")
    public ModelAndView remmet(@Param("id") String id, @RequestParam(value = "date") String date, @RequestParam(value = "time") String time,
                               @RequestParam(value = "meetTime") String meetTime, HttpSession session) {

        String datetime = date.trim() + " " + time.trim();
        //System.out.println(id);
        ModelAndView vm = new ModelAndView();
        int num = (int) (Math.random() * 1000000);
        MeetRoom meetRoom = reMeetRoomService.findById(id);
        session.setAttribute("meetId", num);
        vm.addObject("date", date);
        vm.addObject("time", time);
        vm.addObject("datetime", datetime);
        vm.addObject("meetTime", meetTime);
        vm.addObject("meetRoom", meetRoom);
        // vm.addObject("meetId",num);
        vm.addObject("meetRoomId", id);
        vm.setViewName("page/localmeet");
        return vm;
    }
    
   /* @RequestMapping("remmetbak")
    public ModelAndView remmetbak(@Param("id")String id, @RequestParam(value = "date")String date, @RequestParam(value = "time")String time,
                               @RequestParam(value = "duration")String duration, HttpSession session){

        String datetime =date.trim()+" "+time.trim();
        //System.out.println(id);
        ModelAndView vm=new ModelAndView();
        int num = (int)(Math.random()*1000000);
        MeetRoom meetRoom=reMeetRoomService.findById(id);
        session.setAttribute("meetid",num);
        vm.addObject("date",date);
        vm.addObject("time",time);
        vm.addObject("datetime",datetime);
        vm.addObject("duration",duration);
        vm.addObject("meetRoom",meetRoom);
        vm.addObject("meetId",num);
        vm.addObject("meetRoomId",id);
        vm.setViewName("page/localmeet_bak");
        return vm;
    }*/

   /* @RequestMapping("videoremeet")
    public ModelAndView video(@Param("id")String id,@RequestParam(value = "date")String date,@RequestParam(value = "time")String time,
                              @RequestParam(value = "duration")String duration,HttpSession session){
        String datetime =date.trim()+" "+time.trim();
        ModelAndView vm=new ModelAndView();
        int num = (int)(Math.random()*1000000);
        MeetRoom meetRoom=reMeetRoomService.findById(id);
        session.setAttribute("meetid",num);
        vm.addObject("datetime",datetime);
        vm.addObject("duration",duration);
        vm.addObject("meetRoom",meetRoom);
        vm.addObject("meetId",num);
        vm.addObject("meetRoomId",id);
        vm.setViewName("page/other/videomeet");
        return vm;
    }*/


   @Autowired
   private LdapService ldapService;
    /**
     * 预定会议
     *
     * @param
     * @return
     */
    @RequestMapping("/appointmeet")
    @ResponseBody
    @Transactional
    public ResponseData appointmmet(@RequestParam(value = "date") String date,
                                    @RequestParam(value = "time") String time,
                                    Remeet remeet) {
        String datetime = date.trim() + " " + time.trim();
        remeet.setMeetDate(datetime);
        //查询联系人
        List<Map<String,String>> user = new ArrayList<Map<String,String>>();
        String userId = remeet.getUserId();
        String strip = StringUtils.strip(userId, "[]");
        //加条件判断?
        String[] split = strip.split(",");
        for (String s : split) {
            Map<String, String> map =null;
            try {
                map = ldapService.queryUser(s);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            //addUserService.addMeet()
            user.add(map);
        }
        ResponseData data = new ResponseData();
        try {
            //添加会议数据
            appointmentMeetService.appointmentMeet(remeet, user);
            data.setCode(200);
            data.setMessage("预订成功");
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            data.setCode(404);
            data.setMessage("预订失败");
            return data;
        }
    }

    @Autowired
    private TaskMeetingService taskMeetingService;

    /**
     * 预定循环会议   改
     *
     * @param
     * @return
     */
    @RequestMapping("/reserve")
    @ResponseBody
    public ResponseData reserve(@RequestParam(value = "time") String time,
                                @RequestParam(value = "day") String day,
                                @RequestParam(value = "createTime") String createTime,
                                @RequestParam(value = "endTime") String endTime,
                                String week, String months,
                                Remeet remeet) throws Exception {
        //设置时间
        String datetime = createTime.trim() + " " + time.trim();
        remeet.setMeetDate(datetime);

        //添加会议数据
        RepeatMeeting repeatMeeting = new RepeatMeeting();
        repeatMeeting.setId(remeet.getId());
        repeatMeeting.setCreateTime(remeet.getMeetDate());
        repeatMeeting.setEndTime(endTime);
        repeatMeeting.setMeetName(remeet.getMeetName());
        repeatMeeting.setMeetRoomName(remeet.getMeetRoomName());
        repeatMeeting.setType(remeet.getMeetType());
        repeatMeeting.setMeetTime(remeet.getMeetTime());
        repeatMeeting.setDescription(remeet.getMeetDescription());
        repeatMeeting.setRepeatType(day);
        repeatMeeting.setStatus(1);
        repeatMeeting.setIsDefault(1);
        repeatMeeting.setUserId(remeet.getUserId());
        repeatMeeting.setTitle(remeet.getMeetLaber());
        repeatMeeting.setRoomId(remeet.getMeetRoomId());
        if (week != null) {
            repeatMeeting.setWeeks(week);
        }
        if (months != null && (week == null || week == "")) {
            repeatMeeting.setWeeks(months);
        }
        ResponseData data = new ResponseData();
        try {
            taskMeetingService.addRepeatReserve(repeatMeeting);
            data.setCode(200);
            data.setMessage("预订成功");
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            data.setCode(404);
            data.setMessage("预订失败");
            return data;
        }
    }


    /**
     * 预定视屏会议
     *
     * @param
     * @return
     */
    @RequestMapping("/appointVideoMeet")
    public ModelAndView appointVideoMeet(Remeet remeet) {
        ModelAndView vm = new ModelAndView();
        List<UserInternal> user = addUserService.findUserByMeetId(String.valueOf(remeet.getId()));
        //增加数据进去
        appointmentMeetService.appointmentVideoMeet(remeet, user);

        List<Remeet> meets = appointmentMeetService.findPage(1, 10);
        vm.addObject("meets", meets);
        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        vm.addObject("pageInfo", pageInfo);
        vm.setViewName("page/meeting/meettable");
        return vm;
    }


    @Autowired
    private MeetUserService meetUserService;


    /**
     * 查询预定会议
     *
     * @param page
     * @param size
     * @param meetName
     * @return
     */
    @RequestMapping("/myappointmeet")
    @ResponseBody
    public Object myappointmeet(Integer page, Integer size, String meetName) {
        User user = GetUser.current();
        MeetUser meetUser = meetUserService.findByUsername(user.getUsername());
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
        List<Remeet> meet = appointmentMeetService.findMeetByUsername(page, size, meetUser.getUsername(), meetName);
        PageInfo pageInfo = new PageInfo<Remeet>(meet);
        ResponseData data = new ResponseData((int) pageInfo.getTotal(), 0, "成功", meet);
        return data;
    }


    //分页查询历史会议
    @RequestMapping("/meet_history")
    public ModelAndView meet_history(Integer page, Integer size) {
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
        ModelAndView vm = new ModelAndView();
        List<HistoryMeet> historymeets = historyMeetService.findAll(page, size);
        PageInfo pageInfo = new PageInfo<HistoryMeet>(historymeets);
        vm.addObject("pageInfo", pageInfo);
        vm.setViewName("page/meeting/meet_history");
        return vm;
    }


    @Autowired
    private MeetRoomService meetRoomService;

    @RequestMapping("/findRoomName")
    public Object findRoomName(String areaid, String roombuilding, String roomfloor) {
        //System.out.println(areaid+"--"+roombuilding+"--"+roomfloor);
        List<MeetRoom> list = meetRoomService.findRoomName(areaid, roombuilding, roomfloor);
        String result = JSONObject.toJSONString(list);
        return result;
    }

    /**
     * 修改会议
     */
    @RequestMapping("/update")
    @ResponseBody
    public void update(Remeet remeet, @RequestParam("date") String date, @RequestParam(value = "time") String time) {
        String datetime = date.trim() + " " + time.trim();
        remeet.setMeetDate(datetime);
        String strip = StringUtils.strip(remeet.getUserId(), "[]");
        remeet.setUserId(strip);
        try {
            appointmentMeetService.update(remeet);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询会议
     *
     * @param id
     * @return
     */
    @RequestMapping("/findOne")
    public Object findOne(Integer id, HttpServletRequest request) {
        Remeet remeet = appointmentMeetService.findOne(id);
        //处理时间
        String[] split = remeet.getMeetDate().split(" ");
        request.setAttribute("remeet", remeet);
        request.setAttribute("date", split[0]);
        request.setAttribute("time", split[1]);
        return PREFIX + "/meet_update";
    }


    /**
     * 查询重复会议
     *
     * @param id      重复会议id
     * @param request
     * @return
     */
    @RequestMapping("/findRepeatMeeting")
    public Object findRepeatMeeting(Integer id, HttpServletRequest request) {
        RepeatMeeting repeatMeeting = appointmentMeetService.findRepeatMeeting(id);
        String[] split = repeatMeeting.getCreateTime().split(" ");
        request.setAttribute("repeatMeeting", repeatMeeting);
        request.setAttribute("date", split[0]);
        request.setAttribute("time", split[1]);
        return PREFIX + "/repeatMeet_update";
    }

    /**
     * 开始会议
     *
     * @param remeet
     * @return
     */
    @RequestMapping("/startMeet")
    @ResponseBody
    public void startMeet(Remeet remeet) {
       /* ResponseData data = new ResponseData();
        data.setMessage(remeet.getMeetName()+"开始!");
        data.setCode(0);
        return data;*/
    }

    /**
     * 修改状态 删除会议
     *
     * @param id
     */
    @RequestMapping("/updateState")
    @ResponseBody
    public void updateState(Integer id) {
        appointmentMeetService.updateState(id);
    }
}
