package com.bcsd.task;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.bcsd.entity.Mail;
import com.bcsd.service.MailService;
import com.bcsd.tools.SendMailHelper;

@Component
public class SendMailTask {
	@Autowired
    private MailService mailService;
	@Scheduled(cron = "0 0/15 * * * ? ") // 间隔15分钟执行
    public void taskCycle() {
		try {
			SimpleDateFormat si = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(si.format(new Date())+"定时执行");
			List<Mail> list = mailService.findAll(1);
	        System.out.println(si.format(new Date())+"待发送的邮件共"+list.size()+"条");
	        for(Mail mail : list){
	        	boolean bool = SendMailHelper.sendMail(mail.getReceivemailaccount(), mail.getMailtitle(), mail.getMailsubject(), mail.getMailcontent());
	        	if(bool){
	        		//发送成功
	        		mail.setSenddate(new Date());
	            	mail.setStatus(2);
	            	mailService.update(mail);
	        	}else{
	        		//发送失败
	        		mail.setSenddate(new Date());
	            	mail.setStatus(3);
	            	mailService.update(mail);
	        	}
	        	System.out.println(si.format(new Date())+"发送邮件完毕");
	        	//每隔多少秒发送
	        	Thread.sleep(Long.valueOf(SendMailHelper.getString("sendHZ")));
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
