package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface DepartmentDao {

    Department getDepartment(@Param("department") Department department);

    List<Department> getDepartmentList(@Param("param") Map<String, Object> param);

    Department getDepartmentByUserId(@Param("userId") String userId);

    void addDepartment(@Param("department") Department department);

    void editDepartment(@Param("department") Department department);

    void deleteDepartment(@Param("department") Department department);

    void deleteDeptEmp(@Param("department") Department department);

}
