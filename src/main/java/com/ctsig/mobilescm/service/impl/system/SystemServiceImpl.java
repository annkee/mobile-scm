package com.ctsig.mobilescm.service.impl.system;

import com.ctsig.mobilescm.dao.system.RoleDao;
import com.ctsig.mobilescm.dao.system.UserDao;
import com.ctsig.mobilescm.domain.system.User;
import com.ctsig.mobilescm.service.inter.system.SystemService;
import com.ctsig.mobilescm.tool.BaseTool;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class SystemServiceImpl implements SystemService {

    @Resource
    private UserDao userDao;

    @Resource
    private RoleDao roleDao;

    public User login(Map<String, Object> param) {
        List<User> userList = userDao.getUserList(param);
        if (BaseTool.isCollectionNotNull(userList)) {
            return userList.get(0);
        } else {
            return null;
        }
    }

    @Override
    public Set<String> getUserActionSet(List<String> roleIdList) {
        //使用set：检索速度更快
        Set<String> actionSet = roleDao.getUserActionList(roleIdList);

        return actionSet;
    }

}
