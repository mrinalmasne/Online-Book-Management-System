<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
    
    <%@page import="java.sql.*"%>
    <%@page import = "com.DB.DBConnect" %>
    <%@page import="com.DAO.BookDAOImpl" %>
    <%@page import="com.entity.BookDtls" %>
    <%@page import="java.util.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<body>
<%@include file="navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Edit Books</h4>

<%
	int id=Integer.parseInt(request.getParameter("id"));
	BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
	BookDtls b=dao.getBookById(id);
%>


<form action="../EditBooksServlet" method=post >
<input type=hidden name=id value="<%=b.getBookId()%>">

<div class="form-group">
<label for="exampleInputEmail1">Book Name*</label>
<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= b.getBookName()%>">
</div>

<div class="form-group">
<label for="exampleInputEmail1">Author Name*</label>
<input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= b.getAuthor()%>">
</div>

<div class="form-group">
<label for="exampleInputPassword1">Price*</label>
<input name="price" type="number" class="form-control" id="exampleInputPassword1" value="<%= b.getPrice()%>">
</div>


<div class="form-group">
<label for="inputState">Book Status</label><select
id="inputState" name="bstatus" class="form-control">
<% if("Active".equals(b.getStatus()))
{
	%>
<option value="Active">Active</option>
<option value="Inactive">Inactive</option>
<%}
else
{
%>
<option value="Inactive">Inactive</option>
<option value="Active">Active</option>
<%} %>
</select>
</div>




<button type="submit" class="btn btn-primary">Update</button>
</form>
</div>

</div>
</div>
</div>
</div>
 
</body>
</html>