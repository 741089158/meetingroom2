package com.bcsd.service;

import java.util.List;
import java.util.Map;

public interface LdapService {

    List<Map<String,String>> getUser(Integer page,Integer size,String name);
    Map<String,String> queryUser(String name);
        }
