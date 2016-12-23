/**
 * Created by jstxzhangrui on 2016/11/26.
 */
public class TestDAO {
//用户名不唯一，重复运行请更换用户名
    //testDao内方法不能再进行测试，事务转移至service层
    //项目代码已重新组织，下面代码或存在逻辑语法错误
    /*
    @Test
    public void insertDoctor(){
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        DoctorDao doctorDao =  beanFactory.getBean("doctorDao",DoctorDao.class);
        Doctors doctor = new Doctors("tom","tom123","admin");
        doctorDao.saveDoctor(doctor);
    }

    @Test
    public void selectDoctor(){
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        DoctorDao doctorDao =  beanFactory.getBean("doctorDao",DoctorDao.class);
        Doctors doctor = doctorDao.getDoctorByID(1);
        System.out.println(doctor);
    }
    public Doctors getDoctor(){
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        DoctorDao doctorDao = beanFactory.getBean("doctorDao",DoctorDao.class);
        Doctors doctor = doctorDao.getDoctorByID(1);
       return doctor;
    }
    @Test
    public void insertPatient() throws Exception {
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        PatientDao patientDao = beanFactory.getBean("patientDao",PatientDao.class);
        Doctors doctor = getDoctor();
        Patients patient = new Patients("JACK","jack123","admin",doctor);
        patientDao.savePatient(patient);
    }

    @Test
    public void selectPatientByDoctor() throws Exception {
        BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
        DoctorDao doctorDao =  beanFactory.getBean("doctorDao",DoctorDao.class);
        Doctors doctor = new Doctors();
        doctor.setId(1);
        Set<Patients> patients = doctorDao.getPatients(doctor);
       Iterator<Patients> iterator = patients.iterator();
        while (iterator.hasNext()){
            Patients patient = iterator.next();
            System.out.println(patient);
        }
    }
@Test
    public  void getDoctorByUsername(){
    BeanFactory beanFactory = new ClassPathXmlApplicationContext("applicationContext.xml");
    DoctorDao doctorDao =  beanFactory.getBean("doctorDao",DoctorDao.class);
        System.out.print(doctorDao.getDoctorByUsername("tom"));
    }
    */
}
