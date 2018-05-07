<%@ page import="java.sql.*"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	boolean inspect=false;
%>

<% 
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	out.print(username+password);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select * from healthcare.DocTable");
		rs=ps.executeQuery();
		
		while(rs.next())
		{
			if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
			{
				session.setAttribute("Username",username);
				if(rs.getString("status").equals("complete"))
				{
					
					inspect=true;
					break;
				}
				else
				{
					response.sendRedirect("StatusCheck.jsp");
				}
			}
		}
		
		if(inspect)
		{
			response.sendRedirect("DocInbox.jsp");
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
		ps.close();
		con.close();
	}

%>