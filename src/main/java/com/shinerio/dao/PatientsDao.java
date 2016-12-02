package com.shinerio.dao;

import com.shinerio.domain.Patients;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by jstxzhangrui on 2016/11/26.
 */
@Component("patientDao")
public class PatientsDao {
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
    @Transactional(readOnly = true,propagation = Propagation.REQUIRED)
    public Patients getPatientByID(int id){
        Session session = getCurrentSession();
        try {
            Patients instance = (Patients) session.get(
                    "com.shinerio.domain.Patients", id);
            return instance;
        } catch (RuntimeException re) {
            throw re;
        }
    }
    @Transactional(propagation = Propagation.REQUIRED)
    public void  savePatient(Patients patient){
        Session session = getCurrentSession();
        try {
            session.save(patient);
        } catch (RuntimeException re) {
            throw re;
        }
    }

}
