package com.bcsd.service;

import com.bcsd.entity.MeetUser;
import com.bcsd.entity.UserInternal;

import java.util.List;
import java.util.Map;

/**
 * @author HOEP
 * @data 2019/4/24
 */
public interface MeetUserService {
	List<Map<String, String>> findAll(Integer page, Integer size, String username);

	void add(MeetUser meetUser);

	Map<String, String> findById(Integer Id);

	void update(MeetUser meetUser);

	void delete(Integer id);

	List<UserInternal> findInternal(Integer page, Integer size, String internal, String name);

	Map<String, Object> findInternalJSON(Integer page, Integer size, String internal, String name);

	void addInternal(UserInternal internal);

	void deleteInternal(Integer id);

	void deleteInternal(Integer[] ids);

	UserInternal findOne(Integer id);

	void updateLinkman(UserInternal userInternal);

    List<Map<String ,String>> findDept();
}
