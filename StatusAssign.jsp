<%@page import="java.sql.*"%>

<%!
 Connection con;
 PreparedStatement ps;
 ResultSet rs;
 boolean yes;
%>

<%
	String ot=request.getParameter("pass");
	String Docname=(String)(session.getAttribute("Username"));
	if(Docname==null)
	{
		response.sendRedirect("Doctor.html");
	}
	else
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
			ps=con.prepareStatement("select otp from healthcare.DocTable where username='"+Docname+"'");
			rs=ps.executeQuery();
			while(rs.next())
			{
				if(ot.equals(rs.getString("otp")))
				{
					ps=con.prepareStatement("update DocTable set status='complete' where username='"+Docname+"'");
					ps.executeUpdate();
					yes=true;
					break;
				}
			}
			if(yes)
			{
					out.print("You Have Been Registered Sucessfully");
%>
					<jsp:include page="Doctor.html"/>
<%
			}
			else
			{
				response.sendRedirect("Doctor.html");
			}
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
	}
%>