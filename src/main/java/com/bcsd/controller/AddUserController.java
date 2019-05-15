package com.bcsd.controller;

import com.bcsd.dao.AddUserDao;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.AddUserService;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.MeetUserService;
import com.bcsd.service.ReMeetRoomService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/addUser")
public class AddUserController {
    @Autowired
    private AddUserService addUserService;
    @Autowired
    private MeetUserService meetUserService;

    @RequestMapping("addUser")
    public ModelAndView addUser(@Param("remeetId")int remeetId, @Param("userId")String userId, HttpSession session){
        String  meetId=String.valueOf(remeetId);
        ModelAndView vm=new ModelAndView();
        addUserService.addUser(userId,meetId);
        String meetid=String.valueOf(session.getAttribute("meetid"));

        System.out.println( addUserService.findUserByMeetId(meetid));
        vm.addObject("remeetId", meetId);
        vm.setViewName("redirect:findInternal?meetId="+remeetId+"");
        return vm;
    }
    @RequestMapping("addUsers")
    public ModelAndView addUsers(HttpServletRequest request,HttpSession session){
        String meetid=String.valueOf(session.getAttribute("meetid"));
        String [] arr = request.getParameterValues("uid");
        for (int i =0;i<arr.length;i++){
            addUserService.addUser(arr[i],meetid);
        }

        ModelAndView vm=new ModelAndView();
        vm.addObject("remeetId", meetid);
        vm.setViewName("redirect:findInternal?meetId="+meetid+"");
        return vm;
    }

    @RequestMapping("findInternal")
    public ModelAndView findInternal(@Param("meetId")int meetId, Integer page, Integer size, Integer internal, String name){

        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 5;
        }
        if (internal == null || internal != 1) {
            internal = 0;
        }
        if (name == null) {
            name = "";
        }
        ModelAndView vm = new ModelAndView();
        List<UserInternal> list = meetUserService.findInternal(page, size, internal,name);
        //PageInfo pageInfo = new PageInfo<>(list);
        vm.addObject("Internal", list);
        vm.addObject("meetId", meetId);
        vm.setViewName("page/addUser/linkman1");
        return vm;

    }


    /**
     * 添加联系人
     * @param meetid
     * @param session
     * @return
     */
    @RequestMapping("finduser")
    public ModelAndView addUser(@Param("meetid")String meetid,HttpSession session){

        ModelAndView vm=new ModelAndView();
        List<UserInternal> user=addUserService.findUserByMeetId(meetid);

        session.setAttribute("meetid",meetid);
        session.getAttribute("pageInfo");

        PageInfo pageInfo=(PageInfo)session.getAttribute("pageInfo");
        vm.addObject("user", user);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/addUser/linkman2");
        return vm;
    }


    /**
     * 取消会议
     * @param userId
     * @param session
     * @return
     */
    @RequestMapping("deleteUser")
    public ModelAndView deleteUser( @Param("userId")String userId, HttpSession session){

        ModelAndView vm=new ModelAndView();
        String meetid=String.valueOf(session.getAttribute("meetid"));

        addUserService.deleteUser(userId,meetid);
        vm.setViewName("addUser/finduser?meetid="+meetid+"");
        return vm;
    }

}
