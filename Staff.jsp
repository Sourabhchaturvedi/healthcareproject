
<head>
	<style>
		*{padding:0px; margin:0px;}
		.backgroundimage{background:url("staffbackk.jpg"); background-repeat:no-repeat; background-size:100% 100%;}
		.input{width:80%; height:20%; text-align:center; border:none; font-size:22px; color:blue;}
		.input:hover{background-color:blue; color:white;}
		.link{text-decoration:none; text-align:center; margin-top:2%;}

		
	</style>
</head>
<body>
	<div style="width:100%; min-height:100%;">
		<div style="width:100%; height:8%; background-color:red;">
			<h1 style="text-align:center; color:white;">For Staff Use Only</h1>
			<a href="Login.jsp" style="float:right; color:white ; font-size:20px margin-bottom:10px">MENU &nbsp</a></h1>
		</div>
		<div id="mess" style="width:100%; height:8%; background-color:black; display:none;">
			<h2 style="color:white; text-align:center; line-height:200%">Incorrect username or password</h2>
		</div>
		<div style="width:100%; height:92%;">
			<div style="float:left; width:70%; height:100%;" class="backgroundimage">
			</div>
			<div style="float:left; width:30%; height:100%;">
				<img src="staffback.jpg" alt="img" style="border-radius:50%; width:160px; height:160px; margin-top:10%;margin-left:30%;">
				<div style="float:left; width:100%; height:60%; background-color:white; margin-top:1%;">
					<form method="post" action="StaffLogg.jsp" style="text-align:center;">
						<input type="text" placeholder="username" name="username" autofocus class="input"><br>
						<input type="password" placeholder="password" name="password" class="input"><br>
						<input type="submit" value="Login" class="input">
					</form>
					<a href="recoverystaff.html" class="link" style="color:red;"><h2>Forgot Password</h2></a>
					<script>
						function message()
							{
								document.getElementById("mess").style.display = "block";
							}
					</script>
				</div>
			</div>
		</div>
	</div>
</body>