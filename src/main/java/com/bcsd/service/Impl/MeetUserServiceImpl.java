package com.bcsd.service.Impl;

import com.bcsd.dao.MeetDeptDao;
import com.bcsd.dao.MeetUserDao;
import com.bcsd.entity.MeetUser;
import com.bcsd.entity.Role;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.MeetUserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author HOEP
 * @data 2019/4/24
 */
@Service("meetUserServiceImpl")
public class MeetUserServiceImpl implements MeetUserService {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private MeetUserDao meetUserDao;

    @Autowired
    private MeetDeptDao meetDeptDao;

//    @Autowired
//    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // logger.info("登录用户名:" + username);
        //System.out.println(username);
        MeetUser meetUser = null;
        try {
            meetUser = meetUserDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // System.out.println(meetUser);
        //明文密码需要加前缀{noop}
        if (meetUser != null) {
            return new User(meetUser.getUsername(), meetUser.getPassword(), getAuthority(meetUser.getUsername()));
        }
        //通过状态和权限来控制用户登陆       明文加{noop}
        // User user = new User(meetUser.getUsername(), "{noop}"+meetUser.getPassword(), meetUser.getStatus() == 0 ? false : true, true, true, true, getAuthority(meetUser.getRoles()));
        return null;
    }

    public List<SimpleGrantedAuthority> getAuthority(String username){
        List<Map<String,String>> maps = meetUserDao.findMenuListByUsername(username);
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        if (maps!=null){
            for (Map<String, String> map : maps) {
                list.add(new SimpleGrantedAuthority("ROLE_" + map.get("code")));
            }
        }
        return list;
    }

    //作用就是返回一个List集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {

        List<SimpleGrantedAuthority> list = new ArrayList<>();
//        list.add(new SimpleGrantedAuthority("ROLE_USER"));
//        list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        //从数据库获取用户角色
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }
        return list;
    }


    public List<Map<String, String>> findAll(Integer page, Integer size, String username) {
        PageHelper.startPage(page, size);
        return meetUserDao.findAll(username);
    }

    public void add(MeetUser meetUser) {
        //对密码进行加密处理
        //meetUser.setPassword(bCryptPasswordEncoder.encode(meetUser.getPassword()));
        meetUserDao.add(meetUser);
    }


    public Map<String, String> findById(Integer Id) {
        return meetUserDao.findById(Id);
    }

    public void update(MeetUser meetUser) {
        //对密码进行加密处理
        //meetUser.setPassword(bCryptPasswordEncoder.encode(meetUser.getPassword()));
        meetUserDao.update(meetUser);
    }

    public void delete(Integer id) {
        meetUserDao.delete(id);
    }

    /**
     * 查询内部联系人
     *
     * @param page
     * @param size
     * @param internal
     * @return
     */

    public List<UserInternal> findInternal(Integer page, Integer size, String internal, String name) {
        PageHelper.startPage(page, size);
        List<UserInternal> list = meetUserDao.findInternal(internal, name);
        return list;
    }

    /**
     * 查找内部联系人
     */
    @Override
    public Map<String, Object> findInternalJSON(Integer page, Integer size, String internal, String name) {
        Page<Object> p = PageHelper.startPage(page, size);
        List<UserInternal> list = meetUserDao.findInternal(internal, name);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", p.getTotal());
        map.put("data", list);
        return map;
    }

    @Override
    public List<UserInternal> findInternal(String internal, String name) {
        List<UserInternal> list = meetUserDao.findInternal(internal, name);
        return list;
    }


    /**
     * 添加联系人
     *
     * @param internal
     */
    public void addInternal(UserInternal internal) {
        internal.setStatus(1);
        meetUserDao.addInternal(internal);
    }

    /**
     * 删除
     *
     * @param
     */

    @Transactional  //事务管理
    public void deleteInternal(Integer id) {
        meetUserDao.deleteInternal(id);
    }

    /**
     * 批量删除
     *
     * @param ids
     */

    @Transactional  //事务管理
    public void deleteInternal(Integer[] ids) {
        try {
            if (ids != null && ids.length > 0) {
                for (Integer id : ids) {
                    meetUserDao.deleteInternal(id);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public UserInternal findOne(Integer id) {
        return meetUserDao.findOne(id);
    }

    public void updateLinkman(UserInternal userInternal) {
        meetUserDao.updateLinkman(userInternal);
    }

    @Override
    public List<Map<String, String>> findDept() {
        return meetDeptDao.findDept();
    }

    @Override
    public MeetUser findByUsername(String username) {
        return meetUserDao.findByUsername(username);
    }

    @Override
    public List<Integer> getRoleIdByUserId(Integer id) {
        return meetUserDao.getRoleIdByUserId(id);
        //return null;
    }

}
