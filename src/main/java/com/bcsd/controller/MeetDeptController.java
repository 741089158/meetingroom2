package com.bcsd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.MeetDept;
import com.bcsd.entity.ResponseData;
import com.bcsd.entity.SubOffice;
import com.bcsd.service.MeetDeptService;
import com.github.pagehelper.PageInfo;

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
     * @param deptname
     * @return
     */
    @RequestMapping("/findAll")
    @ResponseBody
    public Object findAll(Integer page,Integer size,String deptname){
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=10;
        }
        List<Map<String,String>> meetDeptList = meetDeptService.fidnAll(page,size,deptname);
        PageInfo<Map<String,String>> pageInfo = new PageInfo<Map<String,String>>(meetDeptList);
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
    @Transactional
    public ResponseData update(MeetDept meetDept){
        ResponseData data = new ResponseData();
            try {
                meetDeptService.update(meetDept);
                data.setCode(200);
                data.setMessage("修改成功");
                return data;
            } catch (Exception e) {
                e.printStackTrace();
                data.setCode(404);
                data.setMessage("部门已存在!");
                return data;
            }

    }


    @RequestMapping("/add")
    @ResponseBody
    @Transactional
    public ResponseData add(MeetDept meetDept){
        ResponseData data = new ResponseData();
        //先检查部门是否已存在
        MeetDept dept = meetDeptService.findByDeptName(meetDept.getDeptname());
        if (dept == null ) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String startTime = sf.format(new Date());
            meetDept.setStarttime(startTime);
            meetDeptService.add(meetDept);
            data.setCode(200);
            data.setMessage("添加成功");
            return data;
        }else {
            data.setCode(404);
            data.setMessage("部门已存在!");
            return data;
        }

    }


    @RequestMapping("/delete")
    @ResponseBody
    public ResponseData  delete(@RequestParam(value = "deptid")String deptid){
        ResponseData data = new ResponseData();
        try {
            meetDeptService.delect(deptid);
            data.setMessage("删除成功");
            data.setCode(200);
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            data.setMessage("删除成功");
            data.setCode(404);
            return data;
        }
    }
}
