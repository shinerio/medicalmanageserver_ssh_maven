package com.shinerio.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jstxzhangrui on 2016/12/22.
 */
@Entity
@Table(name="patient")
public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="username")
    private String username;
    @Column(name="password")
    private String password;
    @Column(name="realname")
    private String realname;
    @ManyToOne
    @JoinColumn(name="doctor_id")
    private Doctor doctor;
    @Column(name="age")
    private int age;
    @Column(name = "gender")
    private int gender;
    @Column(name="disease")
    private String disease;
    @Column(name="telenum")
    private long telenum;
    @Column(name="ward")
    private String ward;
    @Column(name="houseaddress")
    private String houseaddress;
    @OneToMany(mappedBy = "patient")
    private List<Evaluation_info> evaluation_infoList = new ArrayList<>();

    public Patient() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public List<Evaluation_info> getEvaluation_infoList() {
        return evaluation_infoList;
    }

    public void setEvaluation_infoList(List<Evaluation_info> evaluation_infoList) {
        this.evaluation_infoList = evaluation_infoList;
    }

    public String getHouseaddress() {
        return houseaddress;
    }

    public void setHouseaddress(String houseaddress) {
        this.houseaddress = houseaddress;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public long getTelenum() {
        return telenum;
    }

    public void setTelenum(long telenum) {
        this.telenum = telenum;
    }
}
