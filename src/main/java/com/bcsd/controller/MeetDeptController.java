package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.MeetDept;
import com.bcsd.entity.ResponseData;
import com.bcsd.entity.SubOffice;
import com.bcsd.service.MeetDeptService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/23
 */
@Controller
@RequestMapping("/dept")
public class MeetDeptController {

    private String PREFIX = "page/dept";

    @Autowired
    private MeetDeptService meetDeptService;

    /**
     * 分页查询
     * @param page
     * @param size
     * @param deptName
     * @return
     */
    @RequestMapping("/findAll")
    @ResponseBody
    public Object findAll(Integer page,Integer size,String deptName){
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=10;
        }
        List<MeetDept> meetDeptList = meetDeptService.fidnAll(page,size,deptName);
        PageInfo<MeetDept> pageInfo = new PageInfo<MeetDept>(meetDeptList);
        ResponseData data = new ResponseData((int) pageInfo.getTotal(), 0, "成功", meetDeptList);
        return data;
    }

    /**
     * 查询分部
     * @return
     */
    @RequestMapping(value = "/findSub", produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object findSub(){
        String result = JSONObject.toJSONString(meetDeptService.findOffice());
        //System.out.println(result);
        return result;
    }

    /**
     * 查询部门
     * @param deptid
     * @return
     */
    @RequestMapping("/findOne")
    public String findOne(@RequestParam(value = "deptid") String deptid, HttpServletRequest request){
        MeetDept meetDept=meetDeptService.findByid(deptid);//查询部门
        List<SubOffice> list = meetDeptService.findOffice();//查询分部
        request.setAttribute("list",list);
        request.setAttribute("dept",meetDept);
        return PREFIX+"/dept_add";
    }

    @RequestMapping("/update")
    @ResponseBody
    public void update(MeetDept meetDept){
        meetDeptService.update(meetDept);
    }


    @RequestMapping("/add")
    @ResponseBody
    public void add(MeetDept meetDept){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String startTime = sf.format(new Date());
        meetDept.setStarttime(startTime);
        meetDeptService.add(meetDept);
    }


    @RequestMapping("/delete")
    @ResponseBody
    public Object  delete(@RequestParam(value = "deptid")String deptid){
        meetDeptService.delect(deptid);
        ResponseData data = new ResponseData();
        data.setMessage("删除成功");
        data.setCode(0);
        return data;
    }
}
