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
    @ResponseBody
    public Object findInternal(Integer page, Integer size, Integer internal,String name){
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
