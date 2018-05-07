<%@page import="java.sql.*,java.util.Date,java.util.Properties,java.io.FileInputStream,java.io.IOException"%>
<%@page import="java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat"%>

<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>

<%
	String username=(String)(session.getAttribute("Username"));

	Properties pro=new Properties();
	
	String medicineName=request.getParameter("Name");
	int quantity=Integer.parseInt(request.getParameter("Units"));
	String manufacture=request.getParameter("Seller");
	int unitPrice=Integer.parseInt(request.getParameter("Price"));
	
	
	Date current=new Date();
	DateFormat convert = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String crDate = convert.format(current);
	
	String status="pending";
	int netPrice=0;
	int content=0;
	int perPiece=0;
	boolean present=true;
	
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
		ps=con.prepareStatement("select medicinename,customerName,status,quantity from healthcare.orderrecord");
		rs=ps.executeQuery();
		while(rs.next())
		{
			if(medicineName.equals(rs.getString(1)) && username.equals(rs.getString(2)) && status.equals(rs.getString(3)))
			{	
				quantity=quantity+rs.getInt(4);
				ps=con.prepareStatement("update healthcare.orderrecord set quantity='"+quantity+"',datee='"+crDate+"' where customerName='"+username+"' and medicinename='"+medicineName+"' and status='pending' ");
				ps.executeUpdate();
				present=false;
				break;
			}
		}
		if(present)
		{
			ps=con.prepareStatement("insert into healthcare.OrderRecord(medicinename,quantity,manufacturename,unitprice,datee,status,customerName) values(?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1,medicineName);
			ps.setInt(2,quantity);
			ps.setString(3,manufacture);
			ps.setInt(4,unitPrice);
			ps.setString(5,crDate);
			ps.setString(6,status);
			ps.setString(7,username);
			ps.executeUpdate();
		}
	
		ps=con.prepareStatement("select quantity,unitprice,status from healthcare.orderrecord where customerName='"+username+"' and medicinename='"+medicineName+"' having status='pending'");
		rs=ps.executeQuery();
		while(rs.next())
		{
			content=rs.getInt(1);
			perPiece=rs.getInt(2);
		}
		
		netPrice=content*perPiece;
		ps=con.prepareStatement("update healthcare.orderrecord set netprice='"+netPrice+"' where customerName='"+username+"' and medicinename='"+medicineName+"' and status='pending'");
		ps.executeUpdate();
		out.print(medicineName+" has been sucessfully added to cart");
%>
		<jsp:include page="AddCart.jsp"/>
<%
	}
	catch(NullPointerException e)
	{
		out.print(e);
	}
	catch(NumberFormatException e)
	{
		out.print(e);
	}
	catch(SQLException e)
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
%>