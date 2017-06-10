package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patient;
import com.shinerio.domain.Rawdata;
import com.shinerio.service.EvaluationService;
import com.shinerio.service.PatientService;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.*;
import java.util.ArrayList;

/**
 * Created by jstxzhangrui on 2017/6/10.
 */

@Component("evaluationAction")
@Scope("prototype")
@MultipartConfig
public class EvaluationAction extends ActionSupport implements ServletRequestAware {
   @Autowired
    public EvaluationService evaluationService;
    private HttpServletRequest request;
    @Autowired
    public PatientService patientService;
    public int patientID;
    public long start_time;
    public long end_time;
    public float success_ratio;
    public int evaluation_info_id;
    private File upload;

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public int getEvaluation_info_id() {
        return evaluation_info_id;
    }

    public void setEvaluation_info_id(int evaluation_info_id) {
        this.evaluation_info_id = evaluation_info_id;
    }

    public EvaluationService getEvaluationService() {
        return evaluationService;
    }

    public void setEvaluationService(EvaluationService evaluationService) {
        this.evaluationService = evaluationService;
    }

    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    public float getSuccess_ratio() {
        return success_ratio;
    }

    public void setSuccess_ratio(float success_ratio) {
        this.success_ratio = success_ratio;
    }

    public long getStart_time() {
        return start_time;
    }

    public void setStart_time(long start_time) {
        this.start_time = start_time;
    }

    public long getEnd_time() {
        return end_time;
    }

    public void setEnd_time(long end_time) {
        this.end_time = end_time;
    }

    public void addEvaluation_info(){
        Patient patient = patientService.getPatient(patientID);
        if(patient!=null){
            Evaluation_info evaluation_info = new Evaluation_info(start_time,end_time,patient,success_ratio);
            evaluationService.saveEvaluation_info(evaluation_info);
        }
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }

    public void addRawdatas(){
        Evaluation_info evaluation_info = evaluationService.getEvaluation_info(evaluation_info_id);
        if(evaluation_info!=null) {
            try {
                if(upload!=null) {
                    FileInputStream fis = new FileInputStream(upload);
                    BufferedReader bis = new BufferedReader(new InputStreamReader(fis));
                    String message;
                    ArrayList<Rawdata> rawdatas = new ArrayList<>();
                    while ((message = bis.readLine()) != null) {
                        String[] array = message.split("\t");
                        long time = Long.parseLong(array[0]);
                        int score = Integer.parseInt(array[2]);
                        Rawdata rawdata = new Rawdata(evaluation_info, time, array[1], score);
                        rawdatas.add(rawdata);
                    }
                    evaluationService.saveRawdata(rawdatas);
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
