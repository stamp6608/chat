package com.qiqiim.webserver.user.service;

import com.qiqiim.webserver.user.model.UserAccountEntity;

import java.util.List;
import java.util.Map;

/**
 * 用户帐号
 * 
 * @author qiqiim
 * @email 1044053532@qq.com
 * @date 2017-11-27 09:38:52
 */
public interface UserAccountService {
	
	UserAccountEntity queryObject(Long id);
	
	UserAccountEntity queryObjectByAccount(Map<String, Object> map);
	
	UserAccountEntity validateUser(Map<String, Object> map);
	
	List<UserAccountEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(UserAccountEntity userAccount);
	
	int update(UserAccountEntity userAccount);
	
	int delete(Long id);
	
	int deleteBatch(Long[] ids);
}
