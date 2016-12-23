package com.shinerio.service.impl;

import com.shinerio.utils.StringUtils;
import com.shinerio.dao.AdministratorDao;
import com.shinerio.dao.DepartmentDao;
import com.shinerio.domain.Administrator;
import com.shinerio.domain.Department;
import com.shinerio.domain.Doctor;
import com.shinerio.service.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created by jstxzhangrui on 2016/12/19.
 */
@Component("administratorService")
public class AdministratorServiceImpl implements AdministratorService {
    @Autowired
    private AdministratorDao administratorDao;
    @Autowired
    private DepartmentDao departmentDao;
    public AdministratorDao getAdministratorDao() {
        return administratorDao;
    }

    public void setAdministratorDao(AdministratorDao administratorDao) {
        this.administratorDao = administratorDao;
    }

    public DepartmentDao getDepartmentDao() {
        return departmentDao;
    }

    public void setDepartmentDao(DepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    @Override
    public Administrator login(String username, String password) {
        Administrator temp = administratorDao.getAdministratorByUserName(username);
        if(temp!=null&&temp.getPassword().equals(password))
        return temp;
        return null;
    }
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    @Override
    public ArrayList<Doctor> doctorList(int startNum, int length, Map<String,Object> map) {
        if(!StringUtils.isEmpty((String)map.get("department"))){   //没有科室条件，EMPTY
            Department department = departmentDao.getDepartmentByName((String)map.get("department"));
            if(department!=null){
                map.remove("department");
                map.put("department",department);   //有科室，对象
            }else{
                map.remove("department");
                Department temp = new Department();
                temp.setId(-1);
                map.put("department",temp);  //-1,不存在
            }
        }
        return administratorDao.doctorList(startNum,length,map);
    }
}
