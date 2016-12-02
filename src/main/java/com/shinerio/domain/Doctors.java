package com.shinerio.domain;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by jstxzhangrui on 2016/11/29.
 */
@Entity
@Table(name="DOCTORS")
public class Doctors {
    private int id;
    private String realname;
    private String username;
    private String password;


    private Set<Patients> patientSet = new HashSet<Patients>();

    public Doctors() {
    }

    public Doctors(String realname,String username, String password) {
        this.realname = realname;
        this.username = username;
        this.password = password;
    }

    @OneToMany(mappedBy = "doctor")
    public Set<Patients> getPatientSet() {
        return patientSet;
    }

    public void setPatientSet(Set<Patients> patientSet) {
        this.patientSet = patientSet;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "username",nullable = false,unique = true)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "password",nullable = true,unique = false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name="realname")
    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    @Override
    public String toString() {
        return "编号："+id+" 医生用户名："+username;
    }
}
