package com.shinerio.dao;

import com.shinerio.domain.Department;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.List;

/**
 * Created by jstxzhangrui on 2016/12/22.
 */
@Component("departmentDao")
public class DepartmentDao {
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
    public Department getDepartmentByName(String name){
        Session session = getCurrentSession();
        String hql = "select s from Department s where s.name = :name";
        Department department = new Department();
        department.setName(name);
        try {
            List<Department> list =
                    session.createQuery(hql).setProperties(department).list();
            if(list.size()>0){return list.get(0);}
            return null;
        } catch (RuntimeException re) {
            throw re;
        }
    }
}
