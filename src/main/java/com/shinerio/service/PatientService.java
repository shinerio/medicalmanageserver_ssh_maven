package com.shinerio.service;

import com.shinerio.domain.Patients;

/**
 * Created by jstxzhangrui on 2016/12/3.
 */
public interface PatientService {
    public boolean regist(Patients patient);
    public boolean deletePatient(Patients patient);
    public Patients login(String username,String passwords);
}
