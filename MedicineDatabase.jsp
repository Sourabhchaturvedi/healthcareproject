<%@page import="java.sql.*"%>

<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>

<%
	String medName= request.getParameter("Name");
	String ManuName="";
	String Uprice="";
	String mName="<input type='text' value='Manufacturer Name' disabled class='medi'>";
	String price="<input type='text' value='Per Unit Price' disabled class='medi'>";
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select maufacName,unitprice from Medicines where name='"+medName+"'");
		rs=ps.executeQuery();
		while(rs.next())
		{			
			ManuName="<input type='text' name='Seller' class='medi' value='"+rs.getString(1)+"'><br>";
			Uprice="<input type='number' name='Price' class='medi' value='"+rs.getString(2)+"'><br>";
		}
		out.print(mName+ManuName);
		out.print(price+Uprice);
	}
	catch(NullPointerException e)
	{
		out.print(e);
	}
	catch(SQLException e)
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