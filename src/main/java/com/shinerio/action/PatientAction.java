package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patient;
import com.shinerio.domain.Rawdata;
import com.shinerio.service.PatientService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jstxzhangrui on 2016/12/3.
 */
@Component("patientAction")
@Scope("prototype")
public class PatientAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {
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
    public void login() {
        Patient patient = patientService.login(username, password);
        if (patient != null) {
            JsonConfig jsonConfig = new JsonConfig();
            jsonConfig.setExcludes(new String[]{"doctor", "department", "password", "username", "evaluation_infoList"});  //配置过滤字段防止死循环
            JSONObject jsonDoctor = JSONObject.fromObject(patient, jsonConfig);
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

    public void listHistoryData() {
        String str_start_time = request.getParameter("start_time");
        String str_end_time = request.getParameter("end_time");
        int patient_id = Integer.parseInt(request.getParameter("patient_id"));
        List<Evaluation_info> list = patientService.getEvaluation_infoById(patient_id);
        List<Evaluation_info> result = new ArrayList();
        if (!("".equals(str_start_time) || str_end_time == null)) {
            long start_time = Long.parseLong(str_start_time);
            long end_time = Long.parseLong(str_end_time);
            for (Evaluation_info e : list) {
                if (e.getStart_time() >= start_time && e.getStart_time() <= end_time)
                    result.add(e);
            }
        } else {
            result = list;
        }
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"doctor", "password", "rawdataList", "evaluation_infoList"});
        JSONArray jsonArray = JSONArray.fromObject(result, jsonConfig);
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            writer.write(jsonArray.toString());
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void getRawData() {
        int evaluation_id = Integer.parseInt(request.getParameter("evaluation_id"));
        List<Rawdata> list = patientService.getRawDataByEvaid(evaluation_id);
        List<String> result = new ArrayList<>();
        StringBuffer stringBuffer = new StringBuffer();
        for (Rawdata rawdata : list) {
            // result.add(rawdata.getJson_string());
            stringBuffer.append(rawdata.getJson_string()).append("\n");
        }
        // JsonConfig jsonConfig = new JsonConfig();
        // jsonConfig.setExcludes(new String[]{"id", "evaluation_info", "time_stamp", "json_string"});
        // JSONArray jsonArray = JSONArray.fromObject(result);
        try {
            PrintWriter writer = response.getWriter();
            writer.write(stringBuffer.toString());
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
