package com.ctsig.mobilescm.dao.basic;

import com.ctsig.mobilescm.domain.basic.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 *
 */
public interface EmployeeDao {

    List<Employee> getEmployeeList(@Param("param") Map<String, Object> param);

    void deleteEmployee(@Param("employee") Employee employee);

    void addEmployee(@Param("employee") Employee employee);

    void editEmployee(@Param("employee") Employee employee);

}
