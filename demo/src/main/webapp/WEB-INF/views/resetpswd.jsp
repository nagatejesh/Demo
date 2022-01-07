<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- google icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.material-icons{ vertical-align: middle; }
.card{
	margin:auto;
}
</style>

</head>
<body>

	<div class="container ">
		<div class="col-sm-6 card" style="margin:auto;">
			<h2>Password Reset</h2>
			<form action="/passwordreseted" method="post" oninput='inp2.setCustomValidity(inp2.value != inp1.value ? "Passwords do not match." : "")'>
				<div class="col-lg-6 form-group">
					<label>New Password</label>
					<input class="form-control" type="text" id="inp1" name="password"/>
				</div>
				<div class="col-lg-6 form-group">
					<label>Confirm Password</label>
					<input class="form-control" type="text" id="inp2"/>
				</div>
				<div class="col-lg-6 form-group">
				<button type="submit">Confirm</button>
				</div>
			</form>
			<label>${getmsg}</label>
		</div>
	</div>


<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>