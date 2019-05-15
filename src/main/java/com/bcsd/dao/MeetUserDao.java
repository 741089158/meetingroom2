package com.bcsd.dao;

import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/24
 */
public interface MeetUserDao {
    List<MeetUser> findAll(@Param("username") String username);
    void add(MeetUser meetUser);
    void addid(MeetUserRole meetUserRole);
    MeetUser findByid(String Id);
    void update(MeetUser meetUser);
    void delete(String id);


    /*查询联系人*/
    List<UserInternal> findInternal(@Param("internal") Integer internal,@Param("name") String name);

    //List<UserInternal> findExternal(Integer internal);

    void addInternal(UserInternal internal);

    void deleteInternal(Integer id);


    UserInternal findOne(Integer id);

    void updateLinkman(UserInternal userInternal);
}
