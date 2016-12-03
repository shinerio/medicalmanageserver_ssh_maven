package com.shinerio.service.impl;

import com.shinerio.dao.PatientDao;
import com.shinerio.domain.Patients;
import com.shinerio.service.PatientService;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by jstxzhangrui on 2016/12/3.
 */
@Component("patientService")
public class PatientServiceImpl implements PatientService {
    @Autowired
    public PatientDao patientDao;

    public PatientDao getPatientDao() {
        return patientDao;
    }

    public void setPatientDao(PatientDao patientDao) {
        this.patientDao = patientDao;
    }

    @Override
    public boolean regist(Patients patient) {
        return false;
    }

    @Override
    public boolean deletePatient(Patients patient) {
        return false;
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    @Override
    public Patients login(String username, String password) {
        Patients patient = patientDao.getPatientByUsername(username);
        if(patient!=null){
            if(password!=null&&password.equals(patient.getPassword()))
                return patient;
        }
        return null;
    }
}
