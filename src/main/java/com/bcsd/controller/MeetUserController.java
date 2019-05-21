package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.*;
import com.bcsd.service.MeetUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
        List<Map<String,String>> all = meetUserService.findAll(page,size,username);
        PageInfo<Map<String,String>> pageInfo = new PageInfo<Map<String,String>>(all);
        ResponseData data = new ResponseData((int) pageInfo.getTotal(), 0, "成功", all);
        return data;

    }

    @RequestMapping("/findUser")
    public String findUser(@RequestParam(value = "id")Integer id, HttpServletRequest request){
        Map<String,String> user = meetUserService.findById(id);
        request.setAttribute("user",user);
        return PREFIX+"/user_add";
    }


    @RequestMapping(value = "/findDept", produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object findDept(){
        //List<Map<String ,String>> dept = meetUserService.findDept();
        return JSONObject.toJSONString(meetUserService.findDept());
    }


    /**
     * 修改用户
     * @param user
     */
    @RequestMapping("/updateUser")
    @ResponseBody
    public void update(MeetUser user){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        user.setOperdate(sf.format(new Date()));
        meetUserService.update(user);
    }
    /**
     * 添加用户
     * @param user
     */
    @RequestMapping("/addUser")
    @ResponseBody
    public void addUser(MeetUser user){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        user.setCreatedate(sf.format(new Date()));
        user.setOrderBy(0);
        user.setIsdisabled(0);
        user.setStatus(0);
        user.setOperuser("admin");
        user.setIsExternal(0);
        meetUserService.add(user);
    }
    /**
     * 删除用户
     * @param id
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public void deleteUser(Integer id){
        meetUserService.delete(id);
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
     * 修改联系人
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
