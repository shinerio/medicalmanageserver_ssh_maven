package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.Patients;
import com.shinerio.service.PatientService;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.ReplaceOverride;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.WebConnection;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by jstxzhangrui on 2016/12/3.
 */
@Component("patientAction")
@Scope("prototype")
public class PatientAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
    private String username;
    private HttpServletRequest request;
    private HttpServletResponse response;
    public void setServletRequest(javax.servlet.http.HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }

    private String password;

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

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response = httpServletResponse;
    }
    @Autowired
    public PatientService patientService;

    public PatientService getPatientService() {
        return patientService;
    }

    public void setPatientService(PatientService patientService) {
        this.patientService = patientService;
    }

     /*
        此方法位客户端病患登录，采用json传输数据
     */
    public void login(){
        Patients patient = patientService.login(username,password);
        if(patient!=null){
            JsonConfig jsonConfig = new JsonConfig();
            jsonConfig.setExcludes(new String[]{"patientSet","password","username"});  //配置过滤字段防止死循环
            JSONObject jsonDoctor = JSONObject.fromObject(patient,jsonConfig);
            try {
                PrintWriter writer = response.getWriter();
                writer.write(jsonDoctor.toString());
                writer.flush();
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


}
