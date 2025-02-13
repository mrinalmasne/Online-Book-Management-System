

import java.io.IOException;


//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registerservlet
 */
@WebServlet("/registerservlet")
public class registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		//PrintWriter out=response.getWriter();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app","root","root");
			
			
			
			PreparedStatement ps1=con.prepareStatement("insert into user(name,email,adress,phno,password) values(?,?,?,?,?)");
			ps1.setString(1, request.getParameter("fname"));
			ps1.setString(2,request.getParameter("email"));
			ps1.setString(3,request.getParameter("address"));
			ps1.setString(4,request.getParameter("phno"));
			ps1.setString(5,request.getParameter("password"));
			
			
			
			ps1.executeUpdate();
			System.out.println("Successfully registered");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
	}

}
