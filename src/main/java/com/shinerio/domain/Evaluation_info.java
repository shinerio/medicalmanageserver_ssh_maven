package com.shinerio.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

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
    @JoinColumn(name="patient_id")
    private Patient patient;
    @Column(name="start_time")
    private long start_time;
    @Column(name="end_time")
    private long end_time;
    @Column(name="success_ratio")
    private float success_ratio;
    @OneToMany(mappedBy = "evaluation_info")
    private List<Rawdata> rawdataList = new ArrayList<>();

    public List<Rawdata> getRawdataList() {
        return rawdataList;
    }

    public void setRawdataList(List<Rawdata> rawdataList) {
        this.rawdataList = rawdataList;
    }

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

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public float getSuccess_ratio() {
        return success_ratio;
    }

    public void setSuccess_ratio(float success_ratio) {
        this.success_ratio = success_ratio;
    }
}
