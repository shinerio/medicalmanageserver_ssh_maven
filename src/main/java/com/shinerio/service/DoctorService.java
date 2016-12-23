package com.shinerio.service;

import com.shinerio.domain.Department;
import com.shinerio.domain.Doctor;

/**
 * Created by jstxzhangrui on 2016/11/30.
 */
public interface DoctorService {
    public Doctor login(String username, String password);
    public void addDoctor(Doctor doctor);
    public void deleteDoctor(Doctor doctor);
    public Doctor getDoctor(String username);
    public Department getDepartment(String username);
}
