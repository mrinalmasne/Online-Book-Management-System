<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
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
<h4 class="text-center">Add Books</h4>
<form action="../BooksAdd" method=post enctype="multipart/form-data">
<div class="form-group">
<label for="exampleInputEmail1">Book Name*</label>
<input name="bname" type="text" class="form-control" required="required">
</div>

<div class="form-group">
<label for="exampleInputEmail1">Author Name*</label>
<input name="author" type="text" class="form-control" required="required">
</div>

<div class="form-group">
<label for="exampleInputPassword1">Price*</label>
<input name="price" type="number" class="form-control" required="required">
</div>

<div class="form-group">
<label for="inputState">Book Categories</label><select
required="required" name="btype" class="form-control">
<option selected>--select--</option>
<option value="New">New Book</option>

</select>
</div>

<div class="form-group">
<label for="inputState">Book Status</label><select
required="required" name="bstatus" class="form-control">
<option selected>--select--</option>
<option value="Active">Active</option>
<option value="Inactive">Inactive</option>
</select>
</div>


<div class="form-group"><label for="exampleFormControlFile1">Upload Photo</label>
<input name="bimg" type="file" class="form-control-file"
required="required">
</div>

<button type="submit" class="btn btn-primary">Add</button>

</form>
</div>

</div>
</div>
</div>
</div>
 
</body>
</html>