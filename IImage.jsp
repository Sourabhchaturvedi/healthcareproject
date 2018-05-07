<%@ page import="org.apache.commons.io.output.*,org.apache.commons.io.FileUtils"%>
<%@page import="java.util.Iterator,java.util.List" %>
<%@page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.util.*"%>
<%@page import="java.io.*,java.sql.*" %>

<script src="StaffInbox.jsp"></script>
<%!
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	FileInputStream fin;
	String filePath;
	File file ;
	String username;
	String pathh;
	boolean confirm;
%>

<%
	int maxFileSize = 5 * 1024 * 1024;
	int maxMemSize = 40 * 1024 * 1024;
	filePath = getServletContext().getInitParameter("imagDirectory");
	
		
	String Username=(String)(session.getAttribute("usernamee"));
	String DocUser=(String)(session.getAttribute("USername"));
	boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
    if (!isMultipartContent) 
	{
        out.println("File not uploaded");
        return;
    }
    
	
    DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(maxMemSize);
	factory.setRepository(new File("E:\\imageRepository"));
    ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax( maxFileSize );
	
	
	if(Username==null)
	{
		response.sendRedirect("Staff.jsp");
	}
	else
	{
		try
		{
			List<FileItem> fields = upload.parseRequest(request);
			
			Iterator<FileItem> it = fields.iterator();
			if (!it.hasNext())
			{
				out.println("No fields found");
				return;
			}
			
			while (it.hasNext()) 
			{
				FileItem fi = (FileItem)it.next();
				boolean isFormField = fi.isFormField();

				if (isFormField) 
				{
				}

				else
				{
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					if( fileName.lastIndexOf(".") >= 0 ) 
					{
						file = new File( filePath +File.separator+  DocUser +  fileName.substring( fileName.lastIndexOf("."))) ;
					}
					else
					{
						file = new File(filePath + File.separator + DocUser + fileName.substring(fileName.lastIndexOf(".")+1)) ;
					}
					fi.write(file); 
					pathh =file.toString();
					pathh=pathh.replace('\\','/');
					out.println(pathh);
				
				}
				
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql:///healthcare","root","super");
				ps=con.prepareStatement("update healthcare.Doctable set docimage='"+pathh+"' where username='"+DocUser+"'");
				ps.executeUpdate();
				confirm=true;
			}
		}
		catch(Exception e)
		{
			out.print(e);
		}
		finally
		{
		}
		if(confirm)
		{
%>
			<jsp:include page="StaffInbox.jsp"/>
			<script>
				textdis();
			</script>
<%
		}
		else
		{
			out.println("something went wrong file not uploaded");
		}
	}
%>

