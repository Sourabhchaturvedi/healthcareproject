<%@page import="java.sql.*"%>

<%!
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	boolean check;
%>

<%
	String userNAme=request.getParameter("userNamE");
	String passwrd=request.getParameter("pass");
	String member=request.getParameter("mem");
	out.print(userNAme+passwrd);
	String user=(String)(session.getAttribute("usernamee"));
		if(user==null)
		{
			response.sendRedirect("Staff.jsp");
		}
		else
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
				ps=con.prepareStatement("select password from healthcare.Stafftable where username='"+user+"'");
				rs=ps.executeQuery();
				while(rs.next())
				{
					if(passwrd.equals(rs.getString("password")))
					{
						out.print(rs.getString("password"));
						check=true;
						break;
						
					}
				}
				if(check)
				{
					if(member.equals("Doc"))
					{
						ps=con.prepareStatement("delete from DocTable where username='"+userNAme+"'");
						ps.executeUpdate();
						out.print(userNAme +" Has Been Deleted from Doctor's Records");
%>
						<jsp:include page="StaffInbox.jsp"/>
<%
					}
					else if(member.equals("Staff"))
					{
						ps=con.prepareStatement("delete from Stafftable where username='"+userNAme+"'");
						ps.executeUpdate();
						out.print(userNAme +" Has Been Deleted from Staff's Records");
%>
						<jsp:include page="StaffInbox.jsp"/>
<%
					}
					else
					{
						out.print(userNAme +" is not Available in records");
%>	
						<jsp:include page="StaffInbox.jsp"/>
<%
					}
				
				}
				else
				{
						out.print("Your Password is Incorrect please provide a valid password");
%>
						<jsp:include page="StaffInbox.jsp"/>
<%
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