<head>
	<style>
		*{padding:0px; margin:0px;}
		.bunn{width:25%; height:100%; background-color:white; color:black; float:left;}
		.cont{margin-top:2%;}
		.req{width:45%; height:10%; text-align:center; font-size:130%;}
	</style>
</head>
<body>
	<div style="width:100%; height:100%;">
		<div style="width:100%; height:15%; background: #1ed2f4;; color:Black; text-align:center; line-height:550%;">
			<h1>It Is Always Recommended To Consult A Certified Doctor In A Nation Of 1.3 Billion Doctors </h1>
		</div>
		<div style="width:100%; height:8%; background:whitesmoke;">
			<button onclick="diseases()" class="bunn">Find Your Disease</button>
			<button onclick="diseases()" class="bunn">B!</button>
			<button onclick="diseases()" class="bunn">B@</button>
			<button onclick="diseases()" class="bunn">B#</button>
		</div>
		<div style="width:100%; height:75%; background:whitesmoke;">
			<div class="cont" align="center">
				<form method="post" action="SelectDisease.jsp">
					<input type="text" name="sym1" placeholder="Symptom 1" autofocus class="req"><br>
					<input type="text" name="sym2" placeholder="Symptom 2" class="req"><br>
					<input type="text" name="sym3" placeholder="Symptom 3" class="req"><br>
					<input type="text" name="sym4" placeholder="Symptom 4" class="req"><br>
					<input type="submit" value="Check" name="check" class="req">
				</form>
			</div>
		</div>
	</div>
</body>