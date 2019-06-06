package com.bcsd.service;

import com.bcsd.entity.Menu;
import com.bcsd.entity.Role;
import com.bcsd.entity.TreeNode;

import java.util.List;

public interface RoleService {
    List<Menu> findMenu();

    List<Role> findAll(Integer page, Integer limit, String roleName);

    Role findOne(Integer id);

    void update(Role role);

    void add(Role role);

    void delete(int id);

    List<TreeNode> roleTreeList();

    List<TreeNode> roleTreeListByUserId(List<Integer> roleId);

    List<Integer> findRoleByUserId(Integer userId);

    void deleteRole(Integer userId);

    void addRole(Integer userId,List<String> id);
}
