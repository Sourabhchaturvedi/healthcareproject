<%@ page import="java.sql.*"%>

<%! 
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	int no;
%>

<%	
	String appoint="HCMS";
	session.setAttribute("nos",no++);
	String appointno=appoint+session.getAttribute("nos");
	
	String UserName=(String)(session.getAttribute("Username"));
	String Phone=request.getParameter("phone");
	String Depart=request.getParameter("depart");
	String Datee=request.getParameter("date");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("update healthcare.patientdata set depart='"+Depart+"',datee='"+Datee+"',appointno='"+appointno+"' where username='"+UserName+"'");
		ps.executeUpdate();
		
		
%>		
		<jsp:forward page="PatientInbox.jsp"/>
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