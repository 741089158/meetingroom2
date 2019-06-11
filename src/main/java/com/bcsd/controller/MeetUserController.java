package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.*;
import com.bcsd.service.MeetUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

import java.text.SimpleDateFormat;
import java.util.*;

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

   /* @RequestMapping("/username")
    @ResponseBody
    public Object username(){
        MeetUser user=(MeetUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println(user);
        ResponseData data = new ResponseData();
        data.setData(user);
        return data;
    }*/


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
    @Transactional
    public ResponseData update(MeetUser user){
        ResponseData data = new ResponseData();
        //先检查用户名是否已存在
        MeetUser meetUser = meetUserService.findByUsername(user.getUsername());
        if (meetUser == null ){
            User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            user.setOperuser(users.getUsername());
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            user.setOperdate(sf.format(new Date()));
            meetUserService.update(user);
            data.setCode(200);
            data.setMessage("添加成功");
            return data;
        }else {
            data.setCode(404);
            data.setMessage("用户名已存在!");
            return data;
        }

    }
    /**
     * 添加用户
     * @param user
     */
    @RequestMapping("/addUser")
    @ResponseBody
    @Transactional
    public ResponseData addUser(MeetUser user){
        ResponseData data = new ResponseData();
        //先检查用户名是否已存在
        MeetUser meetUser = meetUserService.findByUsername(user.getUsername());
        if (meetUser == null ){
            User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            user.setCreatedate(sf.format(new Date()));
            user.setOrderBy(0);
            user.setIsdisabled(0);
            user.setStatus(0);
            user.setOperuser(users.getUsername());
            user.setIsExternal(0);
            meetUserService.add(user);
            data.setCode(200);
            data.setMessage("添加成功");
            return data;
        }else {
            data.setCode(404);
            data.setMessage("用户名已存在!");
            return data;
        }

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
     * @param page       当前页码
     * @param size       每页显示数
     * @param internal 联系人
     * @return
     */
    @RequestMapping("/findInternal")
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
     * 查询联系人
     * @param internal 联系人
     * @return
     */
    @RequestMapping("/selectInternal")
    @ResponseBody
    public Object selectInternal(String internal,String name){
        List<UserInternal> list = meetUserService.findInternal(internal,name);
        ArrayList<Map<String, Object>> user = new ArrayList<>();
        for (UserInternal userInternal : list) {
            Map<String, Object> map = new HashMap<>();
            map.put("id",userInternal.getId());
            map.put("name",userInternal.getName());
            map.put("value",userInternal.getId());
            user.add(map);
        }
        ResponseData data = new ResponseData(user.size(), 0, "成功", user);
        return data;
    }


    /**
     * 添加联系人
     * @param internal
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public ResponseData addInternal(UserInternal internal) {
        ResponseData data = new ResponseData();
        try {
            meetUserService.addInternal(internal);
            data.setCode(200);
            data.setMessage("添加成功");
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            data.setCode(404);
            data.setMessage("添加失败");
            return data;
        }
    }


    /**
     * 删除联系人
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseData deleteInternal(Integer id) {
        ResponseData data = new ResponseData();
        try {
            meetUserService.deleteInternal(id);
            data.setCode(200);
            data.setMessage("删除成功");
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            data.setCode(404);
            data.setMessage("删除失败");
            return data;
        }
    }


    /**
     * 修改联系人
     * @param userInternal
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public ResponseData updateLinkman(UserInternal userInternal){
        ResponseData data = new ResponseData();
        try {
            meetUserService.updateLinkman(userInternal);
            data.setCode(200);
            data.setMessage("修改成功");
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            data.setCode(404);
            data.setMessage("修改失败");
            return data;
        }
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
