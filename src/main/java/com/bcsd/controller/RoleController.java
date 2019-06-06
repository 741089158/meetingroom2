package com.bcsd.controller;


import com.bcsd.entity.*;
import com.bcsd.service.MeetUserService;
import com.bcsd.service.RoleService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/role")
public class RoleController {

    private String PREFIX = "page/role";

    @Autowired
    private RoleService roleService;

    @Autowired
    private MeetUserService meetUserService;

    @RequestMapping("/findMenu")
    public Object findMenu(){
        List<Menu> list = roleService.findMenu();
        return list;
    }

    @RequestMapping(value = "/findAll",method = RequestMethod.POST)
    @ResponseBody
    public Object findAll(Integer page, Integer limit, String roleName){
        if (page == null || page == 0) {
            page = 1;
        }
        if (limit == null || limit == 0) {
            limit = 10;
        }
        List<Role> list = roleService.findAll(page,limit,roleName);
        PageInfo<Role> pageInfo = new PageInfo<Role>(list);
        ResponseData data = new ResponseData((int)pageInfo.getTotal(), 0, "查询成功", list);
        return data;
    }

    /**
     * 查询角色信息
     * @param id
     * @return
     */
    @RequestMapping("/findOne")
    public String findOne(@RequestParam(value="id") Integer id, HttpServletRequest request){
        Role role = roleService.findOne(id);
        request.setAttribute("role",role);
        return PREFIX+"/role_add";
    }

    /**
     * 修改角色
     * @param
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public void update(Role role){
        roleService.update(role);
    }

    /**
     * 添加角色
     * @param
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public void add(Role role) throws Exception {
        System.out.println(role);
        roleService.add(role);
    }


    /**
     * 删除角色
     * @param
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(@RequestParam(value="id") int id){
        roleService.delete(id);
        ResponseData data = new ResponseData();
        data.setMessage("删除成功");
        data.setCode(0);
        return data;
    }

    /**
     * 获取用户的角色列表
     */
    @RequestMapping(value = "/roleTreeListByUserId")
    @ResponseBody
    public List<TreeNode> roleTreeListByUserId(@Param("id") Integer id) {
        List<Integer> roleId = meetUserService.getRoleIdByUserId(id);
        if (roleId == null || roleId.size() == 0){
            return roleService.roleTreeList();
        }else {
            return roleService.roleTreeListByUserId(roleId);
        }
    }

    /**
     * 获取角色列表
     *
     */
    @RequestMapping(value = "/roleTreeList")
    @ResponseBody
    public List<TreeNode> roleTreeList() {
        List<TreeNode> roleTreeList = roleService.roleTreeList();
        roleTreeList.add(TreeNode.createParent());
        return roleTreeList;
    }

    @RequestMapping(value = "/setRole")
    @ResponseBody
    @Transactional
    public ResponseData setRole(@RequestParam("roleId") String ids,@RequestParam("userId")Integer userId){
        ResponseData data = new ResponseData();
        try {
            //先删除用户所有角色
            roleService.deleteRole(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        boolean contains = ids.contains(",");
        if (contains){//有逗号
            //获取添加角色id
            List<String> id = Arrays.asList(ids.split(","));
            roleService.addRole(userId,id);
        }else {//没有逗号
            if (ids!=null){
                List<String> id = Arrays.asList(ids);
                roleService.addRole(userId,id);
            }
        }
        data.setCode(200);
        data.setMessage("修改角色成功!");
        return data;
    }

}
