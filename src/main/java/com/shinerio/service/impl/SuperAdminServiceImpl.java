package com.shinerio.service.impl;

import com.shinerio.dao.SuperAdminDao;
import com.shinerio.domain.Doctor_info;
import com.shinerio.domain.Doctors;
import com.shinerio.domain.SuperAdmin;
import com.shinerio.service.SuperAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jstxzhangrui on 2016/12/19.
 */
@Component("superAdminService")
public class SuperAdminServiceImpl implements SuperAdminService {
    @Autowired
    private SuperAdminDao superAdminDao;

    public SuperAdminDao getSuperAdminDao() {
        return superAdminDao;
    }

    public void setSuperAdminDao(SuperAdminDao superAdminDao) {
        this.superAdminDao = superAdminDao;
    }


    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    @Override
    public SuperAdmin login(String userName, String passWord) {
        SuperAdmin temp = superAdminDao.getSuperAdminByUserName(userName);
        if(temp!=null&&temp.getPassWord().equals(passWord))
        return temp;
        return null;
    }
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    @Override
    public ArrayList<Object[]> doctorList(int startNum, int length, Map<String,Object> map) {
        return superAdminDao.listDoctor(startNum,length,map);
    }
}
