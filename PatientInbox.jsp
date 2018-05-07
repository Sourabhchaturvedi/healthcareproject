<%@ page import="java.sql.*"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	boolean inspect=false;
	String Name;
	String Gender;
%>

<% 
	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma","no-cache");
	
	String username=(String)(session.getAttribute("Username"));
	if(username==null)
	{
		response.sendRedirect("PatientLogin.jsp");
	}
	else
	{	
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
			ps=con.prepareStatement("select username,name,gender from healthcare.patientdata");
			rs=ps.executeQuery();
			while(rs.next())
			{
				if(username.equals(rs.getString("username")))
				{
					Name=rs.getString("name");
					Gender=rs.getString("gender");
					break;
				}
			}
			
		}
	
		catch(Exception e)
		{
			out.print(e);
		}
		finally
		{
			ps.close();
			con.close();
		}

	}
%>

<head>

	<style>
		*{padding:0px; margin:0px;}
		.backgroundimage{background:url("pattt.jpg"); background-repeat:no-repeat; background-size:100% 100%;}
		.input{width:80%; height:20%; text-align:center; border:none; font-size:22px; color:blue;}
		.input:hover{background-color:blue; color:white;}
	</style>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Login.css">
</head>
<body>
	<div style="width:100%; height:100%;">
		<div style="width:60%; height:15%; background-color: #1ed2f4; float:left;">
				 <a href="Login.jsp"><img src="back.jpg" alt="img" style="border-radius:50%; height:80px; width:80px; float:left; margin-top:1%;"></a>
				<h2 style="float:left; margin-top:4%;">&nbsp &nbsp HEALTH CARE MANAGEMENT SYSTEM</h2>
		</div>
		<div style="width:40%; height:15%;float:left;">
			
			<%
				if(Gender.equals("male"))
				{
			%>
				<h2 >hello Mr. <%= Name %>  Welcome to your inbox</h2>	
			<button type="button" class="btn btn-primary"style=" background-color:yellow;color:red;float:right;" onclick="out()">LogOut</button>
			<%
				}
				else if(Gender.equals("female"))
				{
			%>
				<h2>hello Mam <%= Name %>  Welcome to your inbox</h2>	
			<%
				}
				else
				{
			%>
				<h2>hello <%= Name %>  Welcome to your inbox</h2>	
			<%
				}
			%>
			
		</div>
		<div style="width:100%; height:85%;">
			<div style="float:left; width:70%; height:110%;" class="backgroundimage">
			</div>
			<div style="float:left; width:30%; height:110%; background-color:rgba(0,225,225);">
				<img src="patt.jpg" alt="img" style="border-radius:10%; width:120px; height:100px; margin-top:10%;margin-left:30%;">
				<div style="float:left; width:100%; height:50%; background-color:rgba(0,225,225); margin-top:4%;">
					<form method="post" action="ReqApointment.jsp" style="text-align:center;">
						<input type="submit" value="Book An Appointment" class="input">
					</form>
					<form method="post" action="AddCart.jsp" style="text-align:center;">
						<input type="submit" value="Cart Medicines" class="input">
					</form>
					<form method="post" action="DoctorInfo.jsp" style="text-align:center;">
						<input type="submit" value="Get to Know your Doctor" class="input">
					</form>
					<form method="post" action="PatientProfileEdit.jsp" style="text-align:center;">
						<input type="submit" value="Edit your Profile" class="input">
					</form>
					</form>
					<form method="post" action="AppointmentReciept.jsp" style="text-align:center;">
						<input type="submit" value="Print Appointment Reciept" class="input">
					</form>
					<form method="post" action="OrderConfirm.jsp" style="text-align:center;">
						<input type="submit" value="Place Order" class="input">

							<form method="post" action="ApproveTest.jsp" style="text-align:center;">
						<input type="submit" value="Request Test" class="input">
						


					</form>
				</div>
			</div>
		</div>
		
			<script>
				function out()
				{
					
					window.location="LogOut.jsp";
				}
			</script>
	</div>
</body>