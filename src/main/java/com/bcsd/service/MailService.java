package com.bcsd.service;

import com.bcsd.entity.Mail;

import java.util.List;


public interface MailService {
    List<Mail> findAll(int status);
    List<Mail> findPage(int status,int pageNum,int pageSize);
    void add(Mail mail);
    Mail findByid(int id);
    void update(Mail mail);
}
