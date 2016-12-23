package com.shinerio.service.impl;

import com.shinerio.dao.DoctorDao;
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

    public DoctorDao getDoctorDao() {
        return doctorDao;
    }

    public void setDoctorDao(DoctorDao doctorDao) {
        this.doctorDao = doctorDao;
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

    @Override
    public void addDoctor(Doctor doctor) {

    }

    @Override
    public void deleteDoctor(Doctor doctor) {

    }

    @Override
    public Doctor getDoctor(String username) {
        return doctorDao.getDoctorByUsername(username);
    }
}
