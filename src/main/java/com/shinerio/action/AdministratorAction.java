package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.Administrator;
import com.shinerio.domain.Doctor;
import com.shinerio.service.AdministratorService;
import com.shinerio.utils.StringUtils;
import net.sf.json.JSONArray;
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
import java.util.HashMap;
import java.util.List;

/**
 * Created by jstxzhangrui on 2016/12/19.
 */
@Component("superAdminAction")
@Scope("prototype")
public class AdministratorAction extends ActionSupport implements ServletRequestAware,ServletResponseAware {
    @Autowired
    private AdministratorService administratorService;
    private String username;
    private String password;
    private HttpServletRequest request;
    private HttpServletResponse response;
    public void setServletRequest(javax.servlet.http.HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }



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

    public AdministratorService getAdministratorService() {
        return administratorService;
    }

    public void setAdministratorService(AdministratorService administratorService) {
        this.administratorService = administratorService;
    }

    public String login(){
        Administrator administrator = administratorService.login(username,password);
        if(administrator!=null){
            this.request.getSession().setAttribute("superAdmin",administrator);
            return SUCCESS;
        }
        return "error";
    }
    public void listDoctor(){
        int start = -1;int length = -1;
        String sstartnum = request.getParameter("startnum");
        String sleng = request.getParameter("length");
        String username = request.getParameter("username");
        String realname = request.getParameter("realname");
        String department = request.getParameter("department");
        HashMap<String,Object> map = new HashMap<>();
        if(!StringUtils.isEmpty(username)){
            map.put("username",username);
        }
        if(!StringUtils.isEmpty(realname)){
            map.put("realname",realname);
        }
        if(!StringUtils.isEmpty(department)){
            map.put("department",department);
        }
        if(!StringUtils.isEmpty(sstartnum)){
            start = Integer.parseInt(sstartnum);
        }
        if(!StringUtils.isEmpty(sleng)){
            length = Integer.parseInt(sleng);
        }
        List<Doctor> list = administratorService.doctorList(start,length,map);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"patientList","doctorList"});
        JSONArray jsonArray = JSONArray.fromObject(list,jsonConfig);
        try {
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            writer.write(jsonArray.toString());
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response = httpServletResponse;
    }
}
