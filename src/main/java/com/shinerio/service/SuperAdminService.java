package com.shinerio.service;

import com.shinerio.dao.SuperAdminDao;
import com.shinerio.domain.Doctor_info;
import com.shinerio.domain.Doctors;
import com.shinerio.domain.SuperAdmin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jstxzhangrui on 2016/12/19.
 */

public interface SuperAdminService {
    public SuperAdmin login(String userName,String passWord);
    public ArrayList<Object[]> doctorList(int startNum, int length, Map<String,Object> map);
}
