package com.shinerio.service;

import com.shinerio.domain.Administrator;
import com.shinerio.domain.Doctor;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created by jstxzhangrui on 2016/12/19.
 */

public interface AdministratorService {
    public Administrator login(String userName, String passWord);
    public ArrayList<Doctor> doctorList(int startNum, int length, Map<String,Object> map);
}
