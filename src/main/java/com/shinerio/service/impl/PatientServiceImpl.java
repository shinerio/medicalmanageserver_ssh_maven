package com.shinerio.service.impl;

import com.shinerio.dao.PatientDao;
import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patient;
import com.shinerio.domain.Rawdata;
import com.shinerio.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    @Override
    public List<Evaluation_info> getEvaluation_infoById(int id) {
        return patientDao.getEvaluation_infoById(id);
    }
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    @Override
    public List<Rawdata> getRawDataByEvaid(int id) {
      return   patientDao.getRowDataByEvaid(id);
    }

    @Override
    public boolean regist(Patient patient) {
        return false;
    }

    @Override
    public boolean deletePatient(Patient patient) {
        return false;
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)   //设置只读
    @Override
    public Patient login(String username, String password) {
        Patient patient = patientDao.getPatientByUsername(username);
        if(patient!=null){
            if(password!=null&&password.equals(patient.getPassword()))
                return patient;
        }
        return null;
    }
}
