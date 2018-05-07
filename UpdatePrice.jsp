<%@page import="java.sql.*,java.util.Properties,java.io.FileInputStream,java.io.IOException"%>

<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
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
		String medName=request.getParameter("mName");
		int money=0;
		try
		{
			FileInputStream inn=new FileInputStream("‪C:/Tomcat9.0/webapps/project/Database.properties");
			pro.load(inn);
			String dName=pro.getProperty("dbName");
			String URL=pro.getProperty("url");
			String USER=pro.getProperty("user");
			String password=pro.getProperty("pswd");
		
			Class.forName(dName);
			con=DriverManager.getConnection(URL,USER,password);
			ps=con.prepareStatement("select netprice,status from healthcare.orderrecord where customerName='"+username+"' and medicinename='"+medName+"' having status='pending'");
			rs=ps.executeQuery();
			while(rs.next())
			{
				money=rs.getInt(1);
			}
			out.print(money);
		}
		catch(SQLException e)
		{
			out.print(e);
		}
		catch(NullPointerException e)
		{
			out.print(e);
		}
		catch(IOException e)
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