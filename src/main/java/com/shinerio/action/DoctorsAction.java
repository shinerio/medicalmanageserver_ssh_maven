package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.Doctors;
import com.shinerio.service.DoctorService;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import javax.servlet.http.HttpServletRequest;

@Component("doctorAction")
@Scope("prototype")
public class DoctorsAction extends ActionSupport implements ServletRequestAware {
    private String username;
    private HttpServletRequest request;
    public void setServletRequest(javax.servlet.http.HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }

    private String password;
    @Autowired
    private DoctorService doctorService;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public DoctorService getDoctorService() {
        return doctorService;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDoctorService(DoctorService doctorService) {
        this.doctorService = doctorService;
    }

    public String isLogin() {
        Doctors doctor = doctorService.login(username, password);
        if (doctor!=null) {
            this.request.getSession().setAttribute("doctor",doctor);
            return SUCCESS;
        } else {
            return "error";
        }
    }
}
