<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User : Home Page</title>
<%@include file="all_component/allCss.jsp" %>
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
<body style="background-color: #f0f2f2;">
<%@include file="all_component/navbar.jsp" %>

    <div class="container">
	    <div class="row p-5">
	    <div class="col-md-4">
	    <a href="u_add_book.jsp">
	     <div class="card">
	    <div class="card-body text-center">
	   <i class="fas fa-plus-square fa-3x text-primary"></i><br>
	    <h4>Add Books</h4>
	    -----------
	    </div>
	    </div>
	    </a>
	    </div>
	    
	     <div class="col-md-4">
	     <a href="u_all_books.jsp">
	     <div class="card">
	    <div class="card-body text-center">
	      <i class="fas fa-book-open fa-3x text-danger"></i> <br>
	    <h4>All Books</h4>
	    -----------
	    </div>
	    </div>
	    </a>
	    </div>
	     <div class="col-md-4">
	      <a href="u_orders1.jsp">
	     <div class="card">
	    <div class="card-body text-center">
	     <i class="fas fa-box-open fa-3x text-warning"></i><br>
	    <h4>Orders</h4>
	    -----------
	    </div>
	    </div>
	    </a>
	    </div>
	     
	    
    </div>
    </div>
    
</body>
</html>