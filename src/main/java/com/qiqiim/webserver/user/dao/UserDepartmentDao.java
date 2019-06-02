package com.qiqiim.webserver.user.dao;
import java.util.List;

import com.qiqiim.webserver.base.dao.BaseDao;
import com.qiqiim.webserver.user.model.ImFriendUserData;
import com.qiqiim.webserver.user.model.UserDepartmentEntity;

/**
 * 部门
 * 
 * @author qiqiim
 * @email 1044053532@qq.com
 * @date 2017-11-27 09:38:52
 */
public interface UserDepartmentDao extends BaseDao<UserDepartmentEntity> {
	
	public List<ImFriendUserData> queryGroupAndUser(); 
}
