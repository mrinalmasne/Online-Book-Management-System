<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.sql.*"%>
    <%@page import = "com.DB.DBConnect" %>
    <%@page import="com.DAO.BookDAOImpl" %>
    <%@page import="com.DAO.UserDAOImpl" %>
    <%@page import="com.entity.BookDtls" %>
    <%@page import="com.entity.User" %>
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
<h3 class="text-center">All Orders details </h3>
<br><br>
<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col"> Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Address</th>
      <th scope="col">Book Id</th>
      <th scope="col">Book Name</th>
      <th scope="col">Photo</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Mode</th>
      <th scope="col">Date </th>
    </tr>
  </thead>
  
  <%
  Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app ","root","root");

String sql1="select o.oid,u.name,u.adress,o.bid,b.bookName,b.photo,b.price,o.payment_mode,o.date from orders o,user u,book_dtls b  where o.uid=u.id and o.bid=b.bookId;";

PreparedStatement ps1=con.prepareStatement(sql1);


ResultSet rs=ps1.executeQuery();

while(rs.next())
{%>
  <tbody>
    <tr>
      <th scope="row"><%=rs.getInt(1) %></th>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><%=rs.getInt(4) %></td>
       <td><%=rs.getString(5) %></td>
      <td><img src="../book/<%=rs.getString(6)%>" style = "width: 50px; height:50px;"></td>
      <td><%=rs.getString(7) %></td>
      <td><%=rs.getString(8) %></td>
      <td><%=rs.getString(9) %></td>
    </tr>
    
  </tbody>
  <%} %>
</table>

</body>
</html>