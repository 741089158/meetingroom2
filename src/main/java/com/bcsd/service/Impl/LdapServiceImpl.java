package com.bcsd.service.Impl;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcsd.controller.LadpController;
import com.bcsd.service.LdapService;

@Service
public class LdapServiceImpl implements LdapService {

	private static final Logger LOGGER = LoggerFactory.getLogger(LadpController.class);

	// private static String LDAP_URL = "LDAP://172.20.10.3:389"; //LDAP访问地址
	private static String LDAP_URL = "LDAP://192.168.139.130:389"; // LDAP访问地址
	private static String adminName = "zhangsan@lin.com";// username@domain
	private static String adminPassword = "Zhang123";// password
	// private static String searchFilter = "(&(objectClass=User)(name=zhangsan))";
	// //specify the LDAP search filter
//    private static String searchBase = "OU=北辰时代,DC=lin,DC=com"; //Specify the Base for the search//搜索域节点

	@Override
	public List<Map<String, String>> getUser(Integer page, Integer size, String name) {
		Hashtable HashEnv = new Hashtable();
		HashEnv.put(Context.SECURITY_AUTHENTICATION, "simple"); // LDAP访问安全级别
		HashEnv.put(Context.SECURITY_PRINCIPAL, adminName); // AD User
		HashEnv.put(Context.SECURITY_CREDENTIALS, adminPassword); // AD Password
		HashEnv.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory"); // LDAP工厂类
		HashEnv.put(Context.PROVIDER_URL, LDAP_URL);
		List<Map<String, String>> allData = new ArrayList<Map<String, String>>();
		try {
			LdapContext ctx = new InitialLdapContext(HashEnv, null);
			SearchControls searchCtls = new SearchControls(); // Create the search controls
			searchCtls.setSearchScope(SearchControls.SUBTREE_SCOPE); // Specify the search scope
			String searchFilter = "(&(objectClass=User)(name=" + name + "))";
			String searchBase = "OU=Users Org Chart,DC=lin,DC=com";
			String returnedAtts[] = { "url", "whenChanged", "employeeID", "name", "userPrincipalName", "physicalDeliveryOfficeName", "departmentNumber", "telephoneNumber", "homePhone", "mobile", "department", "sAMAccountName", "whenChanged", "mail" }; // 定制返回属性
			searchCtls.setReturningAttributes(returnedAtts); // 设置返回属性集
			NamingEnumeration answer = ctx.search(searchBase, searchFilter, searchCtls);
			while (answer.hasMoreElements()) {
				SearchResult sr = (SearchResult) answer.next();
				Attributes Attrs = sr.getAttributes();
				if (Attrs != null) {
					Map map = new HashMap();
					try {
						for (NamingEnumeration ne = Attrs.getAll(); ne.hasMore();) {
							Attribute Attr = (Attribute) ne.next();
							// 读取属性值
							Enumeration values = Attr.getAll();
							if (values != null) { // 迭代
								while (values.hasMoreElements()) {
									map.put(Attr.getID().toString(), values.nextElement());
								}
							}
						}
						map.put("maxPerson", "10");
						map.put("status", "1");
						allData.add(map);
					} catch (NamingException e) {
						System.err.println("Throw Exception : " + e);
					}
				}
			}
			ctx.close();
		} catch (NamingException e) {
			e.printStackTrace();
			System.err.println("Throw Exception : " + e);
		}

		return allData;
	}
	
	// 分页操作
	public List<Map<String, String>> doPage(Integer page, Integer size, List<Map<String, String>> allData) {
		page = (page == null || page < 1) ? 1 : page; // 校验页码
		size = (size == null || size < 1) ? 10 : size; // 校验分页大小
		int skip = (page - 1) * size; // 获取开始下标
		if (allData == null || allData.size() == 0 || allData.size() < skip) {
			return new ArrayList<>(); // 数据不足时返回空集合
		}
		int exp = skip + size; // 期望结束下标
		int eIndex = exp > allData.size() ? allData.size() : exp; // 实际结束下标
		List<Map<String, String>> thePageData = allData.subList(skip, eIndex);
		return thePageData;
	}

	@Override
	public Map<String, String> queryUser(String name) {
		Hashtable HashEnv = new Hashtable();
		HashEnv.put(Context.SECURITY_AUTHENTICATION, "simple"); // LDAP访问安全级别
		HashEnv.put(Context.SECURITY_PRINCIPAL, adminName); // AD User
		HashEnv.put(Context.SECURITY_CREDENTIALS, adminPassword); // AD Password
		HashEnv.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory"); // LDAP工厂类
		HashEnv.put(Context.PROVIDER_URL, LDAP_URL);
		Map map = new HashMap();
		try {
			LdapContext ctx = new InitialLdapContext(HashEnv, null);
			SearchControls searchCtls = new SearchControls(); // Create the search controls
			searchCtls.setSearchScope(SearchControls.SUBTREE_SCOPE); // Specify the search scope
			String searchFilter = "(&(objectClass=User)(name=" + name + "))";
			String searchBase = "OU=Users Org Chart,DC=lin,DC=com";
			String returnedAtts[] = { "url", "name", "physicalDeliveryOfficeName", "telephoneNumber", "homePhone", "mobile", "department", "sAMAccountName", "mail" }; // 定制返回属性
			searchCtls.setReturningAttributes(returnedAtts); // 设置返回属性集
			NamingEnumeration answer = ctx.search(searchBase, searchFilter, searchCtls);
			while (answer.hasMoreElements()) {
				SearchResult sr = (SearchResult) answer.next();
				Attributes Attrs = sr.getAttributes();
				if (Attrs != null) {

					try {
						for (NamingEnumeration ne = Attrs.getAll(); ne.hasMore();) {
							Attribute Attr = (Attribute) ne.next();
							// 读取属性值
							Enumeration values = Attr.getAll();
							if (values != null) { // 迭代
								while (values.hasMoreElements()) {
									map.put(Attr.getID().toString(), values.nextElement());
								}
							}
						}
						map.put("maxPerson", "10");
						map.put("status", "1");
					} catch (NamingException e) {
						System.err.println("Throw Exception : " + e);
					}
				}
			}
			ctx.close();
		} catch (NamingException e) {
			e.printStackTrace();
			System.err.println("Throw Exception : " + e);
		}
		return map;
	}

	/*
	 * public static void main(String args[]) { Hashtable HashEnv = new Hashtable();
	 * HashEnv.put(Context.SECURITY_AUTHENTICATION, "simple"); //LDAP访问安全级别
	 * HashEnv.put(Context.SECURITY_PRINCIPAL, adminName); //AD User
	 * HashEnv.put(Context.SECURITY_CREDENTIALS, adminPassword); //AD Password
	 * HashEnv.put(Context.INITIAL_CONTEXT_FACTORY,
	 * "com.sun.jndi.ldap.LdapCtxFactory"); //LDAP工厂类
	 * HashEnv.put(Context.PROVIDER_URL, LDAP_URL); List<Map<String,String>>
	 * list=new ArrayList<Map<String,String>>(); try { LdapContext ctx = new
	 * InitialLdapContext(HashEnv, null); SearchControls searchCtls = new
	 * SearchControls(); searchCtls.setSearchScope(SearchControls.SUBTREE_SCOPE);
	 * String searchFilter = "(&(objectClass=User)(name=张三))"; String searchBase =
	 * "OU=北辰时代,DC=lin,DC=com"; //Specify the Base for the search//搜索域节点 int
	 * totalResults = 0;
	 * 
	 * String returnedAtts[] = { "url", "whenChanged", "employeeID", "name",
	 * "userPrincipalName", "physicalDeliveryOfficeName", "departmentNumber",
	 * "telephoneNumber", "homePhone", "mobile", "department", "sAMAccountName",
	 * "whenChanged", "mail"}; //定制返回属性
	 * 
	 * searchCtls.setReturningAttributes(returnedAtts); //设置返回属性集
	 * 
	 * NamingEnumeration answer = ctx.search(searchBase, searchFilter,searchCtls);
	 * 
	 * while (answer.hasMoreElements()) { SearchResult sr = (SearchResult)
	 * answer.next();
	 * System.out.println("************************************************");
	 * System.out.println(sr.getName());
	 * 
	 * Attributes Attrs = sr.getAttributes(); if (Attrs != null) { Map map=new
	 * HashMap(); try { for (NamingEnumeration ne = Attrs.getAll(); ne.hasMore(); )
	 * { Attribute Attr = (Attribute) ne.next();
	 * //System.out.println(" AttributeID=" + Attr.getID().toString()); //读取属性值
	 *//*
		 * for (NamingEnumeration e = Attr.getAll(); e.hasMore();totalResults++) {
		 * System.out.println("    AttributeValues=" + e.next().toString()); }
		 * System.out.println("    ---------------");
		 *//*
			 * //读取属性值 Enumeration values = Attr.getAll(); if (values != null) { // 迭代 while
			 * (values.hasMoreElements()) {
			 * map.put(Attr.getID().toString(),values.nextElement());
			 * //System.out.println(Attr.getID().toString()+"----"+ values.nextElement());
			 * //System.out.println("    AttributeValues=" + values.nextElement()); } } }
			 * list.add(map); } catch (NamingException e) {
			 * System.err.println("Throw Exception : " + e); } } }
			 * System.out.println("Number: " + totalResults); ctx.close(); }
			 * 
			 * catch (NamingException e) { e.printStackTrace();
			 * System.err.println("Throw Exception : " + e); } System.out.println(list); }
			 */

}
