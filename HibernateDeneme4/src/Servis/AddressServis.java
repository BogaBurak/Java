package Servis;


import java.util.Date;
import java.util.regex.Pattern;

import utl.HibernateUtil;

import Model.Address;
import Model.AddressForm;
import data.AddressDao;


public class AddressServis {
	
	
	
	public String insertAddress(String ADDRCODE, String ADDRTYPE, String ADDRESS,String DISTRICT,String ZIPCODE,String CITY) {
		
		AddressForm afrm = new AddressForm();
		AddressDao adr=new AddressDao();
		
		String result=null;
		afrm.ADDRCODE=ADDRCODE;
		afrm.ADDRTYPE=ADDRTYPE;
		afrm.ADDRESS=ADDRESS;
		afrm.DISTRICT=DISTRICT;
		afrm.ZIPCODE=ZIPCODE;
		afrm.CITY=CITY;
		
		result=adr.insertAddress(afrm);
		return result;
		
	}
}
