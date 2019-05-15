package com.bcsd.controller;

import java.util.Date;
import java.util.List;

import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bcsd.entity.Mail;
import com.bcsd.service.MailService;
import com.bcsd.tools.SendMailHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/mail")
public class MailController {
	private String PREFIX = "page/mail";
	@Autowired
	private MailService mailService;
    /**
     * 分页查询
     * @param page 当前页码
     * @param size  每页显示数
     * @return
     */
    @RequestMapping("/findPage")
    public ModelAndView findPage(Integer page,Integer size){
        if (page==null||page==0){
            page=1;
        }
        if (size==null||size==0){
            size=10;
        }
        List<Mail> list = mailService.findPage(2,page, size);
        PageInfo pageInfo = new PageInfo<Mail>(list);
        ModelAndView vm=new ModelAndView();
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/mail_home");
        return vm;
    }
    
    @RequestMapping("/sendMail")
    @ResponseBody
    public String update(String mailidArrStr){
    	JSONObject obj = new JSONObject();
    	try {
    		String mailIdArr [] = mailidArrStr.split(",");
    		for(String mailid : mailIdArr){
    			Mail mail = mailService.findByid(Integer.valueOf(mailid));
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
    			Thread.sleep(Long.valueOf(SendMailHelper.getString("sendHZ")));
    		}
    		obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
        return obj.toString();
    }
}
