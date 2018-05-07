<%
	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma","no-cache");
%>

<%@page import="java.sql.*"%>

<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
%>
<html>
<head>
	<style>
		*{padding:0px; margin:0px;}
		.back{background:url("staff17.jpg"); background-repeat:no repeat; background-size:100% 100%;}
		.butn{width:80%; height:10%; font-size:120%; color:rgba(0,0,255); background-color:rgba(0,255,255); margin:2%;}
		.butn:hover{background-color:rgb(0,255,255); color:white; }
		.detail{margin-left:4%; width:90%; height:94%; background-color:rgba(0,0,0,0.2); box-shadow:3px 4px rgba(0,0,0,0.4); display:none;}
		.image{border-radius:50%; width:150px; height:150px; margin-top:15px; margin-left:40%;}
		.input{width:100%; height:100%; text-align:center; border:none; font-size:19px; color:green;}
		.input:hover{background-color:blue; color:white;}
		.content{width:25%; height:10%; float:left;color:rgba(0,0,255); }
		.contentDEL{width:50%; height:100%; float:left;color:rgba(0,0,255);}
		.inputRadio{width:6%; height:6%; text-align:center; border:none; font-size:19px; color:green;}
		.inputRadio:hover{background-color:blue; color:white;}
		.deldiv{width:60%; height:60%; background-color:rgb(0,128,128,0.5); margin-left:19%; border-radius:2%; box-shadow:2px 2px rgba(0,0,0,0.6); display:none;}
		table,th{border:1px solid black; border-collapse:collapse;}
	</style>


  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Login.css">


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
			catch (e2) 
			{
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
			if(document.staffform.Usernamee.value.length >1)
			{
				if(xmlhttp) 
				{ 
					xmlhttp.open("POST","executecommands.jsp?Usernamee=" + a); //gettime will be the servlet name
					xmlhttp.onreadystatechange = handleServerResponse;
					
					xmlhttp.send();
				}
			}
			else
			{
				document.getElementById("disp").innerHTML="no records found";
			}
	}

	function handleServerResponse() 
	{
		if (xmlhttp.readyState == 4) 
		{
			if(xmlhttp.status == 200) 
			{
				//document.getElementById("disp").innerHTML=xmlhttp.responseText; //Update the HTML Form element 
				document.getElementById("disp").innerHTML=xmlhttp.responseText;
			}
			else
			{
				alert("Error during AJAX call. Please try again");
			}
		}
	}
</script>
</head>

<%
		String user=(String)(session.getAttribute("usernamee"));
		if(user==null)
		{
			response.sendRedirect("Staff.jsp");
		}
		else
		{
%>

<body>
	<div style="width:100%; height:100%;">
		<div style="width:100%; height:12%; color:blue; text-align:right;">
			<h3 style="line-height:240%">Welcome <%=session.getAttribute("usernamee")%> to your Inbox &nbsp</h3>
			<button Class="btn btn-primary" onclick="logout()"style="width:10%; height:40% ;">LogOut</button>
		</div>
		<div id="tex" style="width:100%; height:10%; font-size:30px; display:none; color:white; background-color:black; text-align:center; line-height:200%;">
			<h1>Hello</h1>
		</div>
		<div style="width:100%; height:88%; float:left;" >
			<div style="width:70%; height:100%; float:left;" class="back" >
				<div style="width:90%; height:90%;">
					<%--try
					{
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
						ps=con.prepareStatement("select * from healthcare.DocTable");
						rs=ps.executeQuery();
						while(rs.next())
						{
%>
							<form method="post" action="DeleteConfirm.jsp">
								<table style="width:100%;">
									<tr rowspan="3">
										<th><input type="radio" name="bio" value="<%=rs.getString(2)%>"><%=rs.getInt(1)%></th>
										<th colspan="4"><%=rs.getString(2)%></th><th><%=rs.getString(3)%></th><th><%=rs.getInt(4)%></th>
										<th><%=rs.getString(5)%></th><th><%=rs.getString(6)%></th><th><%=rs.getString(7)%></th>
										<th colspan="4"><%=rs.getString(8)%></th><th><%=rs.getString(9)%></th><th><%=rs.getString(10)%></th>
									</tr>
								</table>
<%
						}
%>
							<input type="submit" name="sub" value="Delete">
							</form>
<%
					}
					catch(SQLException e)
					{
						out.print(e);
					}
					catch(Exception e)
					{
						out.print(e);
					}
					--%>
%>
					
				</div>
				<div class="detail" id="doc">
						<img src="doc11.jpg" alt="im" class="image">
					
						<form method="post" action="DocStaffDatabase.jsp"  style="text-align:center; margin-top:3%;">
							<div class="content">
								<h2>Username:</h2>
							</div>
							<div class="content">
								<input type="email" name="Usernamee" placeholder="username" autofocus class="input">
							</div>
							<div class="content">
								<h2>Password:</h2>
							</div>
							<div class="content">
								<input type="password" name="Password" placeholder="password" class="input">
							</div>
							<div class="content">
								<h2>Contact No:</h2>
							</div>
							<div class="content">
								<input type="text" name="Phone" placeholder="PhoneNo" class="input">
							</div>
							<div class="content">
								<h2>Address:</h2>
							</div>
							<div class="content">
								<input type="text" name="Address" placeholder="address" class="input">
							</div>
							<div class="content">
								<h2>JoiningDate:</h2>
							</div>
							<div class="content">
								<input type="date" name="Joiningdate" min="2000/01/01" class="input">
							</div>
							<div class="content">
								<h2>Gender:</h2>
							</div>
							<div class="content">
								<select name="Gender" class="input">
									<option value="male">Male</option>
									<option value="female">Female</option>
									<option value="transgender">Transgender</option>
								</select>
							</div>
							<div class="content">
								<h2>Qualification:</h2>
							</div>
							<div class="content">
								<input type="text" name="Qualification" placeholder="Qualification" class="input">
								<input type="hidden" name="var" value="ok">
							</div>
							<div class="content">
								<h2>Department:</h2>
							</div>
							<div class="content">							
								<select name="depart" class="input">
									<option>Neurology</option>
									<option>Dentist</option>
									<option>Heart Specialist</option>
									<option>Ortho</option>
									<option>Gynaecology</option>
									<option>General Physician</option>
									<option>Emergency</option>
								</select>
							</div>
							<input type="submit" name="submit" value="submit" style="width:50%; height:10%;color:white; background-color:rgba(0,0,255); margin-top:5%;">
				
						</form>
			
				</div>
				<div class="detail" id="staff">
						<img src="staff31.jpg" alt="im" class="image">
					
						<form method="post" action="StaffDatabase.jsp" name="staffform" style="text-align:center; margin-top:3%;">
							<div class="content">
								<h2>Username:</h2>
							</div>
							<div class="content">
								<input type="email" name="Usernamee"autofocus placeholder="username" class="input" onblur="ajaxFunction(this.value)"><span id="disp" name="disp"></span>
							</div>
							<div class="content">
								<h2>Password:</h2>
							</div>
							<div class="content">
								<input type="password" name="Password" placeholder="password" class="input">
							</div>
							<div class="content">
								<h2>Contact No:</h2>
							</div>
							<div class="content">
								<input type="text" name="Phone" placeholder="PhoneNo" class="input">
							</div>
							<div class="content">
								<h2>Address:</h2>
							</div>
							<div class="content">
								<input type="text" name="Address" placeholder="address" class="input">
							</div>
							<div class="content">
								<h2>JoiningDate:</h2>
							</div>
							<div class="content">
								<input type="date" name="Joiningdate" min="2000/01/01" class="input">
							</div>
							<div class="content">
								<h2>Gender:</h2>
							</div>
							<div class="content">
								<select name="Gender" class="input">
									<option value="male">Male</option>
									<option value="female">Female</option>
									<option value="transgender">Transgender</option>
								</select>
							</div>
							<div class="content">
								<h2>Qualification:</h2>
							</div>
							<div class="content">
								<input type="text" name="Qualification" placeholder="Qualification" class="input">
								<input type="hidden" name="var" value="kk">
							</div>
							<div class="content">
								<h2></h2>
							</div>
							
							<input type="submit" name="submit" value="submit" style="width:50%; height:10%; background-color:rgba(0,255,255,0.7); margin-top:5%;">
				
						</form>
			
				</div>
				<div class="deldiv" id="texx">d
					<form style="margin-top:15%;" method="post" action="DeleteDoc.jsp">
						<div style="width:100%; height:20%; ">
							<div class="contentDEL">
									<h2>&nbsp &nbsp UserId To Delete:</h2>
							</div>
							<div class="contentDEL">
									<input type="text" name="userNamE" placeholder="UserId To Delete:" autofocus class="input">
									
							</div>
						</div>
						<div style="width:100%; height:20%;">
							<div class="contentDEL">
									<h2>&nbsp &nbsp Your Password:</h2>
							</div>
							<div class="contentDEL">
									<input type="password" name="pass" placeholder="Your Password:" class="input">
									
							</div>
						</div>
						<input type="radio" name="mem" value="Doc" class="inputRadio">Doctor
						<input type="radio" name="mem" value="Staff" class="inputRadio">Staff
						<input type="submit" name="sub" value="Delete" style="width:50%; height:20%; background-color:rgba(0,255,255,0.7); margin-left:25%; margin-top:5%;">
					</form>
				</div>			
			</div>
			<div style="width:29%; height:100%;background-color:; float:left;" >
				<button onclick="addDoctor();" class="butn" style="margin-top:30%;">TO Add A New Doctor</button>
				<button onclick="addStaff();" class="butn">TO Add A New Staff Member</button>

				<button onclick="textdis();" class="butn">Delete A Staff Member</button>
				<a href="ViewImage.html"><button class="butn">View Uploaded Pic</button></a>
			</div>
			
		</div>
			<script>
				function addDoctor()
				{
					document.getElementById("doc").style.display="block";
					document.getElementById("staff").style.display="none";
				}
				function addStaff()
				{
					document.getElementById("staff").style.display="block";
					document.getElementById("doc").style.display="none";
				}
				function logout()
				{
					window.location="LogoutStaff.jsp";
				}
				function textdis()
				{
					document.getElementById("texx").style.display="block";
					document.getElementById("tex").innerHTML="Image Has Been Successfully Added in Database";
				}
			</script>
	</div>
</body>
<%
		}
%>
</html>
