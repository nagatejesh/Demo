<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- google icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<title>Project Demo</title>
<script type="text/javascript">
	$(document).ready(()=>{
		if($("#msg").text()){
			alert($("#msg").text())
		}
	})
</script>
<style type="text/css">
.material-icons{ vertical-align: middle; }
.card{
	margin:auto;
}
.error{
	border:1px solid red;
	color:red;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse ">
		<div class="container-fluid bg-secondary">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Welcome ${user.firstName} ${user.lastName}</a>
			</div>
			<ul class="nav navbar-nav navbar-expand-lg navbar-right">
				<li><a href="#" id="btn" class="btn btn-danger-outline" data-toggle="modal" data-target="#myModal">Delete Account</a></li>
				<li><a href="/logout" class="log"><i class="material-icons">logout</i>Logout</a></li>
			</ul>
		</div>
	</nav>
	<div>
		<div class="card video">
		<script src="https://www.youtube.com/iframe_api" async=""></script>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/rtOvBOTyX00" title="A Thousand Years" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	<div>
		<div class="card video">
		<script src="https://www.youtube.com/iframe_api" async=""></script>
		<iframe width="727" height="409" src="https://www.youtube.com/embed/xHWIhCUnfOE?list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbAVMxHWIhCUnfOE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	</div>
	<span id="msg" style="display:none;">${msg}</span>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			<form method="post" action="/delete">
				<div class="modal-header">
					<h5>Confirm your password to delete</h5>
				</div>
				<div class="modal-body">
					<div id="ques" class="form-group col-lg-10">
						<div class="form-group col-lg-10">
							<label>Enter password</label>
							<input class="form-control" name="password" id="password" type="password"/>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				<br>
					<button type="button" class="btn btn-success"
						data-dismiss="modal">Cancel</button>
				<br>
					<button type="submit" class="btn btn-danger" id="submit">Delete</button>
				</div>
			</form>
			</div>
		</div>
	</div>

				
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>