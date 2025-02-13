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
<body>
<%@include file="all_component/navbar.jsp"%>
<%
int bid=Integer.parseInt(request.getParameter("bid"));
System.out.println(bid);

String sql="select photo,bookName,author,price from book_dtls where bookId="+bid;

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app ","root","root");

PreparedStatement ps1=con.prepareStatement(sql);


ResultSet rs=ps1.executeQuery();
			
			while(rs.next())
			{

%>
<div class="card crd-ho">
					<div class="card-body text-center">
						<h2> THANK YOU </h2>
						<h4> Your order has been placed successffully ....</h4>
						<a	href="index.jsp "class="btn btn-success btn-sm ml-1">continue Shopping</a> 
						
</div>
</div>

<%} %>
</body>
</html>