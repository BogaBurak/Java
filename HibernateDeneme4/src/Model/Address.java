package Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


public class Address {
	

	 int IDX;
	 String ADDRCODE;
	 String ADDRTYPE;
	 String ADDRESS;
	 String DISTRICT;
	 String ZIPCODE;
	 String CITY;
		private String[] params;
	 
	 public Address() {
	        
	    }
	 
	 public Address(String ADDRCODE, String ADDRTYPE, String ADDRESS, String DISTRICT, String ZIPCODE, String CITY) {
	        this.ADDRCODE = ADDRCODE;
	        this.ADDRTYPE = ADDRTYPE;
	        this.ADDRESS = ADDRESS;
	        this.DISTRICT = DISTRICT;
	        this.ZIPCODE = ZIPCODE;
	        this.CITY = CITY;
	    }
	 
	 public int getIDX() {
	 return IDX;
	 }
	 public void setIDX(int IDX) {
	 this.IDX = IDX;
	 }
	 
	 public String getADDRCODE() {
	 return ADDRCODE;
	 }
	 public void setADDRCODE(String ADDRCODE) {
	 this.ADDRCODE = ADDRCODE;
	 }
	 
	 
	 public String getADDRTYPE() {
	 return ADDRTYPE;
	 }
	 public void setADDRTYPE(String ADDRTYPE) {
	 this.ADDRTYPE = ADDRTYPE;
	 }
	 
	 
	 public String getADDRESS() {
	 return ADDRESS;
	 }
	 public void setADDRESS(String ADDRESS) {
	 this.ADDRESS = ADDRESS;
	 }
	 
	 
	 public String getDISTRICT() {
	 return DISTRICT;
	 }
	 public void setDISTRICT(String DISTRICT) {
	 this.DISTRICT = DISTRICT;
	 }
	 
	 public String getZIPCODE() {
	 return ZIPCODE;
	 }
	 public void setZIPCODE(String ZIPCODE) {
	 this.ZIPCODE = ZIPCODE;
	 }
		 
	 public String getCITY() {
	 return CITY;
	 }
	 public void setCITY(String CITY) {
	 this.CITY = CITY;
	}

	 public String[] getParams() {
		        return params;
		    }
}
