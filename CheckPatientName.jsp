<%@page import="java.sql.*"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
%>

<%
	String patientname=request.getParameter("username");

	boolean valid=false;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select username from patientdata where username like'%"+patientname+"%'");
		rs=ps.executeQuery();
		String str="";
		while(rs.next())
		{
			str=rs.getString(1);
			if(patientname.equalsIgnoreCase(str))
			{
				valid=true;
				break;
			}
		}
		
		if(valid)
		{
			out.print("<font color=red>Username Already Exists!!!</font>");
		}
		else
		{
			out.print("<font color=orange>Username Available!!!</font>");
			
		}
	}
	catch(SQLException e)
	{
		out.print(e);
	}
	catch(NullPointerException e)
	{
		out.print(e);
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