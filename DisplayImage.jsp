<%@ page import="java.io.*,java.sql.*"%>

<%!
	byte[] byteArray;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String Path;
%>
<%
	String DocName=request.getParameter("Email");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
		ps=con.prepareStatement("select docimage from healthcare.DocTable where username='"+DocName+"'");
		rs=ps.executeQuery();
		while(rs.next())
		{
			Path=rs.getString("docimage");
		}
		File file=new File(Path);
		FileInputStream in=new FileInputStream(file);
		
		byteArray= new byte[(int)file.length()];
		while(in.read(byteArray)> -1)
		{}
		
		
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
<body>
<div style="width:100%; height:100%;">

	<div style="width:20%; height:20%;">
		<%
			response.setContentType("image/jpg");
			response.getOutputStream().write(byteArray);     
			response.getOutputStream().flush();
			response.getOutputStream().close();
		%>
	</div>
</div>
</body>
