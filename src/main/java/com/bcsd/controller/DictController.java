package com.bcsd.controller;


import com.bcsd.entity.Dict;
import com.bcsd.entity.ResponseData;
import com.bcsd.entity.Result;
import com.bcsd.service.DictService;
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
 * 字典功能
 */

@Controller
@RequestMapping("/dict")
public class DictController  {

    private String PREFIX = "page/dict";

    @Autowired
    private DictService dictService;

    /**
     * 分页查询
     * @param page 当前页码
     * @param size  每页显示数
     * @return
     */
    @RequestMapping("/findPage")
    @ResponseBody
    public Object findPage(Integer page,Integer size,String name){
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=10;
        }
        List<Dict> list = dictService.findPage(page, size,name);
        PageInfo pageInfo = new PageInfo<Dict>(list);
        ResponseData data = new ResponseData((int)pageInfo.getTotal(), 0, "查询成功", list);
        return data;
    }

    /**
     * 通过父id查询下一级
     * @param page
     * @param size
     * @param pid
     * @return
     */
    @RequestMapping("/findByPid")
    public ModelAndView findByPid(Integer page,Integer size,Integer pid){
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=5;
        }
        dictService.findByPid(page, size,pid);
        return null;
    }

    /**
     * 查询字典信息
     * @param dictId
     * @return
     */
    @RequestMapping("/findOne")
    public String findOne(@RequestParam(value="dictId") Integer dictId,HttpServletRequest request){
        Dict dict = dictService.findOne(dictId);
        request.setAttribute("dict",dict);
        return PREFIX+"/dict_add";
    }

    /**
     * 修改字典
     * @param dict
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public void update(Dict dict){
        dictService.update(dict);
    }

    /**
     * 添加字典
     * @param
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public void add(Dict dict) throws Exception {
        dictService.add(dict);
    }


    /**
     * 删除字典
     * @param dictId
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(@RequestParam(value="dictId") int dictId){
        dictService.delete(dictId);
        ResponseData data = new ResponseData();
        data.setMessage("删除成功");
        data.setCode(0);
        return data;
    }

   /* *//**
     * 批量删除字典
     * @param
     * @return
     *//*
    @RequestMapping("/deletes")
    public String deletes(HttpServletRequest request){
        String[] ids = request.getParameterValues("dictId");
        System.out.println(ids);
        for (String dictId : ids) {
            dictService.delete(Integer.parseInt(dictId));
        }
        return "redirect:findPage";
    }
*/
}
