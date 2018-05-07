<%@page import="java.sql.*"%>

<%!
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
%>

<%
	session.setAttribute("pwd",request.getParameter("pass"));
	String passwrd=(String)(session.getAttribute("pwd"));
	boolean check=false;
	String find=request.getParameter("find");
	
	String Name=(String)(session.getAttribute("USERname"));
	
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
						
						check=true;
						break;
						
					}
				}
				if(check)
				{
						ps=con.prepareStatement("delete from DocTable where username='"+Name+"'");
						ps.executeUpdate();
						session.removeAttribute("pwd");
						session.removeAttribute("USERname");
						out.print(Name +" Has Been Deleted from Doctor's Records");
%>
						<jsp:include page="StaffInbox.jsp"/>
<%
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