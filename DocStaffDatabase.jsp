<%@ page import="java.sql.*,java.util.Random,java.util.Properties"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;

	
%>

<%
	
	int value=0;	
	String Username=(String)(session.getAttribute("usernamee"));
	
	
	String username=request.getParameter("Usernamee");
	String password=request.getParameter("Password");
	String phone=request.getParameter("Phone");
	String address=request.getParameter("Address");
	String joiningdate=request.getParameter("Joiningdate");
	String gender=request.getParameter("Gender");
	String qualification=request.getParameter("Qualification");
	String var=request.getParameter("var");
	String departt=request.getParameter("depart");
	
	session.setAttribute("USername",username);
	if(Username==null)
	{
		response.sendRedirect("Staff.jsp");
	}
	else
	{
		
		


		try
		{	
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
				if(var.equals("ok"))
				{	
					ps=con.prepareStatement("insert into DocTable(username,password,phone,address,joiningdate,gender,qualification,department,otp,status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
					ps.setString(1,username);
					ps.setString(2,password);
					ps.setInt(3,Integer.parseInt(phone));
					ps.setString(4,address);
					ps.setString(5,joiningdate);
					ps.setString(6,gender);
					ps.setString(7,qualification);
					ps.setString(8,departt);
					ps.setInt(9,newOTP);
					ps.setString(10,position);
					ps.executeUpdate();
	%>
					<jsp:forward page="AddImage.jsp"/>
	<%
				}
				else
				{
					ps=con.prepareStatement("insert into staffTable values(?, ?, ?, ?, ?, ?, ? )");
					ps.setString(1,username);
					ps.setString(2,password);
					ps.setInt(3,Integer.parseInt(phone));
					ps.setString(4,address);
					ps.setString(5,joiningdate);
					ps.setString(6,gender);
					ps.setString(7,qualification);
				
	
					ps.executeUpdate();
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

		