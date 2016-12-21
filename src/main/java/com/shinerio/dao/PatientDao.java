package com.shinerio.dao;

import com.shinerio.domain.Doctors;
import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patients;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by jstxzhangrui on 2016/11/26.
 */
@Component("patientDao")
public class PatientDao {
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
    public void  savePatient(Patients patient){
        Session session = getCurrentSession();
        try {
            session.save(patient);
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public Patients getPatientByUsername(String username){
        Session session = getCurrentSession();
        String hql = "select s from Patients s where s.username = :username";
        Patients patient = new Patients();
        patient.setUsername(username);
        try {
            List<Patients> list =
                    session.createQuery(hql).setProperties(patient).list();
            if(list.size()>0){return list.get(0);}
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public List<Evaluation_info> getEvaluation_infoById(int id) {
        Session session = getCurrentSession();
        try {
            Patients instance = (Patients) session.get(
                    "com.shinerio.domain.Patients", id);
            if (instance != null){
                Hibernate.initialize(instance.getEvaluation_info());  //这句很重要，否则会出现延迟加载异常
                return instance.getEvaluation_info();}
            return null;
        } catch (Exception re) {
            throw re;
        }
    }
}
