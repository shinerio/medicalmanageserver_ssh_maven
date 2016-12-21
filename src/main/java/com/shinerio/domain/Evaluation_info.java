package com.shinerio.domain;

import javax.persistence.*;

/**
 * Created by jstxzhangrui on 2016/12/21.
 */
@Entity
@Table(name="EVALUATION_INFO")
public class Evaluation_info {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name="uid")
    private Patients patient;
    @Column(name="start_time")
    private long start_time;
    @Column(name="end_time")
    private long end_time;
    @Column(name="success_ratio")
    private int success_ratio;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getEnd_time() {
        return end_time;
    }

    public void setEnd_time(long end_time) {
        this.end_time = end_time;
    }

    public long getStart_time() {
        return start_time;
    }

    public void setStart_time(long start_time) {
        this.start_time = start_time;
    }

    public Patients getPatient() {
        return patient;
    }

    public void setPatient(Patients patient) {
        this.patient = patient;
    }

    public int getSuccess_ratio() {
        return success_ratio;
    }

    public void setSuccess_ratio(int success_ratio) {
        this.success_ratio = success_ratio;
    }
}
