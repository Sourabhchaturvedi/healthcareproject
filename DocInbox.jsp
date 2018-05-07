<%@ page import="java.sql.*"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;

	
%>

<%

	String name=(String)(session.getAttribute("Username"));
	out.print(name);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select * from healthcare.DocTable");
		rs=ps.executeQuery();
		
		while(rs.next())
		{
			if(name.equals(rs.getString("username")))
			{
  %>
			<html>
				<head>
				
					<style>
						*{padding:0px; margin:0px;}
						.rowA{height:12%; width:80%; border:1px solid black; background-color:rgb(0, 255, 255); line-height:350%; margin-left:10%; border-radius:8%;}
						.rowB{height:12%; width:80%; background-color:white; line-height:350%; margin-left:10%; border:1px solid black; border-radius:5%;}
						.inside{width:50%; height:100%; float:left;}
						.butt{background:url("blank.jpg"); background-repeat:no-repeat; background-size:100% 100%; width:90px; height:90px; border-radius:50%; float:right;}
						.directive{width:100%; height:33%; text-align:ce}
						
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

					</style>
				</head>
			<body>
				<div style="width:100%; height:100%;">
					<div style="width:100%; height:15%;">
						<div style="width:80%; height:100%; color:rgb(0, 128, 128); text-align:center; float:left;">
							<h1>Dr.<%= rs.getString(1)%>'s Complete Details</h1>
						</div>

						<div style="height:100%; width:20%; float:left; background-color:grey; position:relative;">
							
							<button type="button" class="butt" onclick="extra()">
							</button>
							<div id="ex" style="width:80%; height:180%; background-color:orange; position:absolute; top:100%; right:0; z-index:10; display:none;">
						
									<button type="button" onclick="home()" class="directive btn btn-primary">Home</button><br>
									<button type="button" onclick="menu()" class="directive  btn-primary">Logout</button><br>
									
							</div>
								<script>
								 function extra()
								 {
									 document.getElementById("ex").style.display="block";
								 }
								 function menu()
								 {
									 <%
										
									session.invalidate();%>
									 window.location="Doctor.html";
								 }
								</script>
						</div>
					</div>
					<div style="width:50%; height:85%; margin-left:25%; ">
						<div class="rowA">
							<div class="inside">
								<h3>&nbsp Name: &nbsp</h3>
							</div>
							<div class="inside">
								<h3><%= rs.getString(1)%></h3>
							</div>
						</div>
						<div class="rowB">
							<div class="inside">
								<h3>&nbsp Password: &nbsp</h3>
							</div>
							<div class="inside">
								<h3><%= rs.getString(2)%></h3>
							</div>
						</div>
						<div class="rowA">
							<div class="inside">
								<h3>&nbsp Contact No: &nbsp</h3>
							</div>
							<div class="inside">
								<h3><%= rs.getString(3)%></h3>
							</div>
						</div>
						<div class="rowB">
							<div class="inside">
								<h3>&nbsp Address: &nbsp</h3>
							</div>
							<div class="inside">
								<h3><%= rs.getString(4)%></h3>
							</div>
						</div>
						<div class="rowA">
							<div class="inside">
								<h3>&nbsp Joining Date: &nbsp</h3>
							</div>
							<div class="inside">
								<h3><%= rs.getString(5)%></h3>
							</div>
						</div>
						<div class="rowB">
							<div class="inside">
								<h3>&nbsp Gender: &nbsp</h3>
							</div>
							<div class="inside">
								<h3><%= rs.getString(6)%></h3>
							</div>
						</div>
						<div class="rowA">
							<div class="inside">
								<h3>&nbsp Qualification: &nbsp</h3>
							</div>
							<div class="inside">
								<h3><%= rs.getString(7)%></h3>
							</div>
						</div>
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
		con.close();
	}
%>