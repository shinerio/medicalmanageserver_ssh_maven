package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.Department;
import com.shinerio.domain.Doctor;
import com.shinerio.service.DoctorService;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component("doctorAction")
@Scope("prototype")
public class DoctorAction extends ActionSupport implements ServletRequestAware {
    private String username;
    private HttpServletRequest request;
    public void setServletRequest(javax.servlet.http.HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
    private String houseaddress;
    private String officeaddress;
    private String password;
    private String realname;
    private int age;
    private String department;
    private String major;
    private long telenum;
    private String emailaddress;

    public String getOfficeaddress() {
        return officeaddress;
    }

    public void setOfficeaddress(String officeaddress) {
        this.officeaddress = officeaddress;
    }

    public String getHouseaddress() {
        return houseaddress;
    }

    public void setHouseaddress(String houseaddress) {
        this.houseaddress = houseaddress;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setTelenum(int telenum) {
        this.telenum = telenum;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setWorkingtime(int workingtime) {
        this.workingtime = workingtime;
    }

    public void setWorkexperience(String workexperience) {
        this.workexperience = workexperience;
    }

    public void setEmailaddress(String emailaddress) {
        this.emailaddress = emailaddress;
    }

    private int workingtime;
    private String workexperience;
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
        Doctor doctor = doctorService.login(username, password);
        if (doctor!=null) {
            this.request.getSession().setAttribute("doctor",doctor);
            return SUCCESS;
        } else {
            this.request.setAttribute("error_message","用户名或密码错误");
            return INPUT;
        }
    }
    public String logOut(){
        this.request.getSession().removeAttribute("doctor");
        return SUCCESS;
    }

    public String addDoctor(){
        Doctor doctor = doctorService.getDoctor(username);
        if(doctor==null){   //没有，可以新建
            Department department_temp = doctorService.getDepartment(department);
            Doctor temp = new Doctor(username,1,officeaddress,major,workingtime,houseaddress,workexperience,emailaddress,telenum,
                    age,department_temp,realname,password);
            doctorService.addDoctor(temp);
            return SUCCESS;
        }else {
            return INPUT;
        }
    }
}
