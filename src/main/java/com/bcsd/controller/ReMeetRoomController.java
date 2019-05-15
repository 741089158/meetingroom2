package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.*;
import com.bcsd.service.*;

import com.bcsd.util.DateChange;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("meetroom")
public class ReMeetRoomController {

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
     * 查询所有
     * @param
     * @return
     */

    /**
     * 查询地区
     * @param
     * @return
     */
    @RequestMapping("remeetroom")
    public ModelAndView remeetroom(){
        ModelAndView vm=new ModelAndView();
        List<MeetRoom> meetRoomBuilding = reMeetRoomService.findBuilding("ch-wh");
        List<MeetRoom> meetRoomArea = reMeetRoomService.findArea();
        vm.addObject("meetRoomArea",meetRoomArea);
        vm.addObject("meetRoomBuilding",meetRoomBuilding);
        vm.setViewName("page/home");
        return vm;
    }

    /**
     * 查询地区
     * @param
     * @return
     */
    @RequestMapping(value="/meetarea", produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetarea(){
        String result =JSONObject.toJSONString(reMeetRoomService.findArea());
        return result;
    }

    /**
     * 查询大楼
     * @param
     * @return
     */
    @RequestMapping(value="/meetbuilding",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetbuilding(@RequestParam(value="key") String key){
            String result =JSONObject.toJSONString(reMeetRoomService.findBuilding(key));
            return result;
    }

    /**
     * 查询楼层
     * @param
     * @return
     */
    @RequestMapping(value="/meetfloor",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object roomfloor(@RequestParam(value="area") String area,@RequestParam(value="building") String building){
            String result =JSONObject.toJSONString(reMeetRoomService.findFloor(area,building));
            return result;
    }

    /**
     * 查询会议室
     * @return
     */
    @RequestMapping(value = "/findRoom",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object findRoom(@RequestParam(value="areaId") String areaId,@RequestParam(value="building") String building,@RequestParam(value="floor") String floor){
       // System.out.println(areaId+"--"+building+"--"+floor);
        String result =JSONObject.toJSONString(reMeetRoomService.findRoom(areaId,building,floor,""));
        //System.out.println(result);
        return result;
    }


    /**
     * 修改会议室
     * @param
     * @return
     */
    @RequestMapping(value="/updateMeetRoom",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object updateMeetRoom(@RequestParam(value="areaId") String areaId,@RequestParam(value="building") String building,@RequestParam(value="floor") String floor,@RequestParam(value="roomId")String roomId){
        String result =JSONObject.toJSONString(reMeetRoomService.updateMeetRoom(areaId,building,floor,roomId));
        return result;
    }


    /**
     * 按地区大楼楼层日期查询会议室
     * @param
     * @return
     */
    @RequestMapping(value="/meetroom",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetrooom(@RequestParam(value="area") String area,@RequestParam(value="building") String building,@RequestParam(value="floor") String floor,
                            @RequestParam(value = "date")String date,@RequestParam(value = "time")String time,@RequestParam(value = "duration")String duration) throws ParseException {
            //到时候放到service层
            String datetime =date.trim()+" "+time.trim();
            String endTime= DateChange.getTime(datetime,duration);
            List<Appointment_Meeting> roomId=reMeetRoomService.findByDate(datetime,endTime);
            String roomid="(";
            int i =1;
            for (Appointment_Meeting id:roomId){
                //System.out.println(roomId.size());
                if(i==roomId.size()) {
                   // System.out.println(id.getMeetRoomId());
                    roomid = roomid + id.getMeetRoomId();
                }else {
                    roomid = roomid + id.getMeetRoomId()+",";
                }
                i++;
            }
                roomid=roomid+")";
            String result =JSONObject.toJSONString(reMeetRoomService.findRoom(area,building,floor.trim(),roomid));

            return result;
    }

    /*
    * 初始状态进入
    * */
    @RequestMapping("getInto")
    public ModelAndView getInto( HttpSession session) throws ParseException {
        ModelAndView vm=new ModelAndView();
        String areaid="c5539aa3-af34-463d-9415-1a7f8ae42727";
        String roomfloor="5";
        String roombuilding="YMTC-OS1";
        String nowTime=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
        String time="01:00";
        String endTime=DateChange.getTime(nowTime,time);
        List<Appointment_Meeting> roomId=reMeetRoomService.findByDate(nowTime,endTime);
        String roomid="(";
        int i =1;
        for (Appointment_Meeting id:roomId){
           // System.out.println(roomId.size());
            if(i==roomId.size()) {
                //System.out.println(id.getMeetRoomId());
                roomid = roomid + id.getMeetRoomId();
            }else {
                roomid = roomid + id.getMeetRoomId()+",";
            }
            i++;
        }
        roomid=roomid+")";
      List<MeetRoom> meetRooms=  reMeetRoomService.findRoom(areaid,roombuilding,roomfloor.trim(),roomid);
        
        session.setAttribute("meetRoom",meetRooms);
      vm.setViewName("index");
      return vm;
    }



    /**
     * 跳转到预定会议页面
     * @param
     * @return
     */
    @RequestMapping("remmet")
    public ModelAndView remmet(@Param("id")String id, @RequestParam(value = "date")String date, @RequestParam(value = "time")String time,
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
        vm.setViewName("page/localmeet");
        return vm;
    }

    @RequestMapping("videoremeet")
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
        vm.setViewName("page/videomeet");
        return vm;
    }

    /**
     * 预定会议
     * @param
     * @return
     */
    @RequestMapping("appointmeet")
    public ModelAndView appointmmet(@RequestParam(value = "date")String date,
                                    @RequestParam(value = "time")String time,
                                    Remeet remeet){
        String datetime =date.trim()+" "+time.trim();
        remeet.setMeetDate(datetime);
        ModelAndView vm=new ModelAndView();
        //增加联系人
        List<UserInternal> user =addUserService.findUserByMeetId(String.valueOf(remeet.getId()));
        //添加会议数据
        appointmentMeetService.appointmentMeet(remeet,user);
        List<Remeet> meets=appointmentMeetService.findPage(1,10);
        vm.addObject("meets",meets);
        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meettable");
        return vm;
    }

    @Autowired
    private TaskMeetingService taskMeetingService;
    /**
     * 预定循环会议   改
     * @param
     * @return
     */
    @RequestMapping("/reserve")
    public ModelAndView reserve( @RequestParam(value = "time")String time,
                                    @RequestParam(value = "day")String day,
                                    @RequestParam(value = "createTime")String createTime,
                                    @RequestParam(value = "endTime")String endTime,
                                    String weeks,Integer selectDay,
                                    Remeet remeet){
//        System.out.println(day+"--"+createTime+"--"+endTime);
//        for (String week : weeks) {
//            System.out.println(week);
//        }
        //System.out.println(selectDay);
        //设置时间
        String datetime =createTime.trim()+" "+time.trim();
        remeet.setMeetDate(datetime);
        ModelAndView vm=new ModelAndView();
        //增加联系人
        List<UserInternal> user =addUserService.findUserByMeetId(String.valueOf(remeet.getId()));
        List list=new ArrayList();
        for (UserInternal internal : user) {
            list.add(internal.getId());
        }
        //添加会议数据
        RepeatMeeting repeatMeeting = new RepeatMeeting();
        repeatMeeting.setCreateTime(remeet.getMeetDate());
        repeatMeeting.setEndTime(endTime);
        repeatMeeting.setMeetName(remeet.getMeetName());
        repeatMeeting.setRoomName(remeet.getMeetRoomName());
        repeatMeeting.setType(remeet.getMeetType());
        repeatMeeting.setMeetTime(remeet.getMeetTime());
        repeatMeeting.setDescription(remeet.getMeetDescription());
        repeatMeeting.setRepeatType(day);
        repeatMeeting.setStatus(1);
        repeatMeeting.setIsDefault(1);
        repeatMeeting.setUserId(list.toString());
        repeatMeeting.setTitle(remeet.getMeetLaber());
        repeatMeeting.setRoomId(remeet.getMeetRoomId());
        if (weeks!=null){
            repeatMeeting.setWeeks(weeks);
        }
        if (selectDay!=null&&weeks==null){
            repeatMeeting.setWeeks(selectDay.toString());
        }

        //System.out.println(weeks);
        taskMeetingService.addRepeatReserve(repeatMeeting);

       // appointmentMeetService.appointmentMeet(remeet,user);
        List<Remeet> meets=appointmentMeetService.findPage(1,10);
        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        vm.addObject("meets",meets);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meettable");
        return vm;
    }

    /**
     * 预定视屏会议
     * @param
     * @return
     */
    @RequestMapping("appointVideoMeet")
    public ModelAndView appointVideoMeet(Remeet remeet){
        ModelAndView vm=new ModelAndView();
        List<UserInternal> user =addUserService.findUserByMeetId(String.valueOf(remeet.getId()));
        //增加数据进去
        appointmentMeetService.appointmentVideoMeet(remeet,user);

        List<Remeet> meets=appointmentMeetService.findPage(1,10);
        vm.addObject("meets",meets);
        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meettable");
        return vm;
    }


    /**
     * 查询预定会议
     * @param page
     * @param size
     * @param meetName
     * @param session
     * @return
     */
    @RequestMapping("myappointmeet")
    public ModelAndView myappointmeet(Integer page,Integer size,String meetName,HttpSession session){
        if(page==null||page==0){
            page=1;
        }
        if(size==null||size==0){
            size=10;
        }

        ModelAndView vm=new ModelAndView();
        if (meetName!=null||meetName!=""){
            vm.addObject("meetName",meetName);
        }
        List<Remeet> meets=appointmentMeetService.findPage(page,size,meetName);
        String meetid=String.valueOf(session.getAttribute("meetid"));

        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        session.setAttribute("pageInfo",pageInfo);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meettable");
        return vm;
    }
//分页查询历史会议
    @RequestMapping("meet_history")
    public ModelAndView meet_history(Integer page,Integer size){
        if(page==null||page==0){
            page=1;
        }
        if(size==null||size==0){
            size=10;
        }
        ModelAndView vm=new ModelAndView();
        List<HistoryMeet> historymeets=historyMeetService.findAll(page,size);
        PageInfo pageInfo = new PageInfo<HistoryMeet>(historymeets);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meet_history");
        return vm;
    }

  /*  @RequestMapping("calender")
    public ModelAndView calender(){
        ModelAndView vm=new ModelAndView();
        List<MeetRoom> meetRoomBuilding = reMeetRoomService.findBuilding("ch-wh");
        List<MeetRoom> meetRoomArea = reMeetRoomService.findArea();
        //System.out.println(111);
        vm.addObject("meetRoomArea",meetRoomArea);
        vm.addObject("meetRoomBuilding",meetRoomBuilding);
        vm.setViewName("page/daymanager/data");
        return vm;
    }*/

    @Autowired
    private MeetRoomService meetRoomService;
    @RequestMapping("/findRoomName")
    public Object findRoomName(String areaid,String roombuilding,String roomfloor ){
        //System.out.println(areaid+"--"+roombuilding+"--"+roomfloor);
        List<MeetRoom> list = meetRoomService.findRoomName(areaid,roombuilding,roomfloor);
        String result = JSONObject.toJSONString(list);
        return result;
    }

    /**
     * 修改会议
     */
    @RequestMapping("/update")
    public String update(Remeet remeet,@RequestParam(value = "date")String date,@RequestParam(value = "time")String time){
        String datetime =date.trim()+" "+time.trim();
        remeet.setMeetDate(datetime);
        appointmentMeetService.update(remeet);
        return "redirect:myappointmeet";
    }

    /**
     * 查询会议
     * @param id
     * @return
     */
    @RequestMapping("/findOne")
    public ModelAndView findOne(Integer id){
        Remeet remeet = appointmentMeetService.findOne(id);
        //处理时间
        String[] split = remeet.getMeetDate().split(" ");
        ModelAndView vm=new ModelAndView();
        vm.addObject("remeet",remeet);
        vm.addObject("date",split[0]);
        vm.addObject("time",split[1]);
        vm.setViewName("page/meeting/meeting_update");
        return vm;
    }


    /**
     * 查询重复会议
     */
    @RequestMapping("/repeatMeeting")
    public void repeatMeeting(){

    }
}
