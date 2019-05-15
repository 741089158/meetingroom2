package com.bcsd.dao;

import com.bcsd.entity.MeetDept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/23
 */
public interface MeetDeptDao {
    List<MeetDept> findAll(@Param("deptName") String deptName);
    MeetDept findByid(String deptId);
    void add (MeetDept meetDept);
    void update(MeetDept meetDept);
    void delete (String id);
}
