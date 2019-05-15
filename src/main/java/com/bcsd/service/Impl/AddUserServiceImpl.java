package com.bcsd.service.Impl;

import com.bcsd.dao.AddUserDao;
import com.bcsd.dao.MailDao;
import com.bcsd.entity.Mail;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.AddUserService;
import com.bcsd.service.MailService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author TANGXIAN
 */
@Service("addUserService")
public class AddUserServiceImpl implements AddUserService {
    @Autowired
    private AddUserDao addUserDao;


    public void addUser(String userId, String meetId) {
        addUserDao.addUser(userId,meetId);
    }

    @Override
    public List<UserInternal> findUserByMeetId(String userId) {
        return addUserDao.findUserByMeetId(userId);
    }

    @Override
    public void deleteUser(String userId, String meetId) {
        addUserDao.deleteUser(userId,meetId);
    }
}
