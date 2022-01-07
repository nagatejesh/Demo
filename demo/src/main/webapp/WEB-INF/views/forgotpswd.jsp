<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
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
a{
	padding-top: 20px;
}
</style>

</head>
<body>

	<div class="container ">
		<div class="col-sm-6 card ">
			<h2>Forgot Password</h2>
			<f:form action="/resetpassword" method="post" modelAttribute="user">
				<div class="col-lg-8">
					<label>User Id</label>
					<f:input class="form-control" path="userId" type="text" id="id" />
				</div>
				<div class="col-lg-8">
					<label>Select your Question:</label>
					<f:select class="form-control" path="question" items="${questions}">
					</f:select>
				</div>
				<div class="col-lg-8">
					<label>Answer</label>
					<f:input class="form-control" path="answer" type="text" id="answer" />
				</div>
				<div class="col-lg-8">				<br>
				
						<a href="/forgotuserid">Forgot UserID?</a>
				</div>
				<div class="col-lg-8 form-group">				<br>
				
				<button type="submit">Reset Password</button>
				</div>
			</f:form>
			<label>${getpassmsg}</label>
		</div>
	</div>


<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>