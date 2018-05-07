<%@ page import="java.sql.*"%>
<script src="PatientLogin.jsp"></script>

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
		<jsp:include page="PatientLogin.jsp"/>
<%
	}
	else
	{
		
	
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
			ps=con.prepareStatement("select username,password,lastlogin from healthcare.patientdata");
			rs=ps.executeQuery();
		
			while(rs.next())
			{
				if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
				{
					long login=System.currentTimeMillis();
					if(login>(rs.getLong("lastlogin")))
					{	
						session.setAttribute("Username",username);
						ps=con.prepareStatement("update healthcare.patientdata set lastlogin="+login+" where username='"+username+"'");
						ps.executeUpdate();
						inspect=true;
						break;
					}
					else
					{
						out.print("your session has expired Please login again");
%>
						<jsp:include page="PatientLogin.jsp"/>
<%
					}
				}
			}
		
			if(inspect)
			{
				response.sendRedirect("PatientInbox.jsp");
			}
			else
			{
%>
			
				<jsp:include page="PatientLogin.jsp"/>
				<script>
					message();
				</script>

<%
			}
		}
		catch(Exception e)
		{
			response.sendRedirect("PatientLogin.jsp");
			
		}
		finally
		{
			con.close();
		}
	}

%>