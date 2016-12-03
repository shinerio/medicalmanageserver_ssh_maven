import com.shinerio.domain.Doctors;
import com.shinerio.domain.Patients;
import com.shinerio.service.DoctorService;
import com.shinerio.service.PatientService;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
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
        jsonConfig.setExcludes(new String[]{"patientSet","password","username"});
        JSONObject jsonDoctor = JSONObject.fromObject(patient,jsonConfig);
        System.out.print(jsonDoctor);
    }
}
