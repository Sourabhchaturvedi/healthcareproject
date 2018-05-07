<%@ page import="java.sql.*"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;

	
%>

<%
	boolean avail=false;
	String name=request.getParameter("docname");
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
				avail=true;
%>
				<head>
					<style>
						.rowA{height:12%; width:80%; border:1px solid black; background-color:rgb(0, 255, 255); line-height:100%; margin-left:10%; border-radius:8%;}
						.rowB{height:12%; width:80%; background-color:white; line-height:100%; margin-left:10%; border:1px solid black; border-radius:5%;}
						.inside{width:50%; height:100%; float:left;}
					</style>
				</head>
				<body>
					<div style="width:100%; height:10%; color:rgb(0, 128, 128);; text-align:center;">
						<h1>Dr.<%= rs.getString(1)%>'s Complete Details</h1>
					</div>
					<div style="width:50%; height:80%; margin-left:25%; margin-top:3%;">
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
								<h3>&nbsp Joining: &nbsp</h3>
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
				</body>
<%	
				break;
			}
		}
		
		if(avail==false)
		{
%>
			<jsp:include page="DoctorInfo.jsp"/>
			<script>
				error();
			</script>

<%
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