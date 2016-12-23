package com.shinerio.dao;

import com.shinerio.domain.Doctor;
import com.shinerio.domain.Patient;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

    public void saveDoctor(Doctor doctor){
        Session session = getCurrentSession();
        try {
            session.save(doctor);
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public Doctor getDoctorByID(int id){
        Session session = getCurrentSession();
        try {
            Doctor instance = (Doctor) session.get(
                    "com.shinerio.domain.Doctor", id);
            return instance;
        } catch (RuntimeException re) {
            throw re;
        }
    }
    public Doctor getDoctorByUsername(String username){
        Session session = getCurrentSession();
        String hql = "select s from Doctor s where s.username = :username";
        Doctor doctor = new Doctor();
        doctor.setUsername(username);
        try {
            List<Doctor> list =
                    session.createQuery(hql).setProperties(doctor).list();
            if(list.size()>0){return list.get(0);}
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }
    public List<Patient> getPatients(Doctor doctor){
        Session session = getCurrentSession();
        try {
            Doctor instance = (Doctor) session.get(
                    "com.shinerio.domain.Doctor", doctor.getId());
            if(instance!=null) {
                Hibernate.initialize(instance.getPatientList());  //这句很重要，否则会出现延迟加载异常
                return instance.getPatientList();
            }
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }
}
