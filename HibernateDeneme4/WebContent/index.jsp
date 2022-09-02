<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css"/>

<title>Listele</title>

<style type="text/css">

.dis{
            display: flex; 
            height: 100%;
            width: 100%;
        }
        .ic{
            width: 90%;
            height: auto;
            margin-left:auto;
            margin-right:auto;
            padding:10px;
            text-align: center;
        }

#tablo {
border-collapse: collapse;
width: 100%;
}
 
#tablo td, #tablo th {
border: 1px solid #ddd;
padding: 8px;
}
 
#tablo tr:nth-child(even){background-color: #f2f2f2;}
 
#tablo tr:hover {
background-color: #ffd129;
color:#fff;
}
 
#tablo th {
padding-top: 12px;
padding-bottom: 12px;
text-align: left;
background-color: #ffa45e;
color: white;
}

    a:link, a:visited {
        background-color: #007fff;
        color: white;
        padding: 14px 25px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
    }
 
 
    a:hover, a:active {
        background-color: #56aaff;
    }

</style>

<SCRIPT>
$(document).ready(function(){
	$.ajax({
	url:"/HibernateDeneme4/AddressServlet",
	method:"GET",
	dataType:"json",
		success: function (data){
			$("#datatable").dataTable({
			data:data,
			sort:false,
			searching:false,
			peging:false,
				columns:[
					{'data':'ADDRCODE'},
					{'data':'ADDRTYPE'},
					{'data':'ADDRESS'},
				]
			})
		}
	})
})
</script>


</head>
<body>
<div class="dis"><div class="ic">
<a href=Ekle.jsp>Ekle</a>
<hr>
<table id="datatable" class="table table-striped table-bordered">
<thead>
<tr>
 <th>Address Code</th>
 <th>Address Type</th>
 <th>Address</th>
  </tr>
  </thead>
 </table>
 </div> </div>
</body>

</html>