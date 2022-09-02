<%@page import="java.util.List"%>
<%@page import="data.AddressDao"%>
<%@page import="java.util.Date"%>
<%@page import="Model.Address"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ekle</title>
<style>
td{
height: 75px;
}
input[type=text] {
  width: 100%;
  padding: 6px 50px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 1px solid #555;
  outline: none;
}

textarea {
  width: 100%;
  height: 150px;
  padding: 12px 50px;
  box-sizing: border-box;
  border: 1px solid #555;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}
select {
          width: 100%;
          padding: 12px 50px;
          border: 1px solid #555;
          border-radius: 10px;
          font-size: 16px;
          background-color: #254FF1;
          color: white;
          
            display: grid;
  grid-template-areas: "select";
  align-items: center;
  position: relative;

  select,
  &::after {
    grid-area: select;
  }

  min-width: 15ch;
  max-width: 30ch;

  border: 1px solid var(--select-border);
  border-radius: 0.25em;
  padding: 0.25em 0.5em;

  font-size: 1.25rem;
  cursor: pointer;
  line-height: 1.1;

  // Optional styles
  // remove for transparency

  // Custom arrow
  &:not(.select--multiple)::after {
    content: "";
    justify-self: end;
    width: 0.8em;
    height: 0.5em;
    background-color: var(--select-arrow);
    clip-path: polygon(100% 0%, 0 0%, 50% 100%);
  }
}


 input[type=submit]{
  background-color: #254FF1;
  border: 1px;
  border-radius: 10px;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
</style>

<SCRIPT>
function isValid(frm)
{
	var adressCode = frm.ADDRCODE.value;
    var adressType = frm.ADDRTYPE.value;
    var adress = frm.ADDRESS.value;
    var city = frm.CITY.value;
    if ( adressCode == null || adressCode == "")
    {
        alert("Address code is mandatory");
        return false;
    }  
    if ( adressType == null || adressType == "")
    {
        alert("Address type is mandatory");
        return false;
    }
    if ( adress == null || adress == "")
    {
        alert("Address is mandatory");
        return false;
    } 
    if ( city == null || city == "")
    {
        alert("City is mandatory");
        return false;
    } 
    return true;
}

$("#my_form").submit(function(event){
    event.preventDefault(); //prevent default action 
    var post_url = $(this).attr("action"); //get form action url
    var request_method = $(this).attr("method"); //get form GET/POST method
	var form_data = new FormData(this); //Creates new FormData object
    $.ajax({
        url : post_url,
        type: request_method,
        data : form_data,
		contentType: false,
		cache: false,
		processData:false
    }).done(function(response){ //
        $("#server-results").html(response);
    });
});

</SCRIPT>

</head>
<body>
<%
                     AddressDao adrDao = new AddressDao();
                     List<Address> list = adrDao.getAddress(Integer.valueOf(request.getParameter("id")));
                     for (Address u : list) {
                    	 String addrtype=u.getADDRTYPE();
                    	 String selected="selected";
                 %>
<form id="form" name="form" method="post" id="my_form" action="Duzenle?id=<%=u.getIDX()%>" onsubmit="return isValid(this)">
<table border="0">
             
<tr>
<td width="150"><label for="adressCode">*Adress Code:</label></td>
<td> <input type="text" name="ADDRCODE" id="ADDRCODE" value="<%=u.getADDRCODE()%>"/></td>
</tr>
<tr>
<td><label for="ADDRTYPE">*Adress Type: </label></td>
<td>
<select name="ADDRTYPE" id="ADDRTYPE" class="minimal">
<option value="">Please choose</option>
  <option value="invoice" <%if(addrtype.equals("invoice")) out.print("selected");%> >Invoice</option>
  <option value="delivery" <%if(addrtype.equals("delivery")) out.print("selected");%> >Delivery</option>
  <option value="buyer" <%if(addrtype.equals("buyer")) out.print("selected");%> >Buyer</option>
  <option value="other" <%if(addrtype.equals("other")) out.print("selected");%> >Other</option>
</select>
</td>
</tr>
<tr>
<td><label for="adress">*Adress: </label></td>
<td><textarea id="ADDRESS" name="ADDRESS" rows="4" cols="15"><%=u.getADDRESS()%>
</textarea></td>
</tr>
<tr>
<td><label for="district">District: </label></td>
<td><input type="text" name="DISTRICT" id="DISTRICT" value="<%=u.getDISTRICT()%>" /></td>
</tr>
<tr>
<td><label for="zipcode">Zipcode: </label></td>
<td><input type="text" name="ZIPCODE" id="ZIPCODE" value="<%=u.getZIPCODE()%>" /></td>
</tr>
<tr>
<td><label for="city">*City: </label></td>
<td><input type="text" name="CITY" id="CITY" value="<%=u.getCITY()%>" /></td>
</tr>

<tr><td></td><td><input type="submit" name="submit" value="Update Address" /></td></tr>
<%}%>
</table>
</form>

</body>
</html>