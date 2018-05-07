<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Modal Example</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Book Test</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
        

	<form align="center" method="get" action="ApproveTest.jsp">
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
						<h3 style="color:white;">Test Date & Time You Want</h3>
						<input type="submit" name="submit" value="Book Test" class="inpt" >
					</form>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</body>
</html>
