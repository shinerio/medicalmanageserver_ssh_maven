package com.shinerio.domain;

import javax.persistence.*;

/**
 * Created by jstxzhangrui on 2016/12/22.
 */
@Entity
@Table(name="ADMINISTRATOR")
public class Administrator {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="name",unique = true)
    private String username;
    @Column(name="password")
    private String password;

    public Administrator() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
