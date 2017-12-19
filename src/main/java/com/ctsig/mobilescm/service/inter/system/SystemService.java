package com.ctsig.mobilescm.service.inter.system;

import com.ctsig.mobilescm.domain.system.User;

import java.util.List;
import java.util.Map;
import java.util.Set;


public interface SystemService {

    /**
     * 根据用户名和密码查询用户
     *
     * @param param
     * @return
     */
    User login(Map<String, Object> param);

    Set<String> getUserActionSet(List<String> roleIdList);

}
