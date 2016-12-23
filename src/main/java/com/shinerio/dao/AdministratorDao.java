package com.shinerio.dao;

import com.shinerio.utils.StringUtils;
import com.shinerio.domain.Administrator;
import com.shinerio.domain.Department;
import com.shinerio.domain.Doctor;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.*;

/**
 * Created by jstxzhangrui on 2016/12/19.
 */
@Component("administratorDao")
public class AdministratorDao {
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

    public Administrator getAdministratorByUserName(String username){
        Session session = getCurrentSession();
        String hql = "select s from Administrator s where s.username = :username";
        Administrator Administrator = new Administrator();
        Administrator.setUsername(username);
        try {
            List<Administrator> list =
                    session.createQuery(hql).setProperties(Administrator).list();
            if(list.size()>0){return list.get(0);}
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }

    public ArrayList<Doctor> doctorList(int startNum, int length, Map<String,Object> map){
        Session session = getCurrentSession();
        Criteria criteria =session.createCriteria(Doctor.class);
        if(startNum>=0&&length>=0){
            criteria.setFirstResult(startNum).setMaxResults(length);
        }
        if(!StringUtils.isEmpty((String)map.get("username"))){
            criteria.add(Restrictions.eq("username",(String)map.get("username")));
        }
        if(!StringUtils.isEmpty((String)map.get("realname"))){
            criteria.add(Expression.like("realname","%"+(String)map.get("realname")+"%"));
        }
        if(map.get("department")!=null){
            if(((Department)map.get("department")).getId()<0)
                return null;
            criteria.add(Restrictions.eq("department",map.get("department")));
        }
        ArrayList<Doctor> doctorList = (ArrayList<Doctor>) criteria.list();
        return  doctorList;
    }
}
