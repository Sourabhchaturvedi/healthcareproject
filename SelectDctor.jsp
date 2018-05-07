<%@ page import="java.sql.*" %>

<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>

<%
	String Depart = request.getParameter("depart");

	try
	{
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select username from DocTable where department='%"+Depart+"%'");
		rs=ps.executeQuery();
		boolean valid=false;
		String str="";
		while(rs.next())
		{
			str=rs.getString(1);
			out.print(str+"<br>");
	 	}
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>