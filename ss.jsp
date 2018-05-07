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
	String name="Agrawal";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select * from healthcare.DocTable");
		rs=ps.executeQuery();
		
		while(rs.next())
		{
			if(username.equals(rs.getString("username")))
			{
				
%>
				<table>
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(6)%></td>
						<td><%=rs.getString(7)%></td>
					</tr>
				</table>
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