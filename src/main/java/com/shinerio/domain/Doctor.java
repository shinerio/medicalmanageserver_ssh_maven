package com.shinerio.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jstxzhangrui on 2016/12/22.
 */
@Entity
@Table(name="doctor")
public class Doctor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="username",unique = true)
    private String username;
    @Column(name="password")
    private String password;
    @Column(name="realname")
    private String realname;
    @ManyToOne
    @JoinColumn(name="department_id")
    private Department department;
    @Column(name="age")
    private int age;
    @Column(name="telenum")
    private long telenum;
    @Column(name="emailaddress")
    private String emailaddress;
    @Column(name="houseaddress")
    private String houseaddress;
    @Column(name="workexperience")
    private String workexperience;
    @Column(name="workingtime")
    private int workingtime;
    @Column(name="major")
    private String major;
    @Column(name="officeaddress")
    private String officeaddress;
    @Column(name="gender")
    private int gender;
    @OneToMany(mappedBy = "doctor")
    private List<Patient> patientList = new ArrayList<>();

    public Doctor() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Patient> getPatientList() {
        return patientList;
    }

    public void setPatientList(List<Patient> patientList) {
        this.patientList = patientList;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getOfficeaddress() {
        return officeaddress;
    }

    public void setOfficeaddress(String officeaddress) {
        this.officeaddress = officeaddress;
    }

    public int getWorkingtime() {
        return workingtime;
    }

    public void setWorkingtime(int workingtime) {
        this.workingtime = workingtime;
    }

    public String getWorkexperience() {
        return workexperience;
    }

    public void setWorkexperience(String workexperience) {
        this.workexperience = workexperience;
    }

    public String getHouseaddress() {
        return houseaddress;
    }

    public void setHouseaddress(String houseaddress) {
        this.houseaddress = houseaddress;
    }

    public long getTelenum() {
        return telenum;
    }

    public void setTelenum(long telenum) {
        this.telenum = telenum;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
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

    public String getEmailaddress() {
        return emailaddress;
    }

    public void setEmailaddress(String emailaddress) {
        this.emailaddress = emailaddress;
    }

    public Doctor(String username, int gender, String officeaddress, String major, int workingtime, String houseaddress, String workexperience, String emailaddress, long telenum, int age, Department department, String realname, String password) {
        this.username = username;
        this.gender = gender;
        this.officeaddress = officeaddress;
        this.major = major;
        this.workingtime = workingtime;
        this.houseaddress = houseaddress;
        this.workexperience = workexperience;
        this.emailaddress = emailaddress;
        this.telenum = telenum;
        this.age = age;
        this.department = department;
        this.realname = realname;
        this.password = password;

    }
}
