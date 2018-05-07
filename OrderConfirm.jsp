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
		int totalPrice=0;
		Properties pro = new Properties();
%>
		<head>
			<style>
				*{padding:0px;margin:0px}
			</style>
			 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Login.css">

			
			<script language="javascript">
				
				function getXMLObject() //XML OBJECT
				{
					var xmlHttp = false;
					try 
					{
						xmlHttp = new ActiveXObject("Msxml2.XMLHTTP") // For Old Microsoft Browsers
					}
					catch (e)
					{
						try
						{
							xmlHttp = new ActiveXObject("Microsoft.XMLHTTP") // For Microsoft IE 6.0+
						}
						catch (e2) 
						{
							xmlHttp = false // No Browser accepts the XMLHTTP Object then false
						}
					}
					if (!xmlHttp && typeof XMLHttpRequest != 'undefined') 
					{
						xmlHttp = new XMLHttpRequest(); //For Mozilla, Opera Browsers
					}
					return xmlHttp; // Mandatory Statement returning the ajax object created
				}

				var xmlhttp = new getXMLObject();	//xmlhttp holds the ajax object
		
				function ajaxFunction(a)
				{
					//var getdate = new Date(); //Used to prevent caching during ajax call
						if(xmlhttp) 
						{ 
							xmlhttp.open("POST","UpdatePrice.jsp?mName="+ a); //gettime will be the servlet name
							xmlhttp.onreadystatechange = handleServerResponse;
					
							xmlhttp.send();
						}

				}

				function handleServerResponse() 
				{
					if (xmlhttp.readyState == 4)
					{
						if(xmlhttp.status == 200) 
						{
							
							var neww=parseInt(xmlhttp.responseText);
							if(document.getElementById("check").checked)
							{
								if(document.getElementById("TM").style.display=="inline")
								{
									var total=parseInt(document.getElementById("TM").innerText);
									var newTotal=total+neww;
									document.getElementById("TM").style.display="none";
									document.getElementById("dd").innerHTML=newTotal;
								}
								else
								{
									var old=parseInt(document.getElementById("dd").innerText);
									var updatedTotal=old+neww;
									document.getElementById("dd").innerHTML=updatedTotal;
								}
							}
							else
							{
								if(document.getElementById("TM").style.display=="inline")
								{
									var total=parseInt(document.getElementById("TM").innerText);
									var newTotal=total-neww;
									document.getElementById("TM").style.display="none";
									document.getElementById("dd").innerHTML=newTotal;
								}
								else
								{
									var old=parseInt(document.getElementById("dd").innerText);
									var updatedTotal=old-neww;
									document.getElementById("dd").innerHTML=updatedTotal;
								}
							}
						}
						else
						{
							alert("Error during AJAX call. Please try again");
						}
					}
				}
				function callAjaxFunction(a)
				{
					//var getdate = new Date(); //Used to prevent caching during ajax call
						if(xmlhttp) 
						{ 
							xmlhttp.open("POST","UpdateQuantityPrice.jsp?qName="+ a); //gettime will be the servlet name
							xmlhttp.onreadystatechange = handleAjaxResponse;
					
							xmlhttp.send();
						}

				}

				function handleAjaxResponse() 
				{
					if (xmlhttp.readyState == 4)
					{
						if(xmlhttp.status == 200) 
						{
							var res=xmlhttp.responseText;
							var splt=res.split("<br>");
							document.getElementById("net").innerHTML=splt[0];
							document.getElementById("dd").innerHTML=splt[1];
						}
						else
						{
							alert("Error during AJAX call. Please try again");
						}
					}
				}
			</script>
		</head>
		<body>
			<div style="width:100%; height:100%;">
				<div style="width:100%; height:12%; color:white; background-color: #1ed2f4;; text-align:center; font-size:230%; line-height:200%;">
					<p><%=username%> Please Confirm Your Order </p>
				</div>
				<div style="width:100%; height:188%;">
					<form method="post" action="PlaceOrder.jsp">
						<table>
							<tr>
								<th>Medicine Name</th><th>Quantity</th><th>Manufacturer Name</th><th>Per Unit Cost</th><th>Net Price</th>
							</tr>

<%
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
										ps=con.prepareStatement("select medicinename,quantity,manufacturename,unitprice,netprice,status from healthcare.orderrecord where customerName='"+username+"' having status='pending'");
										rs=ps.executeQuery();
										while(rs.next())
										{
%>
											<tr>
												<th><input type="checkbox" id="check" name="mName" value="<%=rs.getString(1)%>" checked onChange="ajaxFunction(this.value)"><%=rs.getString(1)%></th>
												<th><input type="number" name="qName" value="<%=rs.getInt(2)%>" style="width:20%;" onChange="callAjaxFunction(this.value)"></th>
												<th><%=rs.getString(3)%></th><th><%=rs.getInt(4)%></th><span id="net"><th><%=rs.getInt(5)%></th></span>
											</tr>
<%
											totalPrice=totalPrice+rs.getInt(5);
										}
									}
									catch(Exception e)
									{
										out.print(e);
									}
									finally
									{
									
									}
%>								
						</table>
						<div style="background-color:#20B2AA; color:white; min-width:3%;">
							<span>Total Amount: INR</span>
							<span name="final" id="TM" style="text-align:center; display:inline;"><%=totalPrice%></span><span name="dd" id="dd"></span>
							<input type="submit" name="submit" value="Place Order" style="background:orange;">
						</div>
						
					</form>
					
				</div>
			</div>
		</body>
<%
	}
%>