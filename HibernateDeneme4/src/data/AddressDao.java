package data;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import Model.Address;
import Model.AddressForm;
import utl.HibernateUtil;

public class AddressDao {
	
	private Session hsess;
	private Transaction trans;

	public AddressDao() {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		hsess = factory.openSession();
		trans = hsess.beginTransaction();
	}
	
	public void beginTransaction() {
		try {
			trans = hsess.beginTransaction();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void commitTransaction() {
		try {
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void rollbackTransaction() {
		try {
			trans.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void closeSession() {
		try {
			if (hsess.isOpen()) {
				hsess.close();
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}
	
	public AddressForm getInvoice(String ADDRCODE,String ADDRTYPE, String ADDRESS, String DISTRICT, String ZIPCODE, String CITY) {
		AddressForm tf=(AddressForm)hsess.get(AddressForm.class,ADDRCODE);
		return tf;
	}

	
	private Query query;


	public String insertAddress(AddressForm adr) {
		String result=null;
		try {		
			hsess.saveOrUpdate(adr);
			result="SUCCESS"; 
			commitTransaction();
			closeSession();
		}
		catch(HibernateException e){
			result="ERROR";
			e.printStackTrace();
		}
          return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<AddressForm> getListOfAddress(){
		 List<AddressForm> list = new ArrayList<AddressForm>();
	        try {
	            list = hsess.createQuery("from AddressForm").list();
	            commitTransaction();
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("Please Check the Details.");
	        } finally {
	        	closeSession();
	        }
	        return list;
	    }
	
	/*
	@SuppressWarnings("unchecked")
	public List<AddressForm> getListOfAddress(){
		 List<AddressForm> list = new ArrayList<AddressForm>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;       
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from AddressForm").list();
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	            System.out.println("Please Check the Details.");
	        } finally {
	            session.close();
	        }
	        return list;
	    }
	
	public void updateAddress(int IDX, String ADDRCODE, String ADDRTYPE, String ADDRESS,
            String DISTRICT, String ZIPCODE, String CITY) {
        Session session = HibernateUtil.openSession();
        Transaction transaction = session.beginTransaction();
        Address adr = (Address)session.load(Address.class, IDX);
        adr.setADDRCODE(ADDRCODE);
        adr.setADDRTYPE(ADDRTYPE);
        adr.setADDRESS(ADDRESS);
        adr.setDISTRICT(DISTRICT);
        adr.setZIPCODE(ZIPCODE);
        adr.setCITY(CITY);
        session.update(adr);
        transaction.commit();
        session.close();  
    }

	
	public List<Address> getAddress(int IDX) {
        List<Address> employeeList = new ArrayList<Address>();
        Session session = HibernateUtil.openSession();
        Query query = session.createQuery("From Address where IDX= :id ");
        query.setParameter("id", IDX);
        employeeList = query.list();
        return employeeList;
	}
	
	public void deleteAddress(int IDX) {
        Session session = HibernateUtil.openSession();
        Transaction transaction = session.beginTransaction();
        Address adr = (Address)session.load(Address.class, IDX);
        session.delete(adr);
        transaction.commit();
        session.close();  
    }
    */
}