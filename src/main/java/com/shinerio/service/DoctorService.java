package com.shinerio.service;

import com.shinerio.domain.Doctors;

/**
 * Created by jstxzhangrui on 2016/11/30.
 */
public interface DoctorService {
    public Doctors login(String username, String password);
    public void addDoctor(Doctors doctor);
    public void deleteDoctor(Doctors doctor);
}
