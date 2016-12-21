package com.shinerio.domain;

import org.springframework.beans.factory.support.ManagedList;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jstxzhangrui on 2016/11/26.
 */
@Entity
@Table(name="PATIENTS")
public class Patients {

    private int id;
    private String username;
    private String realname;
    private String password;
    private Doctors doctor;
    private List<Evaluation_info> evaluation_info = new ArrayList<>();

    public Patients() {
    }

    public Patients(String realname,String username, String password,Doctors doctor ) {
        this.realname = realname;
        this.username = username;
        this.doctor = doctor;
        this.password = password;
    }

    @OneToMany(mappedBy = "patient")
    @OrderBy("id desc")
    public List<Evaluation_info> getEvaluation_info() {
        return evaluation_info;
    }

    public void setEvaluation_info(List<Evaluation_info> evaluation_info) {
        this.evaluation_info = evaluation_info;
    }


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
}
    @Column(name="username",nullable = true)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    @Column(name="password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @ManyToOne
    @JoinColumn(name="doctor_id")
    public Doctors getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctors doctor) {
        this.doctor = doctor;
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
        return "病人编号:"+id+" 用户名："+username;
    }
}
