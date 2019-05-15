package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.Impl.MeetUserServiceImpl;
import com.bcsd.service.MeetUserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
    public ModelAndView findAll(Integer page,Integer size,String username) {
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=10;
        }
        ModelAndView mv = new ModelAndView();
        if (username!=null||username!=""){
            mv.addObject("username",username);
        }
        List<MeetUser> all = meetUserService.findAll(page,size,username);
        PageInfo<MeetUser> pageInfo = new PageInfo<MeetUser>(all);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("page/meet_user");
        return mv;

    }
    @RequestMapping("/add1")
    public String add1(MeetUser meetUser){

        if (meetUser.getSubofficeid()==1){
            meetUser.setSuboffice("武汉分部");
        }
        else {
            meetUser.setSuboffice("上海分部");
        }
        meetUserService.add(meetUser);
        return "forward:findAll";
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
    @RequestMapping("/update")
    public String update(MeetUser meetUser){
        if (meetUser.getSubofficeid()==1){
            meetUser.setSuboffice("武汉分部");
            System.out.println(meetUser.getSuboffice());
        }else
        {meetUser.setSuboffice("上海分部");}

        System.out.println(meetUser);
        meetUserService.update(meetUser);
        return "forward:findAll";
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam(value = "id")String id){
        System.out.println(id);
        meetUserService.delete(id);
        return "forward:findAll";
    }

    @RequestMapping("/add")
    public String add(MeetUser meetUser) {
        meetUserService.add(meetUser);
        MeetUserRole meetUserRole = new MeetUserRole();
        meetUserService.addid(meetUserRole);
        return "forward:findAll";
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
    public ModelAndView findInternal(Integer page, Integer size, Integer internal,String name){
        System.out.println(page+"--"+size+"--"+internal+"--"+name);
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 10;
        }
       /* if (name ==null ){
            name="";
        }*/
        ModelAndView vm = new ModelAndView();
        if (name!=null||name!=""){
            vm.addObject("name",name);
        }
        if (internal!=null){
            vm.addObject("internal",internal);
        }
        List<UserInternal> list = meetUserService.findInternal(page, size, internal,name);
        PageInfo pageInfo = new PageInfo<UserInternal>(list);
        vm.addObject("pageInfo", pageInfo);
        vm.setViewName(PREFIX + "/linkman");
        return vm;
    }


    /**
     * 添加联系人
     * @param internal
     * @return
     */
    @RequestMapping("/addInternal")
    public String addInternal(UserInternal internal) {
        meetUserService.addInternal(internal);
        return "redirect:findInternal";
    }


    /**
     * 删除联系人
     * @param id
     * @return
     */
    @RequestMapping("/deleteInternal")
    public String deleteInternal(Integer id) {
        meetUserService.deleteInternal(id);
        return "redirect:findInternal";
    }

    /**
     * 批量删除联系人
     * @param
     * @return
     */
    @RequestMapping("/deleteInternals")
    public String deleteInternal(HttpServletRequest request) {
        String[] ids = request.getParameterValues("id");
        for (String id : ids) {
            meetUserService.deleteInternal(Integer.parseInt(id));
        }
        return "redirect:findInternal";
    }


    /**
     * 修改
     * @param userInternal
     * @return
     */
    @RequestMapping("/updateLinkman")
    public Object updateLinkman(UserInternal userInternal){
        meetUserService.updateLinkman(userInternal);
        return "redirect:findInternal";
    }

    /**
     * 查询单个联系人
     * @param id
     * @return
     */
    @RequestMapping("/findOne")
    public ModelAndView findOne(Integer id){
        UserInternal user = meetUserService.findOne(id);
        ModelAndView vm = new ModelAndView();
        vm.addObject("user",user);
        vm.setViewName(PREFIX+"/linkman_update");
        return vm;
    }

}
