package com.bcsd.service;

import com.bcsd.entity.Menu;
import com.bcsd.entity.TreeNode;

import java.util.List;

public interface MenuService {
    List<Menu> findAll(Integer page, Integer limit, String menuName);

    Menu findOne(Integer id);

    void update(Menu menu);

    void add(Menu menu);

    void delete(int id);

    List<Integer> getMenuIdsByRoleId(Integer roleId);

    List<TreeNode> menuTreeList();

    List<TreeNode> menuTreeListByMenuIds(List<Integer> menuIds);

    void deleteMenu(Integer roleId);

    void addMenu(Integer roleId, List<String> id);
}
