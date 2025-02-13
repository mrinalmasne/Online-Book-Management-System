<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<%@include file="allCss.jsp" %>
<style type="text/css">
a{
text-decoration: none;
color: black;
}

a:hover{
text-decoration: none;
color:black;
}
</style>
</head>

<body style="background-color: #f0f2f2">

<%@include file="navbar.jsp" %>


    <div class="container">
	    <div class="row p-3">
	    <div class="col-md-3">
	    <a href="add_books.jsp">
	     <div class="card">
	    <div class="card-body text-center">
	   <i class="fas fa-plus-square fa-3x text-primary"></i><br>
	   <br>
	    <h4>Add Books</h4>
	    -----------
	    </div>
	    </div>
	    </a>
	    </div>
	    
	     <div class="col-md-3">
	     <a href="all_books.jsp">
	     <div class="card">
	    <div class="card-body text-center">
	      <i class="fas fa-book-open fa-3x text-danger"></i> <br>
	    <br>
	    <h4>All Books</h4>
	    -----------
	    </div>
	    </div>
	    </a>
	    </div>
	     <div class="col-md-3">
	      <a href="orders.jsp">
	     <div class="card">
	    <div class="card-body text-center">
	     <i class="fas fa-box-open fa-3x text-warning"></i><br>
	    <br><h4>Orders</h4>
	    -----------
	    </div>
	    </div>
	    </a>
	    </div>
	    
	    <div class="col-md-3">
	      <a href="reports.jsp">
	     <div class="card">
	    <div class="card-body text-center">
	     <br><br><br>
	    <h4>Reports</h4>
	    -----------
	    	    </div>
	    </div>
	    </a>
	    </div>
	    
    </div>
    </div>
    
</body>
</html>