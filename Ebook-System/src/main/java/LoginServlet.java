

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		try
		{
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session=request.getSession();
			
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			if("admin@gmail.com".equals(email) && "admin".equals(password))
			{
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				response.sendRedirect("admin/home.jsp");
			}
			else
			{
				User us=dao.login(email, password);
				
				if(us!=null)
				{
					session.setAttribute("userobj", us);
					response.sendRedirect("index.jsp");
				}
				else
				{
					session.setAttribute("failedMsg", "Email & password Invalid");
					response.getWriter().write("Invalid email or password");
					response.sendRedirect("login.jsp");
					out.println("Invalid email or password");
					response.getWriter().write("Invalid email or password");
				}
				
				response.sendRedirect("home.jsp");
			}
			
			System.out.println(email+" "+password);
		}
		catch(Exception e)
		{
			System.out.println(e);
			e.printStackTrace();
		}
	}

}
