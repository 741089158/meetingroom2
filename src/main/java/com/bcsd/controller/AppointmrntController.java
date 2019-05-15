package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.*;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.MeetRoomService;
import com.bcsd.service.MeetUserService;
import com.bcsd.service.ReMeetRoomService;
import com.bcsd.dao.AddUserDao;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.*;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

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

	@RequestMapping("videoremeet")
	public ModelAndView video(@Param("id") String id, @RequestParam(value = "date") String date,
			@RequestParam(value = "time") String time, @RequestParam(value = "duration") String duration) {
		String datetime = date.trim() + " " + time.trim();
		ModelAndView vm = new ModelAndView();
		MeetRoom meetRoom = reMeetRoomService.findById(id);
		vm.addObject("datetime", datetime);
		vm.addObject("duration", duration);
		vm.addObject("meetRoom", meetRoom);
		vm.setViewName("page/videomeet");
		return vm;
	}


    /**
     * 查询联系人
     * @param page
     * @param size
     * @param internal
     * @param name
     * @return
     */
    @RequestMapping("findInternal")
    public ModelAndView findInternal(Integer page, Integer size, Integer internal,String name){
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 5;
        }
        if (internal == null || internal != 1) {
            internal = 0;
        }

		ModelAndView vm = new ModelAndView();
		List<UserInternal> list = meetUserService.findInternal(page, size, internal, name);
		// PageInfo pageInfo = new PageInfo<>(list);
		vm.addObject("Internal", list);
		vm.setViewName("page/addUser/linkman1");
		return vm;
	}

	/**
	 * 查询我的预定会议
	 *
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping("myappointmeet")
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
		vm.setViewName("page/meettable");
		return vm;
	}

	/**
	 * 根据用户id查询我的历史会议
	 *
	 * @param page
	 * @param size
	 * @param id   用户id,暂时固定
	 * @return
	 */
	@RequestMapping("/history")
	@ResponseBody
	public Object findHistory(Integer page, Integer size, Integer id, String meetName) {
		if (page == null || page == 0) {
			page = 1;
		}
		if (size == null || size == 0) {
			size = 10;
		}
		id = 1;
		List<HistoryMeet> list = appointmentMeetService.findPageHistory(page, size, id, meetName);
		PageInfo pageInfo = new PageInfo<HistoryMeet>(list);
		ResponseData data = new ResponseData((int)pageInfo.getTotal(),0,"查询成功",list);
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
	public ModelAndView findHistoryUser(Integer page, Integer size, Integer id) {
		if (page == null || page == 0) {
			page = 1;
		}
		if (size == null || size == 0) {
			size = 10;
		}
		ModelAndView vm = new ModelAndView();
		List<User> list = appointmentMeetService.findHistoryUser(page, size, id);
		PageInfo<User> pageInfo = new PageInfo<User>(list);
		vm.addObject("pageInfo", pageInfo);
		vm.setViewName("page/user/historymeet");
		return vm;
	}

	/**
	 * 查询所有循环会议列表
	 *
	 * @param page
	 * @param size
	 * @param meetName
	 * @return
	 */
	@RequestMapping("/findRepeatMeeting")
	public ModelAndView findRepeatMeeting(Integer page, Integer size, String meetName) {
		if (page == null || page == 0) {
			page = 1;
		}
		if (size == null || size == 0) {
			size = 10;
		}
		List<RepeatMeeting> list = taskMeetingService.findRepeatMeeting(page, size, meetName);
		PageInfo<RepeatMeeting> pageInfo = new PageInfo<RepeatMeeting>(list);
		ModelAndView vm = new ModelAndView();
		vm.addObject("pageInfo", pageInfo);
		vm.setViewName("page/meeting/repeatMeeting");
		return vm;
	}

}
