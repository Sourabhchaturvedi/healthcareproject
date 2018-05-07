<%@ page import="java.sql.*"%>

<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
%>
	
<%
	String UserName=(String)(session.getAttribute("Username"));
	String address=request.getParameter("Address");
	String contact=request.getParameter("Contact");
	String password=request.getParameter("Password");
	boolean avail=false;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("update healthcare.patientdata set address='"+address+"',contact='"+contact+"',password='"+password+"' where username='"+UserName+"'");
		ps.executeUpdate();
%>
		<font color="black"><h2>Your profile has been Updated</h2></font>
		<jsp:include page="PatientInbox.jsp"/>
		
<%
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
				