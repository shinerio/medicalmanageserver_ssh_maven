import com.shinerio.domain.Evaluation_info;
import com.shinerio.domain.Patient;
import com.shinerio.service.DoctorService;
import com.shinerio.service.PatientService;
import com.shinerio.service.AdministratorService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.*;

/**
 * Created by jstxzhangrui on 2016/11/30.
 */
public class TestService {
    @Test
    public void doctorLogin(){
        String username = "1001";
        String password = "admin";
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        DoctorService doctorService =  beanFactory.getBean("doctorService",DoctorService.class);
        System.out.print(doctorService.login(username,password));
    }

    @Test
    public void patientLogin(){
        String username = "1001";
        String password = "admin";
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        PatientService patientService =  beanFactory.getBean("patientService",PatientService.class);
        Patient patient = patientService.login(username,password);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"doctor","department","password","username","evaluation_infoList"});
        JSONObject jsonDoctor = JSONObject.fromObject(patient,jsonConfig);
        System.out.print(jsonDoctor);
    }
@Test
    public void administratorLogin(){
        String username = "admin";
        String password = "admin";
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        AdministratorService administratorService =  beanFactory.getBean("administratorService",AdministratorService.class);
        System.out.print(administratorService.login(username,password));
    }
    @Test
    public void getEvaluation_info(){
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        PatientService patientService =  beanFactory.getBean("patientService",PatientService.class);
        List list = patientService.getEvaluation_infoById(1);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"patient","rawdata"});
        JSONArray jsonArray = JSONArray.fromObject(list,jsonConfig);
        System.out.print(jsonArray);
    }
@Test
    public void listDoctor(){
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        AdministratorService administratorService =  beanFactory.getBean("administratorService",AdministratorService.class);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"patientList","doctorList"});
        JSONArray jsonArray = JSONArray.fromObject(administratorService.doctorList(0,1,new HashMap<>()),jsonConfig);
        System.out.print(jsonArray);
    }
    @Test
    public void getRawData(){
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        PatientService patientService =  beanFactory.getBean("patientService",PatientService.class);
        List list = patientService.getRawDataByEvaid(1);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"id","evaluation_info","time_stamp","json_string"});
        JSONArray jsonArray = JSONArray.fromObject(list,jsonConfig);
        System.out.print(jsonArray);
    }
@Test
    public void listHistoryData(){
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        PatientService patientService =  beanFactory.getBean("patientService",PatientService.class);
        List<Evaluation_info>  list = patientService.getEvaluation_infoById(1);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"doctor","password","rawdataList","evaluation_infoList"});
        JSONArray jsonArray = JSONArray.fromObject(list,jsonConfig);
        System.out.print(jsonArray);
    }
}
