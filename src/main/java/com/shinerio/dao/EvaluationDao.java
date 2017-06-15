package com.shinerio.dao;

import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patient;
import com.shinerio.domain.Rawdata;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Random;

/**
 * Created by shinerio on 2017/6/9.
 */
@Component("evaluationDao")
public class EvaluationDao {
    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getCurrentSession() {
        Session session;
        try {
            session = sessionFactory.getCurrentSession();
        } catch (HibernateException e) {
            session = sessionFactory.openSession();
        }
        return session;
    }

    public void saveEvaluation_info_dao(Evaluation_info evaluation_info) {
        Session session = getCurrentSession();
        try {
            session.save(evaluation_info);
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public void saveRawdata(Rawdata rawdata) {
        Session session = getCurrentSession();
        try {
            session.save(rawdata);
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public Evaluation_info getEvaluation_info(int id) {
        Session session = getCurrentSession();
        String hql = "select s from Evaluation_info s where s.id = :id";
        Evaluation_info evaluation_info = new Evaluation_info();
        evaluation_info.setId(id);
        try {
            List<Evaluation_info> list =
                    session.createQuery(hql).setProperties(evaluation_info).list();
            if (list.size() > 0) {
                return list.get(0);
            }
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public int getEvaluationId(int userId, long startTime) {
        Session session = getCurrentSession();
        String hql = "select s from Evaluation_info s where s.patient.id=:userId and s.start_time=:startTime";
        // Evaluation_info evaluation_info = new Evaluation_info();
        // Patient patient = new Patient();
        // patient.setId(userId);
        // evaluation_info.setPatient(patient);
        // evaluation_info.setStart_time(startTime);
        Query query = session.createQuery(hql);
        query.setParameter("userId", userId);
        query.setParameter("startTime", startTime);
        try {
            List<Evaluation_info> list = query.list();
            if (list.size() > 0) {
                return list.get(0).getId();
            }
            return -1;
        } catch (RuntimeException re) {
            throw re;
        }
    }

}
