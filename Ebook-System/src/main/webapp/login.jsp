<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook : Login</title>
 <%@include file="all_component/allCss.jsp"%> 
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Login Page</h4>
					
					<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email </label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name=email>
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name=password>
							</div>
														
							<div class="text-center p-3">
							<button type="submit" class="btn btn-primary">Login</button><br>
							<a href="register.jsp">New Registration</a><br>
							<a href="">Forgot Password</a><br>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>