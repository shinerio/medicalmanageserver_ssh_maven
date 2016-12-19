package com.shinerio.domain;

import org.hibernate.annotations.GeneratorType;

import javax.persistence.*;

/**
 * Created by jstxzhangrui on 2016/12/16.
 */
@Entity
@Table(name="DOCTOR_INFO")
public class Doctor_info {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @OneToOne
    @JoinColumn(name = "doctor_id",unique = true)
    private Doctors doctor;
    private int age;
    private String major;
    private int workingHours;
    private String emailAddress;
    private long phoneNum;
    private String address;
    private String department;
    private String workExperience;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Doctors getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctors doctor) {
        this.doctor = doctor;
    }
    @Column(name="age")
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    @Column(name="workinghours")
    public int getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(int workingHours) {
        this.workingHours = workingHours;
    }
    @Column(name="major")
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
    @Column(name="phonenum")
    public long getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(long phoneNum) {
        this.phoneNum = phoneNum;
    }
    @Column(name="emailAddress")
    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    @Column(name="department")
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    @Column(name="workexperience")
    public String getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(String workingExperience) {
        this.workExperience = workingExperience;
    }
    @Column(name="address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
