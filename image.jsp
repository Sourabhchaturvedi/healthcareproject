<%@ page import="org.apache.commons.io.output.*"%>
<%@page import="java.util.Iterator,java.util.List" %>
<%@page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.util.*"%>
<%@page import="java.io.*,java.sql.*" %>

<%! 
Connection con;
PreparedStatement ps;
ResultSet rs;
private String filePath;
private File file ;
%>

<%
	private int maxFileSize = 5 * 1024 * 1024;
	private int maxMemSize = 40 * 1024 * 1024;
	filePath = getServletContext().getInitParameter("file-upload");
	
	boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
    if (!isMultipartContent) 
	{
        out.println("You are not trying to upload<br/>");
        return;
    }
    out.println("You are trying to upload<br/>");
	
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    try 
	{
        List<FileItem> fields = upload.parseRequest(request);
        out.println("Number of fields: " + fields.size() + "<br/><br/>");
        Iterator<FileItem> it = fields.iterator();
        if (!it.hasNext())
        {
			out.println("No fields found");
            return;
        }
        out.println("<table border=\"1\">");
        while (it.hasNext()) 
        {
			boolean isFormField = fileItem.isFormField();

            if (isFormField) 
            {


				out.println("<td>regular form field</td><td>FIELD NAME: " + fileItem.getFieldName() +     "<br/>STRING: " + fileItem.getString() );                   out.println("</td>");*/
            }

            else
            {
                String s = fileItem.getName().substring(fileItem.getName().lastIndexOf("\\")+1);
                fileItem.write(new File("F:\\Applicationcalendar\\EventManagementt\\personphoto\\" + s ));
                out.println(s);
                fileItem.getOutputStream().close();
                out.println("</td>");
                try
                {
					Class.forName("com.mysql.jdbc.Driver");
					con= DriverManager.getConnection("jdbc:mysql://192.168.200.171:3306/eventcalendar","ecadmin","ecroot");

                    ps=con.prepareStatement("insert into resource_person values(?,?,?,?,?,?,?,?)");

                        FileInputStream fin=new FileInputStream("F:\\Applicationcalendar\\EventManagementt\\personphoto\\"+s);
                        /*out.println(fin.available());     */
                                      

                        ps.setBinaryStream(8,fin,fin.available());
                        int i=ps.executeUpdate();
                /*      System.out.println(i+" records affected");*/

                    if(i==1)
                    {
                    %>
                        <html>
                            <head>
                            <script type="text/javascript">
                            alert("Record Insert Succssfully ");
                            </script></head>

                            <body>
                            </body>
                            </html>
                            <%
                    }
                    else
                    {
                    %>
                        <html>
                        <head>
                        <script type="text/javascript">
                        alert("Record Insert Succssfully ");
                        </script></head>
                        <body>

                        </body>
                        </html>     
                        <%
                    }
                    con.close();

                    }
                    catch(Exception e)
                    {
                        out.println(e.toString());
                    }
%>

<%



                }
                /*out.println("</tr>");             */
            }
            /*out.println("</table>");*/


        } catch (FileUploadException e) {
            e.printStackTrace();
        }





%>

%>