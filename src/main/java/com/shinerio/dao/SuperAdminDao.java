package com.shinerio.dao;

import com.shinerio.domain.Doctor_info;
import com.shinerio.domain.Doctors;
import com.shinerio.domain.SuperAdmin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.ManagedList;
import org.springframework.stereotype.Component;
import java.util.*;

/**
 * Created by jstxzhangrui on 2016/12/19.
 */
@Component("superAdminDao")
public class SuperAdminDao {
    @Autowired
    public SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getCurrentSession() {
       return sessionFactory.getCurrentSession();
    }

    public SuperAdmin getSuperAdminByUserName(String username){
        Session session = getCurrentSession();
        String hql = "select s from SuperAdmin s where s.userName = :userName";
        SuperAdmin superAdmin = new SuperAdmin();
        superAdmin.setUserName(username);
        try {
            List<SuperAdmin> list =
                    session.createQuery(hql).setProperties(superAdmin).list();
            if(list.size()>0){return list.get(0);}
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public ArrayList<Object[]>  listDoctor(int startNum,int length,Map<String,Object> map){
        Session session = getCurrentSession();
        ArrayList<Object[]> results = new ManagedList<>();
        String hql = "select a,b from Doctors a,Doctor_info b where a.id=b.doctor.id";
        if(map.get("department")!=null){
            hql+= " and b.department = :department";
        }
        if(map.get("realname")!=null){
            hql+=" and a.realname like:realname";
        }
        ArrayList<Object[]> list = (ArrayList<Object[]>) session.createQuery(hql).setProperties(map).setFirstResult(startNum).setMaxResults(length).list();
        return list;
    }
}
