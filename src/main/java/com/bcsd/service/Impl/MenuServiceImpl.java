package com.bcsd.service.Impl;

import com.bcsd.dao.MenuDao;
import com.bcsd.entity.Menu;
import com.bcsd.entity.TreeNode;
import com.bcsd.service.MenuService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;

    @Override
    public List<Menu> findAll(Integer page, Integer limit, String menuName) {
        PageHelper.startPage(page,limit);
        return menuDao.findAll(menuName);
    }

    @Override
    public Menu findOne(Integer id) {
        return menuDao.findOne(id);
    }

    @Override
    public void update(Menu menu) {
        menuDao.update(menu);
    }

    @Override
    public void add(Menu menu) {
        menuDao.add(menu);
    }

    @Override
    public void delete(int id) {
        menuDao.delete(id);
    }

    @Override
    public List<Integer> getMenuIdsByRoleId(Integer roleId) {
        return menuDao.getMenuIdsByRoleId(roleId);
    }

    @Override
    public List<TreeNode> menuTreeList() {
        return menuDao.menuTreeList();
    }

    @Override
    public List<TreeNode> menuTreeListByMenuIds(List<Integer> menuIds) {
        return menuDao.menuTreeListByMenuIds(menuIds);
    }

    @Override
    public void deleteMenu(Integer roleId) {
        menuDao.deleteMenu(roleId);
    }

    @Override
    public void addMenu(Integer roleId, List<String> id) {
        for (String menuId : id) {
            menuDao.addMenu(roleId,Integer.parseInt(menuId));
        }
    }
}
