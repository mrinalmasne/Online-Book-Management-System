<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*"%>
    <%@page import = "com.DB.DBConnect" %>
    <%@page import="com.DAO.BookDAOImpl" %>
    <%@page import="com.entity.BookDtls" %>
    <%@page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="backgroung-color:#fcf7f7;">

<%User u=(User)session.getAttribute("userobj");
System.out.println("index page : "+u);
%>
<%@include file="all_component/navbar.jsp"%>
<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
BookDtls b=dao.getBookById(bid);

%>
<div class="container p-3">
<div class=row>
<div class="col-md-6 text-center p-5 border bg-white">

<img src="book/<%=b.getPhotoName() %>" style="height:200px; width:150px;"><br>
<h4 class="mt-3"> Book Name : <span class="text-success"><%=b.getBookName() %></span></h4>
<h4> Author name :<span class="text-success"> <%=b.getAuthor() %></span></h4>
<h4>Category :<span class="text-success"> <%=b.getBookCategory() %></span></h4>
</div>

<div class="col-md-6 text-center p-5 border bg-white">
<h2><%=b.getBookName() %></h2>
<%
if("Old".equals(b.getBookCategory()))
{
%>

<h5 class="text-primary">Contact To Seller</h5>
<h5 class="text-primary">
<i class="far fa-envelope"></i> Email :
<%=b.getEmail() %>
</h5>

<%} %>
<div class="row p-3">
<div class="col-md-4 text-danger text-center p-2">
<i class="fas fa-money-bill-wave fa-2x"></i>
<p>Cash On Delivery</p>
</div>

<div class="col-md-4 text-danger text-center p-2">
<i class="fas fa-undo-alt fa-2x"></i>
<p>Return Available</p>
</div>

<div class="col-md-4 text-danger text-center p-2">
<i class="fas fa-truck-moving fa-2x"></i>
<p>Free Shipping</p>
</div>

</div>

<% if("Old".equals(b.getBookCategory()))
	{
	%>
	
	<div class="text-center p-3">
	<a href="index.jsp" class="btn btn-success"> Continue Shopping</a>
	<label><i class="fas fa-rupee-sign ml-3"></i><%=b.getPrice() %></label>
</div>

	<%}

else
{
%>
<div class="text-center p-3">
<a href="checkout.jsp?bid=<%=b.getBookId()%> "	class="btn btn-primary btn-sm ml-1"> Buy Now
							 </a>
<label><i class="fas fa-rupee-sign ml-3"></i><%=b.getPrice() %></label>
</div>

<%} %>

</div>
</div>
</div>

</body>
</html>