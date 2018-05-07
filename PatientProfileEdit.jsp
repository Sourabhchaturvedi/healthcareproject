<%@ page import="java.sql.*"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	String username;
	String name;
	String address;
	String contact;
	String password;
	String premed;
	String gender;
	String dob;
	
%>

<%
	String UserName=(String)(session.getAttribute("Username"));
	boolean avail=false;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select username,name,address,contact,password,premed,gender,dateofbirth from healthcare.patientdata");
		rs=ps.executeQuery();
		
		while(rs.next())
		{
			if(UserName.equals(rs.getString("username")))
			{
				avail=true;
				username=rs.getString(1);
				name=rs.getString(2);
				address=rs.getString(3);
				contact=rs.getString(4);
				password=rs.getString(5);
				premed=rs.getString(6);
				gender=rs.getString(7);
				dob=rs.getString(8);
				
			
%>
<head>
	<style>
		*{padding:0px; margin:0px;}
		.rowA{height:12%; width:80%; border:1px solid black; background-color:rgb(0, 255, 255); line-height:100%; margin-left:10%; border-radius:8%;}
		.rowB{height:12%; width:80%; background-color:white; line-height:100%; margin-left:10%; border:1px solid black; border-radius:5%;}
		.inside{width:50%; height:100%; float:left; margin-top:0.5%;}
		.input{width:40%; height:10%; text-align:center; color:blue; background-color:white; margin-left:20%;}
	</style>
</head>
<body>
	<div style=" width:100%; height:100%;">
		<div style=" width:100%; height:15%; background-color:rgba(0,0,0,0.2);">
			<img src="back.jpg" alt="img" style="border-radius:50%; height:60px; width:60px; float:left; margin-top:1%;">
				<h2 style="float:left; margin-top:3%;">&nbsp &nbsp HEALTH CARE MANAGEMENT SYSTEM</h2>
		</div>
		<div style=" width:100%; height:85%;">
			<div style=" width:60%; height:80%; background-color:rgba(0,0,0,0.2); text-align:ceter; margin-left:20%;">
				<form method="post" action="PatientEditing.jsp">
					<h2 style="margin-left:20%;">UserName: </h2><input type="text" name="Username" value="<%= username%>" disabled class="input">
					<h2 style="margin-left:20%;">UserName: </h2><input type="text" name="Name" value="<%= name%>" disabled class="input"><br>
					<h2>UserName: </h2><input type="text" name="Address" value="<%= address%>" class="input"><br>
					<h2>UserName: </h2><input type="text" name="Contact" value="<%= contact%>" class="input"><br>
					<input type="text" name="Password" value="<%= password%>" class="input"><br>
					<input type="text" name="Premed" value="<%= premed%>" disabled class="input"><br>
					<input type="text" name="Gender" value="<%= gender%>" disabled class="input"><br>
					<input type="text" name="Dob" value="<%= dob%>" disabled class="input"><br>
					<input type="submit" name="edit" value="Edit your Profile" class="input">
				</form>
			</div>
		</div>	
</body>

<%
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
%>