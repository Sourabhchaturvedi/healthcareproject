<%@ page import="java.sql.*"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	
%>

<% 
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	boolean inspect=false;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select username,password from healthcare.DocTable");
		rs=ps.executeQuery();
		
		while(rs.next())
		{
			if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
			{
				session.setAttribute("Username",username);
				inspect=true;
				break;
			}
		}
		
		if(inspect)
		{
%>
			<jsp:forward page="DocInbox.jsp"/>
<%
		}
		else
		{
%>
			<font color="red"><h2>Incorrect Username or Password</h2></font>
			<jsp:include page="Doctor.html"/>
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