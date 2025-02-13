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
<title>Admin: All Orders</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="navbar.jsp" %>

<h3 class="text-center">Hello Admin</h3>

<h3 class="text-center">Select date  for reports : </h3>
<br><br>
 <div class="container">
	    <div class="row text-center">
	    <div class="col-md-10 text-center">
<form action="reports1.jsp" method=post>
Date : <input type="date" name=date1>


<input type=submit>
</form>
</div>
</div>
</div>
<%--<%
String d=request.getParameter("date");
Date d1=new Date();

SimpleDateFormat sdf;



System.out.println(d1); 
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());

List<BookDtls> list =dao.reports(d1);
for(BookDtls b:list)
{



<%	
BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list =dao.reports(date1);
				for(BookDtls b:list)
				{
			%>
<br><br>
<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Book Id</th>
      <th scope="col">Name</th>
      <th scope="col">Sell Quantity</th>
      
    </tr>
  </thead>--%>
 <%-- <tbody>
    <tr>
      <th scope="row"><%=b.getBookId() %></th>
      <td><%=b.getBookName() %></td>
      <td></td>
      
      
    </tr>
    
  </tbody>

<%} %></table>--%>
</body>
</html>