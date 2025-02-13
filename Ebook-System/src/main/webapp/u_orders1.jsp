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
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="all_component/navbar.jsp" %>
<br><br>
<table class="table table-striped" >
  <thead class="bg-primary text-white">
    <tr>
      <th > Order Id</th>
      <th >Book Id</th>
      <th >Book Name</th>
      <th >Photo</th>
      <th >Price</th>
      <th >Payment Mode</th>
      <th >Date </th> 
    </tr>
  </thead>
  
<%
User u=(User)session.getAttribute("userobj");
System.out.println("user"+u);

System.out.println("user id :"+u.getId()); 

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app ","root","root");

String sql1="select o.oid,o.bid,b.bookName,b.photo,b.price,o.payment_mode,o.date from orders o,book_dtls b where o.bid=b.bookId and uid= "+u.getId();

PreparedStatement ps1=con.prepareStatement(sql1);


ResultSet rs=ps1.executeQuery();

while(rs.next())
{
%>


  <tbody>
    <tr>
      <td><%=rs.getInt(1) %></td>
      <td><%=rs.getInt(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><img src="book/<%=rs.getString(4)%>" style = "width: 50px; height:50px;"></td>
      <td><%=rs.getString(5) %></td>
      <td><%=rs.getString(6) %></td>
      <td><%=rs.getString(7) %></td>
     </tbody>
     
     <%} %>
</table>
</body>
</html>