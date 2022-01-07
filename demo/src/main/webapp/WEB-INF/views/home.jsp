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
<script>
	$(document).ready(()=>{
			console.log($("#mail").text());
		if($("#mail").text().includes("no")){
			console.log("im in");
			$("#mail").html("<i class=\"material-icons\">report_problem</i>This email is already registered.").css("color","red");
		}
		var temp = $("#feature").text();
		if(temp.includes("login")){
			$("#reg-form").css("display","none");
			$("#log-form").css("display","block");
		}
		if(temp.includes("reg")){
			$("#reg-form").css("display","block");
			$("#log-form").css("display","none");
		}
		$("#reg").click(()=>{
			$("#reg-form").css("display","block");
			$("#log-form").css("display","none");
		})
		$(".log").click(()=>{
			$("#reg-form").css("display","none");
			$("#log-form").css("display","block");
		})
		if($("h4").text().includes("New")){
			$("#popup").modal("show");
		}
		if( $("h4").text().includes("be")){
			alert( $("h4").text());
		}
		if($("#regmsg").text().includes("Please")){
			alert($("#regmsg").text());
		}
		if($("#span").text().includes("no")){
			$("#span").html("<i class=\"material-icons\">report_problem</i>UserId already taken.").css("color","red");
		}
		if($("#span").text().includes("yes")){
			$("#span").html("<i class=\"material-icons\">verified</i>UserId available.").css("color","green");
		}
	})
 </script>

<title>Project Demo</title>
</head>
<body>

	<nav class="navbar navbar-inverse ">
		<div class="container-fluid bg-secondary">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Project Demo</a>
			</div>
			<ul class="nav navbar-nav navbar-expand-lg navbar-right">
				<li><a href="#" id="reg" class="active"><i class="material-icons">assignment</i>Register</a></li>
				<li><a href="#" class="log"><i class="material-icons">login</i>Login</a></li>
			</ul>
			
		</div>
	</nav>
	<span id="feature" style="display:none;">${feature}</span>
	<div id="reg-form" style="display:none;">
	<div class="container">
		<div class="col-sm-6 card" style="margin:auto;">
			<h2>Register</h2>
			<f:form action="/register" method="post" modelAttribute="user">
				<div class="form-group col-lg-8">
					<label>FirstName</label>
					<f:input path="firstName" class="form-control" type="text"
						id="firstname" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>LastName</label>
					<f:input path="lastName" class="form-control" type="text"
						id="lastname" cssErrorClass="error form-control" />
				</div>
				<div class="form-group col-lg-8">
					<label>Date of Birth</label>
					<f:input path="dob" class="form-control" type="date" id="dob" cssErrorClass="error form-control"/>
				</div>
				<div class="form-group col-lg-8">
					<label>Gender</label>
					<f:select path="gender" class="form-control" name="gender">
						<f:option value="male">Male</f:option>
						<f:option value="female">Female</f:option>
						<f:option value="other">Other</f:option>
					</f:select>
				</div>
				<div class="form-group col-lg-8">
					<label>Email</label>
					<f:input path="email" class="form-control" type="text" id="email" cssErrorClass="error form-control"/>
					<span id="mail">${email}</span>
				</div>
				<div class="form-group col-lg-8">
					<label>UserID</label>
					<f:input path="userId" class="form-control" type="text" id="userID" cssErrorClass="error form-control"/>
					<span id="span">${available}</span>
				</div>
				<div class="form-group col-lg-8">
					<label>Password</label>
					<f:input path="password" class="form-control" type="password"
						id="password" cssErrorClass="error form-control"/>
				</div>

				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5>Additional security requirements</h5>
							</div>
							<div class="modal-body">
								<div id="ques" class="form-group col-lg-10">
									<div class="form-group col-lg-10">
										<label>Select a Question</label>
										<f:select path="question" class="form-control"
											items="${questions}">
										</f:select>
									</div>
									<div class="form-group col-lg-10">
										<label>Answer(Please enter a one word answer)</label>
										<f:input path="answer" class="form-control" type="text"
											id="answer" cssErrorClass="error form-control"/>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-success" id="submit">Submit</button>
							</div>
						</div>
					</div>
				</div>
				
				<div class="form-group col-lg-8" id="btn">

					<a href="#" data-toggle="modal" data-target="#myModal"><input
						value="Continue" class="btn btn-primary form-control" readOnly="true" /></a>
				</div>
			</f:form>
		</div>
	</div>
	</div>
	
	<div class="modal fade" id="popup">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4>${regmsg}</h4>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
								<a href="#" class="log" data-dismiss="modal"><i class="material-icons">login</i>
									Login</a>
							</div>
						</div>
					</div>
				</div>
	<div id="log-form" style="display:none;">
		<div class="container ">
		<div class="col-sm-6 card" style="margin:auto;">
			<h2>Login</h2>
			<f:form action="/login" method="post" modelAttribute="user">
				<div class="col-lg-6">
					<label>UserID</label> <f:input type="text" path="userId" class="form-control" />
				</div>
				<div class="col-lg-6">
					<label>Password</label> <f:input type="password" path="password" class="form-control" />
				</div>
				<div class="row">
					<div class="col-lg-4">
						<a href="/forgotuserid">Forgot UserID?</a>
					</div>
					<div class="col-lg-4">
						<a href="/forgotpswd">Forgot Password?</a>
					</div>
				</div>
				<div>
					<button type="submit">Submit</button>
				</div>
			</f:form>
				<label class="error">${msg}</label>
			</div>
		</div>
	</div>




<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>