package com.shinerio.service;

import com.shinerio.domain.Doctor_info;
import com.shinerio.domain.Doctors;

/**
 * Created by jstxzhangrui on 2016/11/30.
 */
public interface DoctorService {
    public Doctors login(String username, String password);
    public void addDoctor(Doctors doctor);
    public void deleteDoctor(Doctors doctor);
    public Doctor_info getDoctorInfo(int id);
}
