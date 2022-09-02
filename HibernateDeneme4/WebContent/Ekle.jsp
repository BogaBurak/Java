
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <!--   <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />  -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<meta charset="ISO-8859-1">
<title>Ekle</title>
<style>
.dis{
            display: flex; 
            height: 100%;
            width: 100%;
        }
        .ic{
            width: 	auto;
            height: auto;
            margin-left:25%;
            margin-right:25%;
            padding:10px;
            text-align: center;
        }

td{
height: 75px;
}
input[type=text] {
  width: 100%;
  padding: 6px 25px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 1px solid #555;
  outline: none;
}

textarea {
  width: 100%;
  height: 150px;
  padding: 12px 25px;
  box-sizing: border-box;
  border: 1px solid #555;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}
select {
          width: 100%;
          padding: 12px 25px;
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

<script type="text/javascript">
var Kontrol;
function isValid(frm)
{
	Kontrol=true;
	
    var adressCode = frm.ADDRCODE.value;
    var adressType = frm.ADDRTYPE.value;
    var adress = frm.ADDRESS.value;
    var city = frm.CITY.value;
    if ( adressCode == null || adressCode == "")
    {
    	Kontrol=false;
        alert("Address code is mandatory");
        return false;
    }  
    if ( adressType == null || adressType == "")
    {
    	Kontrol=false;
        alert("Address type is mandatory");
        return false;
    }
    if ( adress == null || adress == "")
    {
    	Kontrol=false;
        alert("Address is mandatory");
        return false;
    } 
    if ( city == null || city == "")
    {
    	Kontrol=false;
        alert("City is mandatory");
        return false;
    } 
    return true;
}

 $(document).ready(function () {
	  $("form").submit(function (event) { if(Kontrol==true){
		  var jsonreq = new Object();
          
          jsonreq.params = new Array();
          jsonreq.params[0] ="EkleVeri";
          jsonreq.params[1] =$("#ADDRCODE").val();
          jsonreq.params[2] =$("#ADDRTYPE").val();
          jsonreq.params[3] =$("#ADDRESS").val();
          jsonreq.params[4] =$("#DISTRICT").val();
          jsonreq.params[5] =$("#ZIPCODE").val();
          jsonreq.params[6] =$("#CITY").val();
          sendAjax(jsonreq);
		  /*
	    var formData = {
	      ADDRCODE: $("#ADDRCODE").val(),
	      ADDRTYPE: $("#ADDRTYPE").val(),
	      ADDRESS: $("#ADDRESS").val(),
	      DISTRICT: $("#DISTRICT").val(),
	      ZIPCODE: $("#ZIPCODE").val(),
	      CITY: $("#CITY").val(),
	    };
		  */
	    function sendAjax(jsonreq) {
	    $.ajax({
	      type: "POST",
	      url: "Ekle",
	      data: JSON.stringify(jsonreq),
	      dataType: "json",
	      encode: true,	      
	    }).done(function (data) {
	      console.log(data);
	      if(data=="SUCCESS"){
	    	alert("Veri Eklendi");
	  	    window.location.href="index.jsp"; 
	      }
	    });
	    }
	    event.preventDefault();
	    //alert("Veri Eklendi");
	    //window.location.href="index.jsp";
	  }
	  });
	});
 

  </script>
 
</head>
<body>
<div class="dis"><div class="ic">
<form  onsubmit="return isValid(this)">
<table border="0">
<tr>
<td width="150"><label for="adressCode">*Adress Code:</label></td>
<td> <input type="text" name="ADDRCODE" id="ADDRCODE"/></td>
</tr>
<tr>
<td><label for="ADDRTYPE">*Adress Type: </label></td>
<td>
<select name="ADDRTYPE" id="ADDRTYPE" class="minimal">
<option value="">Please choose</option>
  <option value="invoice">Invoice</option>
  <option value="delivery">Delivery</option>
  <option value="buyer">Buyer</option>
  <option value="other">Other</option>
</select>
</td>
</tr>
<tr>
<td><label for="adress">*Adress: </label></td>
<td><textarea id="ADDRESS" name="ADDRESS" rows="4" cols="15">
</textarea></td>
</tr>
<tr>
<td><label for="district">District: </label></td>
<td><input type="text" name="DISTRICT" id="DISTRICT" /></td>
</tr>
<tr>
<td><label for="zipcode">Zipcode: </label></td>
<td><input type="text" name="ZIPCODE" id="ZIPCODE" /></td>
</tr>
<tr>
<td><label for="city">*City: </label></td>
<td><input type="text" name="CITY" id="CITY" /></td>
</tr>

<tr><td></td><td><input type="submit" name="submit" value="Save Address" /></td></tr>
</table>
</form>
</div></div>
</body>
</html>