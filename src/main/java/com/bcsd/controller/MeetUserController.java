package com.bcsd.controller;

import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;
import com.bcsd.entity.ResponseData;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.MeetUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/24
 */
@Controller
@RequestMapping("/user")
public class MeetUserController {

    private String PREFIX = "page/user";

    @Autowired
    private MeetUserService meetUserService;

    @RequestMapping("/findAll")
    @ResponseBody
    public Object findAll(Integer page,Integer size,String username) {
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=10;
        }

        List<MeetUser> all = meetUserService.findAll(page,size,username);
        PageInfo<MeetUser> pageInfo = new PageInfo<MeetUser>(all);
        ResponseData data = new ResponseData((int) pageInfo.getTotal(), 0, "成功", all);
        return data;

    }

    @RequestMapping("/findByid")
    public ModelAndView findByid(@RequestParam(value = "id")String id){
        System.out.println(id);
        ModelAndView mv=new ModelAndView();
        MeetUser byid = meetUserService.findByid(id);
        mv.addObject("meetuser",byid);
        mv.setViewName("page/meet_manager/meet_manager_user_update");
        return mv;
    }



    /**
     * 查询联系人
     *
     * @param page       当前页码
     * @param size       每页显示数
     * @param internal 联系人
     * @return
     */
    @RequestMapping("findInternal")
    @ResponseBody
    public Object findInternal(Integer page, Integer size, String internal,String name){
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
        List<UserInternal> list = meetUserService.findInternal(page, size, internal,name);
        PageInfo pageInfo = new PageInfo<UserInternal>(list);
        ResponseData data = new ResponseData((int) pageInfo.getTotal(), 0, "成功", list);
        return data;
    }


    /**
     * 添加联系人
     * @param internal
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public void addInternal(UserInternal internal) {
        meetUserService.addInternal(internal);
    }


    /**
     * 删除联系人
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public Object deleteInternal(Integer id) {
        meetUserService.deleteInternal(id);
        ResponseData data = new ResponseData();
        data.setMessage("删除成功");
        return data;
    }

    /**
     * 批量删除联系人
     * @param
     * @return
     *//*
    @RequestMapping("/deleteInternals")
    public Object deleteInternal(HttpServletRequest request) {
        String[] ids = request.getParameterValues("id");
        for (String id : ids) {
            meetUserService.deleteInternal(Integer.parseInt(id));
        }
        ResponseData data = new ResponseData();
        data.setMessage("删除成功");
        return data;
    }*/


    /**
     * 修改
     * @param userInternal
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public void updateLinkman(UserInternal userInternal){
        meetUserService.updateLinkman(userInternal);
    }

    /**
     * 查询单个联系人
     * @param id
     * @return
     */
    @RequestMapping("/findOne")
    public String findOne(Integer id,HttpServletRequest request){
        UserInternal user = meetUserService.findOne(id);
        request.setAttribute("user",user);
        return PREFIX+"/linkman_add";
    }

}
