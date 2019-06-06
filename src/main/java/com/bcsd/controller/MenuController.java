package com.bcsd.controller;


import com.bcsd.entity.MeetUser;
import com.bcsd.entity.Menu;
import com.bcsd.entity.ResponseData;
import com.bcsd.entity.TreeNode;
import com.bcsd.service.MenuService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

    private String PREFIX = "page/menu";

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/findAll", method = RequestMethod.POST)
    @ResponseBody
    public Object findAll(Integer page, Integer limit, String menuName) {
        if (page == null || page == 0) {
            page = 1;
        }
        if (limit == null || limit == 0) {
            limit = 10;
        }
        List<Menu> list = menuService.findAll(page, limit, menuName);
        PageInfo<Menu> pageInfo = new PageInfo<Menu>(list);
        ResponseData data = new ResponseData((int) pageInfo.getTotal(), 0, "查询成功", list);
        return data;
    }

    /**
     * 查询菜单信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/findOne")
    public String findOne(@RequestParam(value = "id") Integer id, HttpServletRequest request) {
        Menu menu = menuService.findOne(id);
        request.setAttribute("menu", menu);
        return PREFIX + "/menu_add";
    }

    /**
     * 修改菜单
     *
     * @param
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public void update(Menu menu) {
        menu.setOperdate(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
        menuService.update(menu);
    }

    /**
     * 添加菜单
     *
     * @param
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public void add(Menu menu) throws Exception {
        MeetUser user = (MeetUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        menu.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
        menu.setOperuser(user.getUsername());
        menu.setStatus(1);
        menuService.add(menu);
    }


    /**
     * 删除菜单
     *
     * @param
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(@RequestParam(value = "id") int id) {
        menuService.delete(id);
        ResponseData data = new ResponseData();
        data.setMessage("删除成功");
        data.setCode(0);
        return data;
    }

    /**
     * 获取菜单列表(首页用)
     */
    @RequestMapping(value = "/menuTreeList")
    @ResponseBody
    public List<TreeNode> menuTreeList() {
        return menuService.menuTreeList();
    }

    /**
     * 获取菜单列表(选择父级菜单用)
     */
    @RequestMapping(value = "/selectMenuTreeList")
    @ResponseBody
    public List<TreeNode> selectMenuTreeList() {
        List<TreeNode> roleTreeList = menuService.menuTreeList();
        roleTreeList.add(TreeNode.createParent());
        return roleTreeList;
    }


    /**
     * 获取角色的菜单列表
     */
    @RequestMapping(value = "/menuTreeListByRoleId")
    @ResponseBody
    public List<TreeNode> menuTreeListByRoleId(@Param("id") Integer id) {
        List<Integer> menuIds = menuService.getMenuIdsByRoleId(id);
        if (menuIds == null || menuIds.size() == 0) {
            return menuService.menuTreeList();
        } else {
            return menuService.menuTreeListByMenuIds(menuIds);
        }
    }

    @RequestMapping(value = "/setMenu")
    @ResponseBody
    @Transactional
    public ResponseData setMenu(@RequestParam("menuId") String ids, @RequestParam("roleId") Integer roleId) {
        System.out.println(ids + "---" + roleId);
        ResponseData data = new ResponseData();
        try {
            //先删除角色持有菜单
            menuService.deleteMenu(roleId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        boolean contains = ids.contains(",");
        if (contains) {//有逗号
            //获取添加菜单id
            List<String> id = Arrays.asList(ids.split(","));
            menuService.addMenu(roleId, id);
        } else {//没有逗号
            if (ids != null) {
                List<String> id = Arrays.asList(ids);
                menuService.addMenu(roleId, id);
            }
        }
        data.setCode(200);
        data.setMessage("修改角色成功!");
        return data;
    }
}
