package com.shinerio.service;

import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patient;

import java.util.List;

/**
 * Created by jstxzhangrui on 2016/12/3.
 */
public interface PatientService {
    public boolean regist(Patient patient);
    public boolean deletePatient(Patient patient);
    public Patient login(String username,String password);
    public List<Evaluation_info> getEvaluation_infoById(int id);
}
