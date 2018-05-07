<html>
	<head>
		<style>
			*{padding:0px; margin:0px;}
			.bakk{background:url("app.jpg"); background-repeat:no-repeat; background-size:100% 100%;}
			.inpt {width:50%; height:6%; text-align:center; font-size:110%; margin-top:1%; color:blue;}
		</style>

		 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Login.css">

	</head>
	
	<body>
		<div style="width:100%; height:100%;">
			<div style="width:100%; height:13%; background-color: #1ed2f4; color:white;">
			</div>
			
			<div style="width:100%; min-height:90%; background-color:white;">
				<br>
				<div style="width:40%; min-height:80%; background-color:#AC80A0; margin-left:30%; border-radius:10%; box-shadow:3px 3px rgba(0,0,0,0.4);">
					<br>
					<img src="app.jpg" alt="ll" style="border-radius:20%; width:160px; height:160px; margin-left:35%;">
					<form align="center" method="get" action="ApproveReq.jsp">
						<input type="text" name="phone" placeholder="Phone No" class="inpt"><br>
						<select name="depart" class="inpt">
							<option value="neurology">Neurology</option>
							<option value="dentist">Dentist</option>
							<option value="heartspecialist">Heart Specialist</option>
							<option value="ortho">Ortho</option>
							<option value="gynaecology">Gynaecology</option>
							<option value="generalphysician">General Physician</option>
							<option value="emergency">Emergency</option>
						</select><br>
						
						<input type="datetime-local" name="date" min="2018/01/01" value="Required Date" class="inpt"><br>
						<h3 style="color:white;">Appointment Date & Time You Want</h3>
						<input type="submit" name="submit" value="Book Appointment" class="inpt" >
					</form>
				</div>
			</div>
		</div>
	</body>
</html>