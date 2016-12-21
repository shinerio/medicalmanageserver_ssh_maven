import com.shinerio.domain.Doctors;
import com.shinerio.domain.Patients;
import com.shinerio.domain.SuperAdmin;
import com.shinerio.service.DoctorService;
import com.shinerio.service.PatientService;
import com.shinerio.service.SuperAdminService;
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
        String username = "tom123";
        String password = "admin";
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        DoctorService doctorService =  beanFactory.getBean("doctorService",DoctorService.class);
        System.out.print(doctorService.login(username,password));
    }

    @Test
    public void patientLogin(){
        String username = "jack123";
        String password = "admin";
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        PatientService patientService =  beanFactory.getBean("patientService",PatientService.class);
        Patients patient = patientService.login(username,password);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"doctor","doctor_info","password","username","evaluation_info"});
        JSONObject jsonDoctor = JSONObject.fromObject(patient,jsonConfig);
        System.out.print(jsonDoctor);
    }
@Test
    public void superAdminLogin(){
        String username = "superadmin";
        String password = "admin";
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        SuperAdminService superAdminService =  beanFactory.getBean("superAdminService",SuperAdminService.class);
        System.out.print(superAdminService.login(username,password));
    }
@Test
    public void getDoctotList(){
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        SuperAdminService superAdminService =  beanFactory.getBean("superAdminService",SuperAdminService.class);
        HashMap<String,Object> map = new HashMap<>();
        map.put("department","神经内科");
        map.put("realname","%t%");
        ArrayList result = superAdminService.doctorList(0,1,map);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"patientSet","doctor","doctor_info","password","id"});
        JSONArray doctors = JSONArray.fromObject(result,jsonConfig);
        System.out.print(doctors);
    }
    @Test
    public void getEvaluation_info(){
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        PatientService patientService =  beanFactory.getBean("patientService",PatientService.class);
        List list = patientService.getEvaluation_infoById(1);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setExcludes(new String[]{"patient"});
        JSONArray jsonArray = JSONArray.fromObject(list,jsonConfig);
        System.out.print(jsonArray);
    }
}
