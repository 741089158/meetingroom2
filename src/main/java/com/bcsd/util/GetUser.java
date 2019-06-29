package com.bcsd.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.bcsd.entity.User;

public class GetUser {

	public static User current() {
		User newUser = new User();
		newUser.setName("李四");
		newUser.setUsername("admin");
		return newUser;
	}

	public HttpSession getSession() {
		ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attrs.getRequest();
		HttpSession session = request.getSession();
		return session;
	}
}
