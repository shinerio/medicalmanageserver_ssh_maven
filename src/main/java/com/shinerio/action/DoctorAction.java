package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.Doctor_info;
import com.shinerio.domain.Doctors;
import com.shinerio.service.DoctorService;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.faces.flow.ReturnNode;
import javax.servlet.http.HttpServletRequest;

@Component("doctorAction")
@Scope("prototype")
public class DoctorAction extends ActionSupport implements ServletRequestAware {
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
    public String logOut(){
        this.request.getSession().removeAttribute("doctor");
        return SUCCESS;
    }
    public String getDoctorInfo(){
        Doctors doctor = (Doctors) this.request.getSession().getAttribute("doctor");
        Doctor_info doctor_info = null;
        if(doctor!=null)
            doctor_info= doctorService.getDoctorInfo(doctor.getId());
        if(doctor_info!=null){
            this.request.setAttribute("doctor_info",doctor_info);
            return SUCCESS;
        }else{
            return "error";
        }
    }
}
