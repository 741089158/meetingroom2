package com.bcsd.service.Impl;

import com.bcsd.dao.MeetDeptDao;
import com.bcsd.entity.MeetDept;
import com.bcsd.entity.MeetRoom;
import com.bcsd.service.MeetDeptService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * @author HOEP
 * @data 2019/4/23
 */
@Service("meetDeptService")
public class MeetDeptServiceImpl implements MeetDeptService {
    @Autowired
    private MeetDeptDao meetDeptDao;

    public List<MeetDept> fidnAll(Integer page,Integer size,String deptName) {
        PageHelper.startPage(page,size);
        return  meetDeptDao.findAll(deptName);
    }

    public MeetDept findByid(String deptId) {
        MeetDept byid = meetDeptDao.findByid(deptId);
        return byid;
    }

    public void update(MeetDept meetDept) {
        System.out.println(meetDept);
        meetDeptDao.update(meetDept);
    }


    public void add(MeetDept meetDept) {
        String uuid = String.valueOf(UUID.randomUUID());
        String[] split = uuid.split("-");
        meetDept.setDeptid(split[1]);
        meetDeptDao.add(meetDept);
    }

    public void delect(String id) {
        meetDeptDao.delete(id);
    }
}
