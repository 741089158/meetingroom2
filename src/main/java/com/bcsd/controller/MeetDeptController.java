package com.bcsd.controller;

import com.bcsd.entity.MeetDept;
import com.bcsd.service.MeetDeptService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/23
 */
@Controller
@RequestMapping("/dept")
public class MeetDeptController {



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
    public ModelAndView findAll(Integer page,Integer size,String deptName){
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=10;
        }
        ModelAndView vm=new ModelAndView();
        //回显查询条件
        if (deptName!=null||deptName!=""){
            vm.addObject("deptName",deptName);
        }
        List<MeetDept> meetDeptList = meetDeptService.fidnAll(page,size,deptName);
        PageInfo<MeetDept> pageInfo = new PageInfo<MeetDept>(meetDeptList);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meet_dept");
        return vm;

    }

    /**
     * 查询部门
     * @param deptid
     * @return
     */
    @RequestMapping("/findByid")
    public ModelAndView findByid(@RequestParam(value = "deptid") String deptid){

        ModelAndView mv=new ModelAndView();
        MeetDept meetDept=meetDeptService.findByid(deptid);
        mv.addObject("meetdept",meetDept);
        mv.setViewName("page/meet_manager/meet_manager_dept_update");
        return mv;
    }
    @RequestMapping("/update")
    public String update(MeetDept meetDept){

        meetDeptService.update(meetDept);

        return "forward:findAll";
    }


    @RequestMapping("/add")
    public String  add(MeetDept meetDept){
        meetDeptService.add(meetDept);
        return "redirect:findAll";

    }
    @RequestMapping("/delete")
    public String  delete(String deptid){
        meetDeptService.delect(deptid);
        return "forward:findAll";


    }
}
