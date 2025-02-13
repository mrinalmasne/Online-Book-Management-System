

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
//import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

/**
 * Servlet implementation class checkoutServlet
 */
@WebServlet("/checkoutServlet")
public class checkoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		//String uid=request.getParameter("uid");
		//System.out.println(uid);
		HttpSession session=request.getSession();
		User u=(User)session.getAttribute("userobj");
		System.out.println("user"+u);
		
		//int user=Integer.parseInt(request.getParameter("uid"));
		//Object user=request.getSession().getAttribute(userobj);
		int uid=u.getId();
		System.out.println("user id :"+u.getId());
		int id=(int)session.getAttribute("bid");
		System.out.println("bid"+id);
		String  landmark=request.getParameter("land");
		System.out.println("land : "+landmark);
		String city=request.getParameter("city");
		System.out.println("land : "+city);
		String state=request.getParameter("state");
		System.out.println("land : "+state);
		String pincode=request.getParameter("pincode");
		System.out.println("land : "+pincode);
		String payment_mode=request.getParameter("paymode");
		System.out.println("land : "+payment_mode);
		
		//java.sql.Date  now= new java.sql.Date();
		//System.out.println("date :"+now);
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app","root","root");
			
			String sql="update user set landmark='"+landmark+"',city='"+city+"',state='"+state+"',pincode='"+pincode+"' where id= "+u.getId();
			
			PreparedStatement ps1=con.prepareStatement(sql);
			int rs=ps1.executeUpdate();
			
			if(rs==1)
			{
				response.sendRedirect("u_orders.jsp?bid="+id);
			}
			else
			{
				response.sendRedirect("checkout.jsp");
				out.println("Something went wrong on server");
			}
			
			String sql1="insert into orders1(uid,date,payment_mode,bid) values("+uid+", CURRENT_DATE() , '"+ payment_mode+"',"+id+")";
			
			PreparedStatement ps=con.prepareStatement(sql1);
			
			/*ps.setInt(1, uid);
			ps.setDate(2, getCurrentDate());
			ps.setString(3, "payment_mode");
			ps.setInt(4, id);*/
			
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			System.out.println("Exception "+e);
		}
		
		
	}

	
	
}
