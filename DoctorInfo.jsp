<%@ page import="java.sql.*"%>

<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>

<%
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
	
%>
<head>
	<style>
		*{padding:0px; margin:0px;}
		.name{width:50%; height:70%; font-size:150%; color:grey;}
		.submit{width:30%; height:60%; font-size:130%; color:brown;}
		.info{width:100%; height:84%; background:url(); }
	</style>
	<script language="javascript">

		function getXMLObject() //XML OBJECT
		{
			var xmlHttp = false;
			try 
			{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP") // For Old Microsoft Browsers
			}
			catch (e)
			{
				try
				{
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP") // For Microsoft IE 6.0+
				}
				catch (e2) {
					xmlHttp = false // No Browser accepts the XMLHTTP Object then false
				}
			}
			if (!xmlHttp && typeof XMLHttpRequest != 'undefined')
			{
				xmlHttp = new XMLHttpRequest(); //For Mozilla, Opera Browsers
			}	
			return xmlHttp; // Mandatory Statement returning the ajax object created
		}

		var xmlhttp = new getXMLObject();	//xmlhttp holds the ajax object

		function ajaxFunction(a)
		{
		//var getdate = new Date(); //Used to prevent caching during ajax call
			if(document.Doc.depart.value.length>3)
			{
				if(xmlhttp) 
				{ 
					xmlhttp.open("GET","SelectDoctor.jsp?depart=" + a); //gettime will be the servlet name
					xmlhttp.onreadystatechange = handleServerResponse;
					
					xmlhttp.send();
				}
			}
			else
			{
				//document.getElementById("NAME").innerHTML="no records found";
				var select=document.getElementById("NAME");
				var option = document.createElement("option");
				option.text = "No Records Found";
				select.add(option);
			}
		}

	function handleServerResponse()
	{
		if (xmlhttp.readyState == 4) 
		{
			if(xmlhttp.status == 200)
			{
				//document.getElementById("NAME").innerHTML=xmlhttp.responseText; //Update the HTML Form element 
				var select=document.getElementById("NAME");
				var option = document.createElement("option");
				option.text =xmlhttp.responseText;
				select.add(option);
				//select.options[select.options.length] = new Option(xmlhttp.responseText,xmlhttp.responseText);
				//.innerHTML=xmlhttp.responseText;
			}
			else
			{
				alert("Error during AJAX call. Please try again");
			}
		}
	}
</script>
</head>
<body>

	<div style="width:100%; height:100%; background-color:white;">
		<div style="width:100%; height:8%; background-color:white;">
		</div>
		<div style="width:100%; height:8%; background-color:white;">
			<div style="width:50%; height:100%; float:left;">
				<form method="get" action="DoctorData.jsp">
					<input type="text" name="docname" placeholder="Doctor Name" class="name">
					<input type="submit" value="submit" class="submit">
				</form>
			</div>
			<div style="width:50%; height:100%; float:left;">
				<form method="get" action="DoctorData.jsp" name="Doc">
					
					<select name="depart" class="name" onblur="ajaxFunction(this.value)">
							<option>Select Department</option>
							<option value="Neurology">Neurology</option>
							<option value="Dentist">Dentist</option>
							<option value="Heart Specialist">Heart Specialist</option>
							<option value="Ortho">Ortho</option>
							<option value="Gynaecology">Gynaecology</option>
							<option value="General Physician">General Physician</option>
							<option value="Emergency">Emergency</option>
					</select><br>
					<select name="Docname" class="name" id="NAME">
						<option></option>
					</select><br>
					<input type="submit" name="submit" value="Get Info" class="name">
				</form>
				
			</div>
		</div>
		
		<div id="err" style="width:100%; height:10%; background-color:red; color:white; display:none;">
			<h2 style="line-height:240%;"> &nbsp Doctor does not exist in our Database... Please check the name!</h2>
		</div>
		<script>
			function error()
			{
				document.getElementById("err").style.display="block";
			}
		</script>
	</div>
	
</body>