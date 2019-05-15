package com.bcsd.dao;

import com.bcsd.entity.Mail;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * @author TANGXIAN
 */
public interface MailDao {
    List<Mail> findAll(@Param("status")int status);
    void add(Mail mail);
    Mail findByid(@Param("id")int id);
    void update(Mail mail);
}
