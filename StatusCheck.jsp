<%
	String Docname=(String)(session.getAttribute("Username"));
%>

<html>
	<head>
		<style>
			*{padding:0px; margin:0px;}
			body{background-color:black;}
			.inn{width:30%; height:52%; text-align:center; font-size:15px;}
		</style>
	</head>
	<body>
		<div style="width:100%; height:12%; background-color:white; text-align:center; line-height:400%; color:red;">
			<h1>Please Confirm YourSelf Dr.<%=Docname%></h1>
		</div>
		<div>
			<center style="width:100%; height:15%; margin-top:16%; background-color:white; padding-top:2%;">
				<form method="post" action="StatusAssign.jsp">
					<input type="number" name="pass" placeholder="password" autofocus class="inn">
					<input type="submit" name="su" value="Confirm Yourself" class="inn">
				</form>
			</center>
		</div>
	</body>
</html>