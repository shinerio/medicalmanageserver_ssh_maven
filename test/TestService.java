import com.shinerio.service.DoctorService;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by jstxzhangrui on 2016/11/30.
 */
public class TestService {
    @Test
    public void login(){
        String username = "tom123";
        String password = "admin";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        DoctorService doctorService =  beanFactory.getBean("doctorService",DoctorService.class);
        System.out.print(doctorService.login(username,password));
    }
}
