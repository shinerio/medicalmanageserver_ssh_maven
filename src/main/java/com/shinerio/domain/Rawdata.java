package com.shinerio.domain;

import javax.persistence.*;

/**
 * Created by jstxzhangrui on 2016/12/22.
 */
@Entity
@Table(name="rawdata")
public class Rawdata {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name="evaluation_id")
    private Evaluation_info evaluation_info;
    @Column(name="time_stamp")
    private long time_stamp;
    @Column(name="json_string")
    private String json_string;
    @Column(name="score")
    private int score;

    public Rawdata() {
    }

    public Rawdata(Evaluation_info evaluation_info, long time_stamp, String json_string, int score) {
        this.evaluation_info = evaluation_info;
        this.time_stamp = time_stamp;
        this.json_string = json_string;
        this.score = score;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Evaluation_info getEvaluation_info() {
        return evaluation_info;
    }

    public void setEvaluation_info(Evaluation_info evaluation_info) {
        this.evaluation_info = evaluation_info;
    }

    public long getTime_stamp() {
        return time_stamp;
    }

    public void setTime_stamp(long time_stamp) {
        this.time_stamp = time_stamp;
    }

    public String getJson_string() {
        return json_string;
    }

    public void setJson_string(String json_string) {
        this.json_string = json_string;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
