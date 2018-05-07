<%@ page import="java.sql.*"%>
<script src="Staff.jsp"></script>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	boolean inspect=false;
%>

<% 
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	if(username.isEmpty() || password.isEmpty())
	{
		out.print("Please Provide Input");
%>
		<jsp:include page="Staff.jsp"/>
<%
	}
	else
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
			ps=con.prepareStatement("select username,password from healthcare.StaffTable");
			rs=ps.executeQuery();
		
			while(rs.next())
			{
				if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
				{
					session.setAttribute("usernamee",username);
					inspect=true;
					break;
				}
			}
		
			if(inspect)
			{
				response.sendRedirect("StaffInbox.jsp");
			}	
			else
			{
%>
			
				<jsp:include page="Staff.jsp"/>
				<script>
					message();
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
	}
%>