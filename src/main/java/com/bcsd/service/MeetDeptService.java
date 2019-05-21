package com.bcsd.service;

import com.bcsd.entity.MeetDept;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.SubOffice;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/23
 */
public interface MeetDeptService {
    List<MeetDept> fidnAll(Integer page,Integer size,String deptName);

    MeetDept findByid(String deptId);
    void update (MeetDept meetDept);
    void add(MeetDept meetDept);

    void delect(String  id);

    List<SubOffice> findOffice();
}
