
<head>


<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		*{padding:0px; margin:0px;}
		.backgroundimage{background:url("pattt.jpg"); background-repeat:no-repeat; background-size:100% 100%;}
		.input{width:80%; height:20%; text-align:center; border:none; font-size:22px; color:blue;}
		.input:hover{background-color:blue; color:white;}
		.link{text-decoration:none; text-align:center; margin-top:2%;}

		
	</style>
</head>
<body>
	<div style="width:100%; min-height:100%;">
		<div style="width:100%; height:14%; background-color:rgba(0,0,225); padding:4px">
			<h1 style="text-align:center; color:white;">Registered Patient LogIn Page</h1>
		</div>
		<div id="mess" style="width:100%; height:8%; background-color:black; display:none;">
			<h2 style="color:white; text-align:center; line-height:200%">Incorrect username or password</h2>
		</div>
		<div style="width:100%; height:92%;">
			<div style="float:left; width:70%; height:100%;" class="backgroundimage">
			</div>
			<div style="float:left; width:30%; height:100%; background-color:rgba(0,225,225);">
				<img src="patt.jpg" alt="img" style="border-radius:10%; width:160px; height:160px; margin-top:10%;margin-left:30%;">
				<div style="float:left; width:100%; height:50%; background-color:rgba(0,225,225); margin-top:4%;">
					<form method="post" action="PatientValid.jsp" style="text-align:center;">
						<input type="email" placeholder="username" name="username" autofocus class="input"><br>
						<input type="password" placeholder="password" name="password" class="input"><br>
						<input type="submit" value="Login" class="input">
					</form>
					<a href="recoverypat.html" class="link" style="color:red;"><h2>Forgot Password</h2></a>
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