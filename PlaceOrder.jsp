<%@page import="java.sql.*,java.util.Properties,java.io.FileInputStream,java.io.IOException"%>
<%@page import="java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat"%>

<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String[] med;
%>

<%
	String username=(String)(session.getAttribute("Username"));
	if(username==null)
	{
		response.sendRedirect("PatientLogin.jsp");
	}
	else
	{
		Properties pro = new Properties();
		med=request.getParameterValues("mName"); // used as its Return type is String []
		
		Date current=new Date();
		DateFormat convert = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String cnfrmDate = convert.format(current);
		
		try
		{
			FileInputStream inn=new FileInputStream("C:/Tomcat9.0/webapps/project/Database.properties");
		pro.load(inn);
			String dName=pro.getProperty("dbName");
			String URL=pro.getProperty("url");
			String USER=pro.getProperty("user");
			String password=pro.getProperty("pswd");
		
			Class.forName(dName);
			con=DriverManager.getConnection(URL,USER,password);
			for(int i=0;i<med.length;i++)
			{
				ps=con.prepareStatement("update healthcare.orderrecord set status='confirmed',datee='"+cnfrmDate+"' where customerName='"+username+"' and medicinename='"+med[i]+"'");
				ps.executeUpdate();
			}
			out.print("<font color=orange>Your Order has Been Confirmed</font color>");
%>
			<jsp:include page="OrderConfirm.jsp"/>
<%
		}
		catch(SQLException e)
		{
			out.print(e);
		}
		catch(NullPointerException e)
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