package com.shinerio.service.impl;

import com.shinerio.dao.DoctorDao;
import com.shinerio.domain.Doctors;
import com.shinerio.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


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
    public Doctors login(String username , String password) {
        Doctors doctor = doctorDao.getDoctorByUsername(username);
        if(doctor!=null){
            if(password!=null&&password.equals(doctor.getPassword())) {
                return  doctor;
            }
        }
        return null;
    }
    public void addDoctor(Doctors doctor) {

    }
    public void deleteDoctor(Doctors doctor) {

    }
}
