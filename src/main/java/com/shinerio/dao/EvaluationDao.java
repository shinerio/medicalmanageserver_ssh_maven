package com.shinerio.dao;

import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patient;
import com.shinerio.domain.Rawdata;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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

    public Session getCurrentSession(){
        return sessionFactory.getCurrentSession();
    }

    public void saveEvaluation_info_dao(Evaluation_info evaluation_info){
        Session session = getCurrentSession();
        try {
            session.save(evaluation_info);
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public void saveRawdata(Rawdata rawdata){
        Session session = getCurrentSession();
        try {
            session.save(rawdata);
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public Evaluation_info getEvaluation_info(int id){
        Session session = getCurrentSession();
        String hql = "select s from Evaluation_info s where s.id = :id";
        Evaluation_info evaluation_info = new Evaluation_info();
        evaluation_info.setId(id);
        try {
            List<Evaluation_info> list =
                    session.createQuery(hql).setProperties(evaluation_info).list();
            if(list.size()>0){return list.get(0);}
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }

}
