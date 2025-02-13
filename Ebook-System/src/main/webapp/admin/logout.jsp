<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	out.println("YOU have logged out successfullly you have to login again");
	HttpSession session1=request.getSession();
	session1.invalidate();
	%>
	<script>alert("you have logged out successfullly you have to do login in again to view the contents;")</script>
	<%
	response.sendRedirect("../index.jsp");
	//RequestDispatcher rd=request.getRequestDispatcher("indexA.html");
	//rd.forward(request,response);
%>
</body>
</html>