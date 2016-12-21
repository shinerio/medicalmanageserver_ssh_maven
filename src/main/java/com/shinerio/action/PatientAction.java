package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patients;
import com.shinerio.service.PatientService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.ReplaceOverride;
import org.springframework.context.annotation.Scope;
import org.springframework.http.RequestEntity;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.WebConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
            jsonConfig.setExcludes(new String[]{"patientSet","doctor_info","password","username","evaluation_info"});  //配置过滤字段防止死循环
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

    public void listHistoryData(){
        String str_start_time =  request.getParameter("start_time");
        String str_end_time = request.getParameter("end_time");
        int patient_id = Integer.parseInt(request.getParameter("patient_id"));
        List<Evaluation_info>  list = patientService.getEvaluation_infoById(patient_id);
        List<Evaluation_info> result = new ArrayList();
        if(!("".equals(str_start_time)||str_end_time==null)) {
            int start_time = Integer.parseInt(str_start_time);
            int end_time = Integer.parseInt(str_end_time);
            for (Evaluation_info e : list) {
                if (e.getStart_time() >= start_time && e.getStart_time() <= end_time)
                    result.add(e);
            }
        }else{
            result = list;
        }
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"patient"});
        JSONArray jsonArray = JSONArray.fromObject(result,jsonConfig);
        try {
            PrintWriter writer = response.getWriter();
            writer.write(jsonArray.toString());
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
