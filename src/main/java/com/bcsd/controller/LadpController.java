package com.bcsd.controller;

import com.bcsd.entity.ResponseData;
import com.bcsd.service.LdapService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.AttributesMapper;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.*;
import java.util.*;

@Controller
@RequestMapping("/ldap")
public class LadpController {

    @Autowired
    private LdapService ldapService;


//    @Autowired
//    private LdapTemplate ldapTemplate;


    @RequestMapping("/getUser")
    @ResponseBody
    public ResponseData getUser(Integer page,Integer size,String name){
        page=1;
        size=1;
        if (name==""||name==null){
            name="*";
        }
        List<Map<String, String>> list = null;
        try {
            list = ldapService.getUser(page,size,name);
            PageInfo pageInfo=new PageInfo(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ResponseData data = new ResponseData(list.size(),0,"",list);
        return data;
    }


    @RequestMapping("/queryUser")
    @ResponseBody
    public ResponseData queryUser(String name){
        Map<String, String> map = null;
        try {
            map = ldapService.queryUser(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ResponseData data = new ResponseData(map.size(),0,"",map);
        return data;
    }





    @RequestMapping("/test")
    @ResponseBody
    public void Method(){
        Hashtable env = new Hashtable();
        String adminName = "zhangsan@lin.com";
        String adminPassword = "Zhang123";
        String searchBase = "OU=Users Org Chart,DC=lin,DC=com";
        String searchFilter = "(&(objectClass=user)(name=*))";
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");

        //set security credentials, note using simple cleartext authentication
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        env.put(Context.SECURITY_PRINCIPAL, adminName);
        env.put(Context.SECURITY_CREDENTIALS, adminPassword);
        env.put(Context.PROVIDER_URL, "ldap://192.168.139.130:389");
        try {
            LdapContext ctx = new InitialLdapContext(env, null);
            SearchControls searchCtls = new SearchControls();
            String returnedAtts[] = {
                    "url", "whenChanged", "employeeID", "name", "userPrincipalName",
                    "physicalDeliveryOfficeName", "departmentNumber", "telephoneNumber",
                    "homePhone", "mobile", "department", "sAMAccountName", "whenChanged",
                    "mail"}; //定制返回属性
            searchCtls.setReturningAttributes(returnedAtts);
            searchCtls.setSearchScope(SearchControls.SUBTREE_SCOPE);

            int pageSize = 1;

            byte[] cookie = null;

            Control[] ctls = new Control[]{new PagedResultsControl(pageSize, Control.CRITICAL)};

            ctx.setRequestControls(ctls);

            int totalResults = 0;

            do {
                NamingEnumeration results = ctx.search(searchBase,
                        searchFilter, searchCtls);

                while (results != null && results.hasMoreElements()) {

                    SearchResult sr = (SearchResult) results.next();

                    System.out.println("name: " + sr.getName());

                    totalResults++;

                }

                cookie = parseControls(ctx.getResponseControls());

                ctx.setRequestControls(new Control[]{new
                        PagedResultsControl(pageSize
                        , cookie, Control.CRITICAL)});


            } while ((cookie != null) && (cookie.length != 0));

            ctx.close();
            System.out.println("Total entries: " + totalResults);
        } catch (NamingException e) {
            System.err.println("Paged Search failed." + e);
        } catch (java.io.IOException e) {
            System.err.println("Paged Search failed." + e);
        }
    }



    static byte[] parseControls(Control[] controls) throws NamingException {
        byte[] cookie = null;
        if (controls != null) {
            for (int i = 0; i < controls.length; i++) {
                if (controls[i] instanceof PagedResultsResponseControl) {
                    PagedResultsResponseControl prrc =
                            (PagedResultsResponseControl) controls[i];
                    cookie = prrc.getCookie();
                    System.out.println(">>Next Page \n");
                }
            }
        }
        return (cookie == null) ? new byte[0] : cookie;
    }


}
