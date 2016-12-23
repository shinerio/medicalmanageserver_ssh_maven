package com.shinerio.service.impl;

import com.shinerio.dao.DepartmentDao;
import com.shinerio.dao.DoctorDao;
import com.shinerio.domain.Department;
import com.shinerio.domain.Doctor;
import com.shinerio.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.css.DocumentCSS;


/**
 * Created by jstxzhangrui on 2016/11/30.
 */
@Component("doctorService")
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private DoctorDao doctorDao;
    @Autowired
    private DepartmentDao departmentDao;
    public DoctorDao getDoctorDao() {
        return doctorDao;
    }

    public void setDoctorDao(DoctorDao doctorDao) {
        this.doctorDao = doctorDao;
    }

    public DepartmentDao getDepartmentDao() {
        return departmentDao;
    }

    public void setDepartmentDao(DepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    public Doctor login(String username , String password) {
        Doctor doctor = doctorDao.getDoctorByUsername(username);
        if(doctor!=null){
            if(password!=null&&password.equals(doctor.getPassword())) {
                return  doctor;
            }
        }
        return null;
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })//异常回滚
    @Override
    public void addDoctor(Doctor doctor) {
        doctorDao.saveDoctor(doctor);
    }

    @Override
    public void deleteDoctor(Doctor doctor) {

    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    @Override
    public Doctor getDoctor(String username) {
        return doctorDao.getDoctorByUsername(username);
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    public Department getDepartment(String username){
        return departmentDao.getDepartmentByName(username);
    }
}
