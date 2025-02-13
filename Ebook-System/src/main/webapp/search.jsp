<%@page import="com.entity.User"%>

<%@page import="java.util.List" %>

<%@page import="com.DB.DBConnect" %>

<%@page import="com.DAO.BookDAOImpl" %>

<%@page import="com.entity.BookDtls" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>All New Books</title>

<%@include file="all_component/allCss.jsp"%>

<style type="text/css">

.crd-ho:hover{

background-color:#fcf7f7;

}</style>

</head>

<body>

<%User u=(User)session.getAttribute("userobj"); %>

<%@include file="all_component/navbar.jsp"%>

<div class="container-fluid">

<div class="row p-3">

<%

String ch=request.getParameter("ch");

BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());

List<BookDtls> list =dao.getBookBySearch(ch);

for(BookDtls b:list)

{

%>

<div class="col-md-3">

<div class="card crd-ho">

<div class="card-body text-center">

<img alt="" src="book/<%=b.getPhotoName() %>"

style="width: 100px; height: 150px;" class="img-thumblin">

<p><%=b.getBookName() %></p>

<p><%=b.getAuthor() %></p>

<p>Categories:<%=b.getBookCategory() %></p>

<div class="row">

<% if(u==null)

{%>

<a href="login.jsp" class="btn btn-danger btn-sm ml-4">Add to cart</a>

<% }else{

%><a href="CartServlet?bid=<%=b.getBookId()%>&& uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-4">Add to cart</a>

<%

}%>

<a href="" class="btn btn-success btn-sm ml-1">View</a>

<a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-sharp fa-solid fa-indian-rupee-sign" aria-hidden="true"></i><%=b.getPrice() %>

</a>

</div>

</div>

</div>

</div>

<%} %>

</div>

</div>

</body>

</html>