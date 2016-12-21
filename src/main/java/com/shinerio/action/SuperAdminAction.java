package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.SuperAdmin;
import com.shinerio.service.SuperAdminService;
import com.shinerio.service.impl.SuperAdminServiceImpl;
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
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by jstxzhangrui on 2016/12/19.
 */
@Component("superAdminAction")
@Scope("prototype")
public class SuperAdminAction extends ActionSupport implements ServletRequestAware,ServletResponseAware {
    @Autowired
    private SuperAdminService superAdminService;
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

    public SuperAdminService getSuperAdminService() {
        return superAdminService;
    }

    public void setSuperAdminService(SuperAdminService superAdminService) {
        this.superAdminService = superAdminService;
    }

    public String login(){
        SuperAdmin superAdmin = superAdminService.login(username,password);
        if(superAdmin!=null){
            this.request.getSession().setAttribute("superAdmin",superAdmin);
            return SUCCESS;
        }
        return "error";
    }

    public void listDoctor(){
        HashMap<String,Object> map = new HashMap<>();
        if(!"".equals(request.getParameter("department"))   ){
            map.put("department",request.getParameter("department"));
        }
        if(!"".equals(request.getParameter("realname"))){
            map.put("realname","%"+request.getParameter("realname")+"%");
        }
        if(!"".equals(request.getParameter("username"))){
            map.put("username",request.getParameter("username"));
        }
        ArrayList<Object[]> result =  superAdminService.doctorList(0,10,map);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"patientSet","doctor","doctor_info","password","id"});
        JSONArray doctors = JSONArray.fromObject(result,jsonConfig);
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.write(doctors.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response = httpServletResponse;
    }
}
