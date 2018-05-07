<%@ page import="java.sql.*"%>
<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;

%>

<%
	boolean valid=false;
	String username=request.getParameter("username");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String contact=request.getParameter("contact");
	String password=request.getParameter("password");
	String premed=request.getParameter("premed");
	String gender=request.getParameter("gender");
	String dob=request.getParameter("dob");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select username from patientdata");
		rs=ps.executeQuery();
		
		while(rs.next())
		{
			
			if(username.equals(rs.getString(1)))
			{
				valid=true;
				break;
			}
		}
		
		
		if(valid)
		{
			out.print("Username Already Exists");
%>
			<jsp:include page="RegisterPatient.html"/>
<%
		}
		else
		{
			ps=con.prepareStatement("insert into patientdata(username,name,address,contact,password,premed,gender,dateofbirth) values(?, ?, ?, ?, ?, ?, ?, ?)");
		
			ps.setString(1,username);
			ps.setString(2,name);
			ps.setString(3,address);
			ps.setInt(4,Integer.parseInt(contact));
			ps.setString(5,password);
			ps.setString(6,premed);
			ps.setString(7,gender);
			ps.setString(8,dob);
			ps.executeUpdate();
%>	
			<font color="orange"><h3>Member Added Successfully</h3></font>
			<jsp:include page="RegisterPatient.html"/>
<%		}
	}
	catch(Exception e)
	{
		out.print(e);
	}
	finally
	{
		ps.close();
		con.close();
	}
%>