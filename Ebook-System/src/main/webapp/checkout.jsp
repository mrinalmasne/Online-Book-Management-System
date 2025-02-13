<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<%@page import="com.DAO.*" %>

<%@page import="com.DB.*" %>

<%@page import="java.util.List" %>

<%@page import="com.entity.User"%>

<%@page import="com.entity.Cart"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Cart Page</title>

<%@include file="all_component/allCss.jsp"%>

</head>

<body style="background-color: #fof1f2;">

<%--<%User u=(User)session.getAttribute("userobj");
System.out.println(u); --%>


<%@include file="all_component/navbar.jsp"%>

<div class="container">

<div class="row p-2">

<div class="col-md-6">

<div class="card bg-white">

<div class="card-body">

<h3 class="text-center text-success">Your Selected Item</h3>
<%
int bid=Integer.parseInt(request.getParameter("bid"));
System.out.println(bid);

HttpSession session1=request.getSession();
session.setAttribute("bid",bid);

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app ","root","root");

String sql1="select bookName,author,price from book_dtls where bookId="+bid;

PreparedStatement ps1=con.prepareStatement(sql1);


ResultSet rs=ps1.executeQuery(); %>

<table class="table table-striped">

<thead>

<tr>

<th >Book Name</th>

<th >Author</th>

<th >Price</th>

<th >Action</th>

</tr>

</thead>

<%


while(rs.next())
{
%>


<tr>



<td><%=rs.getString(1) %></td>

<td><%=rs.getString(2) %></td>

<td><%=rs.getString(3) %></td>

<td><a href="" class="btn btn-sm btn-danger">Remove</a></td>

</tr>


<%} %>
</table></div></div></div>

<div class="col-md-6">

<div class="card">

<div class="card-body">

<h3 class="text-center text-success">Your Details for Order</h3></div>

<form action="checkoutServlet" method="post">
<%-- <input type=text name=uid value=<%=u.getId() %>>--%>



<div class="form-row">
 
<div class="form-group col-md-6">

<label for="inputEmail4">Landmark</label>

<input type="text" class="form-control" name="land" >

</div>

<div class="form-group col-md-6">

<label for="inputPassword4">City</label>

<input type="text" class="form-control" name="city">

</div>

</div> <div class="form-row">

<div class="form-group col-md-6">

<label for="inputEmail4">State</label>

<input type="text" class="form-control" name="state">

</div>

<div class="form-group col-md-6">

<label for="inputPassword4">Pin Code</label>

<input type="number" class="form-control" name="pincode">

</div>

</div>

<div class="form-group">

<label>Payment Mode</label>

<select class="form-control" name="paymode"><option>---Select---</option>

<option>Cash on Delivery</option>

</select></div>

<div class="text-center">

<input type=submit value="Place Order" class="btn btn-danger">



</div>

</form>

</div>

</div>

</div></div>



</body>

</html>