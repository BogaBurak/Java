package utl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {
	private static SessionFactory sessionFactory;
	
	 
    static {
        try {
            sessionFactory = new AnnotationConfiguration().configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
 
    public static Session openSession() {
        return sessionFactory.openSession();
    }
    public static SessionFactory getSessionFactory() {
    	if(sessionFactory==null){
    		try {
                // Create the SessionFactory from standard (hibernate.cfg.xml) 
                // config file.
                sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
            } catch (Throwable ex) {
                // Log the exception. 
                System.err.println("Initial SessionFactory creation failed." + ex);
                throw new ExceptionInInitializerError(ex);
            }
    	}
    		
        return sessionFactory;
    }
}
