<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page import="java.sql.*"%>
    <%@page import = "com.DB.DBConnect" %>
    <%@page import="com.DAO.BookDAOImpl" %>
    <%@page import="com.entity.BookDtls" %>
    <%@page import="com.entity.User" %>
    <%@page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook Index Page</title>
<%@include file="all_component/allCss.jsp"%>


<style type="text/css">
.back-img {
	background: url("img/book.jpg");
	height: 60vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7">
<%User u=(User)session.getAttribute("userobj");
System.out.println("index page : "+u);
%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h2 class="text-center text-white">
			<i class="fas fa-book" aria-hidden="true"></i> EBook Management System
		</h2>
	</div>

	<!-- New Book Start -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row  mt-5">
			
			
			<%
				BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list =dao.getNewBook();
				for(BookDtls b:list)
				{
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Catories:<%=b.getBookCategory() %></p>
						<div class="row ">
						
							<label><i class="fas fa-rupee-sign ml-3"></i><%=b.getPrice() %></label>
							 <a	href="view_books.jsp?bid=<%=b.getBookId() %> "class="btn btn-success btn-sm ml-3">View</a>
							  <% if(u==null)

{%>

<a href="login.jsp" class="btn btn-danger btn-sm ml-4">Buy Now</a>

<% } else 
{
%>
							
							 <input type="hidden" name="uid" value="<%=u.getId() %>">
							<%  System.out.println(u.getId());%>
							
							 <a href="checkout.jsp?bid=<%=b.getBookId()%> "	class="btn btn-danger btn-sm ml-1"> Buy Now
							 </a>
							 
<%} %>							
							 
							 </div>
							 </div>
							
				</div>
			</div>

			

			<%} %>

			
</div>
		<div class="text-center mt-3">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- New Book End -->

	<hr>
	<!-- Old Book Start -->

	<div class="container mt-5">
		<h3 class="text-center">Old Book</h3>
		<div class="row  mt-4">
		
		<%
				BookDAOImpl dao1=new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list1 =dao1.getOldBook();
				for(BookDtls b:list1)
				{
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Catories:<%=b.getBookCategory() %></p>
						<div class="row ">
						<label> <i class="fas fa-rupee-sign ml-4"></i> <%=b.getPrice() %></label>
						
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-4">View Details</a>
							<br> 
							
						</div>
						
					</div>
				</div>
			
			</div>
			

			<%} %>

			</div>
		<div class="text-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>


	<!-- Old book End -->


</body>
</html>
