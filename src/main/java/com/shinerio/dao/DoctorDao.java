package com.shinerio.dao;

import com.shinerio.domain.Doctors;
import com.shinerio.domain.Patients;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.Query;
import java.util.List;
import java.util.Set;

/**
 * Created by jstxzhangrui on 2016/11/29.
 */
@Component("doctorDao")
public class DoctorDao {
    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getCurrentSession(){
        return sessionFactory.getCurrentSession();
    }

    public void saveDoctor(Doctors doctor){
        Session session = getCurrentSession();
        try {
            session.save(doctor);
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public Doctors getDoctorByID(int id){
        Session session = getCurrentSession();
        try {
            Doctors instance = (Doctors) session.get(
                    "com.shinerio.domain.Doctors", id);
            return instance;
        } catch (RuntimeException re) {
            throw re;
        }
    }
    public Doctors getDoctorByUsername(String username){
        Session session = getCurrentSession();
        String hql = "select s from Doctors s where s.username = :username";
        Doctors doctor = new Doctors();
        doctor.setUsername(username);
        try {
            List<Doctors> list =
                    session.createQuery(hql).setProperties(doctor).list();
            if(list.size()>0){return list.get(0);}
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }
    public Set<Patients> getPatients(Doctors doctor){
        Session session = getCurrentSession();
        try {
            Doctors instance = (Doctors) session.get(
                    "com.shinerio.domain.Doctors", doctor.getId());
            Hibernate.initialize(instance.getPatientSet());  //这句很重要，否则会出现延迟加载异常
            return instance.getPatientSet();
        } catch (RuntimeException re) {
            throw re;
        }
    }
}
