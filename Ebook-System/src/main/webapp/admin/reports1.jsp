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
<%@include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">

<%@include file="navbar.jsp" %>

<br><br>
<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Book Id</th>
      <th scope="col">Name</th>
      <th scope="col">Sell Quantity</th>
      
    </tr>
  </thead>
<% String date=request.getParameter("date1");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app ","root","root");

String sql1="select b.bookId,b.bookName ,count(bid)  cnt from book_dtls b,orders o where  b.bookId=o.bid and date='"+date+" 'group by bid ; ";

PreparedStatement ps1=con.prepareStatement(sql1);

//ps1.set(1, d1);

//ps.setString(2, "Active");

ResultSet rs=ps1.executeQuery();
			
			while(rs.next())
			{
			
			%>

 <tbody>
    <tr>
      <th scope="row"><%=rs.getInt(1) %></th>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getInt(3) %></td>
         
      
    </tr>
    
  </tbody>

<%} %></table>
</body>
</html>