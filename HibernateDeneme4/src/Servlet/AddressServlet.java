package Servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import data.AddressDao;
import Model.Address;
import Model.AddressForm;
import Servis.AddressServis;

    
	@WebServlet("/")
	public class AddressServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        doGet(request, response);
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        String action = request.getServletPath();

	        switch (action) {
			    case "/new":
			        //showNewForm(request, response);
			        break;
			    case "/Ekle":
			    	insertAddress(request, response);
			        break;
			    case "/Sil":
			    	//deleteAddress(request, response);
			        break;
			    case "/edit":
			        //showEditForm(request, response);
			        break;
			    case "/Duzenle":
			    	//updateAddress(request, response);
			        break;
			    default:
			        listAddress(request, response);
			        break;
			}
	    }
	    
	    
	    
	    //Listele
	    protected void listAddress(HttpServletRequest request,
		           HttpServletResponse response) throws ServletException, IOException {
	    	String jsonStr="";
	    	PrintWriter out = null;
	    	out=response.getWriter();
	    	
	    	List<AddressForm> _r5=null;
	    	AddressDao dc=new AddressDao();
	    	_r5=dc.getListOfAddress();
	    	Gson gson=new Gson();
	    	jsonStr=gson.toJson((Object)_r5);
	    	_r5=null;
	    	out.write(jsonStr);
	    }
	
	//Ekle
	protected void insertAddress(HttpServletRequest request,
	           HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = null;
		out = response.getWriter();
		Gson gson = new Gson();
		String jsonStr = "";
		BufferedReader br = new BufferedReader(
		new InputStreamReader((InputStream) request.getInputStream(), Charset.forName("UTF-8")));
		String json_req = "";
		if (br != null) {
			json_req = br.readLine();
		}
		Address _req = (Address) gson.fromJson(json_req, (Class) Address.class);
		AddressServis as = new AddressServis();
		if(_req.getParams()[0].equals("EkleVeri")) {
			String result=null;
			String ADDRCODE=_req.getParams()[1];
			String ADDRTYPE=_req.getParams()[2];
			String ADDRESS=_req.getParams()[3];
			String DISTRICT=_req.getParams()[4];
			String ZIPCODE=_req.getParams()[5];
			String CITY=_req.getParams()[6];
			
			jsonStr = gson.toJson(as.insertAddress(ADDRCODE,ADDRTYPE,ADDRESS,DISTRICT,ZIPCODE,CITY)); 
			result=jsonStr;
		 }
		out.write(jsonStr);

	}
	/*
	//Düzenle
	protected void updateAddress(HttpServletRequest request,
	           HttpServletResponse response) throws ServletException, IOException {
		   
		   int IDX = Integer.parseInt(request.getParameter("id"));
	       String ADDRCODE = request.getParameter("ADDRCODE");
	       String ADDRTYPE = request.getParameter("ADDRTYPE");
	       String ADDRESS = request.getParameter("ADDRESS");
	       String DISTRICT = request.getParameter("DISTRICT");
	       String ZIPCODE = request.getParameter("ZIPCODE");
	       String CITY = request.getParameter("CITY");

	       try {
	           AddressDao adrDao = new AddressDao();
	           adrDao.updateAddress(IDX, ADDRCODE, ADDRTYPE, ADDRESS, DISTRICT, ZIPCODE, CITY);
	           response.sendRedirect("index.jsp");
	       } catch (Exception e) {

	           e.printStackTrace();
	       }
	   }
	
	//Sil
	protected void deleteAddress(HttpServletRequest request,
	           HttpServletResponse response) throws ServletException, IOException {
		   
		   int IDX = Integer.parseInt(request.getParameter("id"));
		   
	       try {
	           AddressDao adrDao = new AddressDao();
	           adrDao.deleteAddress(IDX);
	           response.sendRedirect("index.jsp");
	       } catch (Exception e) {
	    	   System.out.println("SilServletHata.");
	           e.printStackTrace();
	       }
	   }
*/
}
