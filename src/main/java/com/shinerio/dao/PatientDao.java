package com.shinerio.dao;

import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patient;
import com.shinerio.domain.Rawdata;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
    public Patient getPatientByID(int id){
        Session session = getCurrentSession();
        try {
            Patient instance = (Patient) session.get(
                    "com.shinerio.domain.Patient", id);
            return instance;
        } catch (RuntimeException re) {
            throw re;
        }
    }
    public void  savePatient(Patient patient){
        Session session = getCurrentSession();
        try {
            session.save(patient);
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public Patient getPatientByUsername(String username){
        Session session = getCurrentSession();
        String hql = "select s from Patient s where s.username = :username";
        Patient patient = new Patient();
        patient.setUsername(username);
        try {
            List<Patient> list =
                    session.createQuery(hql).setProperties(patient).list();
            if(list.size()>0){return list.get(0);}
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public Patient getPatientById(int id){
        Session session = getCurrentSession();
        String hql = "select s from Patient s where s.id = :id";
        Patient patient = new Patient();
        patient.setId(id);
        try {
            List<Patient> list =
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
            Patient instance = (Patient) session.get(
                    "com.shinerio.domain.Patient", id);
            if (instance != null){
                Hibernate.initialize(instance.getEvaluation_infoList());  //这句很重要，否则会出现延迟加载异常
                return instance.getEvaluation_infoList();}
            return null;
        } catch (Exception re) {
            throw re;
        }
    }

    public List<Rawdata> getRowDataByEvaid(int id){
        Session session = getCurrentSession();
        try {
            Evaluation_info instance = (Evaluation_info) session.get(
                    "com.shinerio.domain.Evaluation_info", id);
            if (instance != null){
                Hibernate.initialize(instance.getRawdataList());  //这句很重要，否则会出现延迟加载异常
                return instance.getRawdataList();}
            return null;
        } catch (Exception re) {
            throw re;
        }
    }

}
