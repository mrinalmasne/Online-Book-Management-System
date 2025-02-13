

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

/**
 * Servlet implementation class delete_book
 */
@WebServlet("/delete_book")
public class delete_book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_book() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id=Integer.parseInt(request.getParameter("id"));
		
		BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		boolean f=dao.deleteBook(id);
		
		HttpSession session=request.getSession();
		
		if(f)
		{
			session.setAttribute("succMsg", "Book details updated Successfully..");
			response.sendRedirect("admin/all_books.jsp");
		}
		
		else
		{
			session.setAttribute("failedMsg", "Something wrong on server");
			response.sendRedirect("admin/all_books.jsp");
		}
	}

}
