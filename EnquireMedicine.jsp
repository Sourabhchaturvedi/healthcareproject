<head>
	<style>
		*{padding:0px; margin:0px;}
		.medi{text-align:center; width:30%; height:10%; border:none; font-size:110%;}
	</style>
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
				catch (e2) {
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
			if(document.proname.Name.value.length >3)
			{
				if(xmlhttp) 
				{ 
					xmlhttp.open("GET","MedicineDatabase.jsp?Name="+ a); //gettime will be the servlet name
					xmlhttp.onreadystatechange = handleServerResponse;
					
					xmlhttp.send();
				}
			}
			else
			{
				document.getElementById("seller").innerHTML="no records found";
				//document.getElementById("price").innerHTML="no records found";
			}
		}

		function handleServerResponse() 
		{
			if (xmlhttp.readyState == 4)
			{
				if(xmlhttp.status == 200) 
				{
					document.getElementById("seller").innerHTML=xmlhttp.responseText;
				/*	var responee=xmlhttp.responseText;
					var arrResponse= responsee.split("brk");
					var arrLen= arrResponse.length;
					for(int i=o;i<arrLen;i++)
					{
					 //Update the HTML Form element 
					//document.getElementById("seller").innerHTML=arrResponse[0];
					//document.getElementById("price").innerHTML=arrResponse[1];
					}*/
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
		<div style="width:100%; height:10%; background-color:black; color:white; text-align:center; line-height:350%;">
			<h1>Know Your Medicine's Details</h1>
		</div>
		<div style="width:100%; height:10%;">
		</div>
		<div style="width:100%; height:80%;">
			<form name="proname" align="center" method="get" action="CartList.jsp">
				<input type="text" value="Medicine Name" disabled class="medi">
				<input type="text" name="Name" placeholder="Enter Medicine Name" autofocus class="medi" onblur="ajaxFunction(this.value)"><br>
				
				<span id="seller" name="dispp"></span>
			</form>
		</div>
	</div>
</body>