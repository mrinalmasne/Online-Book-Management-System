<div class="container-fluid "
	style="height: 10px; background-color: #303f9f"></div>

<%@page import="java.sql.*"%>
    <%@page import = "com.DB.DBConnect" %>
    <%@page import="com.DAO.BookDAOImpl" %>
    <%@page import="com.entity.BookDtls" %>
    <%@page import="com.entity.User" %>
    <%@page import="java.util.*" %>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<h2 class="text-success">
				<i class="fa fa-book" aria-hidden="true"></i> EBooks
			</h2>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-Lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="search">

				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		
		<%User u1=(User)session.getAttribute("userobj"); %>
		
		<%User user=u1;
			if(user==null){%>
		<div class="col-md-3">
		
			<a href="login.jsp" class="btn btn-success">Login</a> 
			<a href="register.jsp" class="btn btn-primary">Register</a> 
			
			
		</div>
		<%}
		
		else
		{
		%>
		
		<div class="col-md-3">
		
		<input type=hidden name=uid value="<%=u1.getId() %>">
							<%  System.out.println(u1.getId());%>
		<a href="u_home.jsp?uid=<%=u1.getId() %>" class="btn btn-success"> ${userobj.name }</a> 
        <a href="admin/logout.jsp" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i>  Logout</a>
         </div>
		<%} %>


	</div>

</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">
			<i	class="fas fa-home" aria-hidden="true"></i> Home 
			<span class="sr-only">(current)
			</span> 
			</a>
			</li>

			<li class="nav-item active"><a class="nav-link" href="all_new_book.jsp">
			<i	class="fas fa-book-open" aria-hidden="true"></i> New Book 
			<span class="sr-only">(current)</span> </a></li>

			<li class="nav-item active"><a class="nav-link" href="all_old_book.jsp">
			<i	class="fas fa-book-open" aria-hidden="true"></i> Old Book 
			<span class="sr-only">(current)</span> </a></li>

		</ul>
		<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-Light my-2 my-sm-0 ml-1" type="">
				About Us
			</button>
			<button class="btn btn-Light my-2 my-sm-0 ml-1" type="">
				Contact us
			</button>
		</form>
	</div>
</nav>
