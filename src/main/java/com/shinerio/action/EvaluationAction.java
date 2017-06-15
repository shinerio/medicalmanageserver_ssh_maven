package com.shinerio.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patient;
import com.shinerio.domain.Rawdata;
import com.shinerio.service.EvaluationService;
import com.shinerio.service.PatientService;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.ArrayList;

/**
 * Created by jstxzhangrui on 2017/6/10.
 */

@Component("evaluationAction")
@Scope("prototype")
@MultipartConfig
public class EvaluationAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {
    @Autowired
    public EvaluationService evaluationService;
    private HttpServletRequest request;
    private HttpServletResponse response;
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

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response = httpServletResponse;
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

    public void addEvaluation_info() {
        System.out.println("addEvaluation_info");
        Patient patient = patientService.getPatient(patientID);
        if (patient != null) {
            Evaluation_info evaluation_info = new Evaluation_info(start_time, end_time, patient, success_ratio);
            evaluationService.saveEvaluation_info(evaluation_info);
        }
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }

    public void addRawdatas() {
        Evaluation_info evaluation_info = evaluationService.getEvaluation_info(evaluation_info_id);
        if (evaluation_info != null) {
            try {
                if (upload != null) {
                    FileInputStream fis = new FileInputStream(upload);
                    BufferedReader bis = new BufferedReader(new InputStreamReader(fis));
                    System.out.println("获取文件的大小:" + upload.length());
                    System.out.println("evaluation_id" + evaluation_info_id);
                    String message;
                    ArrayList<Rawdata> rawdatas = new ArrayList<>();
                    while ((message = bis.readLine()) != null) {
                        String[] array = message.split("\t");
                        if (array.length != 3)
                            continue;
                        long time = Long.parseLong(array[0]);
                        int score = Integer.parseInt(array[1]);
                        Rawdata rawdata = new Rawdata(evaluation_info, time, array[2], score);
                        rawdatas.add(rawdata);
                    }
                    System.out.println(rawdatas.size());
                    evaluationService.saveRawdata(rawdatas);
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void getEvaluationId() {
        int evaluationId;
        try {
            int patient_id = Integer.parseInt(request.getParameter("patient_id"));
            long start_time = Long.parseLong(request.getParameter("start_time"));
            System.out.println(String.format("%d, %d", patient_id, start_time));
            evaluationId = evaluationService.getEvaluationId(patient_id, start_time);
        } catch (NumberFormatException e) {
            evaluationId = -1;
        }
        try {
            PrintWriter writer = response.getWriter();
            writer.write(String.valueOf(evaluationId));
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
