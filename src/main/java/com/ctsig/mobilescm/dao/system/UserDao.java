package com.ctsig.mobilescm.dao.system;


import com.ctsig.mobilescm.domain.system.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserDao {

    /**
     * 登录时根据用户名和密码查询用户
     *
     * @param param
     * @return
     */
    User login(@Param("param") Map<String, Object> param);


    List<User> getUserList(@Param("param") Map<String, Object> param);

    void addUser(@Param("user") User user);

    void addUserRole(@Param("param") Map<String, Object> param);

    void deleteUserRole(@Param("userId") String userId);

    void editUser(@Param("user") User user);

    void deleteUser(@Param("userId") String userId);


}
