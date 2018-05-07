<%
	String StaffUser=(String)(session.getAttribute("usernamee"));
	
	if(StaffUser==null)
	{
		response.sendRedirect("Staff.jsp");
	}
	else
	{
%>
<html>
	<head>
		<style>
			*{padding:0px; margin:0px;}
			.main{width:100%; height:100%; background-color:rgb(0,255,255);}
			.boo{width:100%; height:15%; background-color:white; margin-top:15%; }
			.type{width:45%; height:50%; color:rgb(0,255,255); font-size:200%; margin}
		</style>
	</head>
	<body>
		<div class="main">
			<span style="font-size:300%; aliggn:center; margin-left:30%;">Add Your Recent Image Here</span>
			<div class="boo">
				<form style="margin-left:20%;" method="post" enctype="multipart/form-data" action="IImage.jsp">
					<input type="file" name="img" class="type">
					<input type="submit" value="Add Image" style="width:15%; height:40%;">
				</form>
			</div>
		</div>
	</body>
</html>
<%
	}
%>