<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--<%@ taglib prefix="c" uri="http://java.sum.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook : Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Registration Page</h4>
						<form action="registerservlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Name : </label> <input
									type="text" class="form-control"  required="required" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email </label> <input
									type="email" class="form-control"  required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Address</label> <input
									type="text" class="form-control" required="required" name="address">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone no</label> <input
									type="number" class="form-control" required="required" name="phno" pattern="[0-9].{10}">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control"  name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
									title="must contain at least one number and one uppercase and lowercase letter,and at least 8 or more characters">
							</div>
							
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>