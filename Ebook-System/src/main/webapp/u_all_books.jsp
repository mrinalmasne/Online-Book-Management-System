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
<title>${userobj.name}  : All Books</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
<%User u=(User)session.getAttribute("userobj");
System.out.println("index page : "+u);
%>

<%@include file="all_component/navbar.jsp" %>
<h3 class="text-center">Hello  ${userobj.name} </h3>

<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  				
  		UserDAOImpl dao1=new UserDAOImpl(DBConnect.getConn());
  		  List<BookDtls> list=dao1.u_getAllBooks(u.getEmail());
  		for(BookDtls b:list)
  		{
  			%>
  			<tr>
      <td><%=b.getBookId() %></td>
      <td><img src="book/<%=b.getPhotoName()%>" style = "width: 50px; height:50px;"></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><%=b.getStatus() %></td>
      <td>
      <a href="admin/edit_books.jsp?id=<%=b.getBookId() %>" class=" btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a>
       <a href="delete_book?id=<%=b.getBookId() %>" class=" btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a>
       </td>
    </tr>
  			<%
  		}
  		
  %> 
    
  </tbody>
</table>

</body>
</html>