

import java.io.File;



import java.io.IOException;

//import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.User;

@WebServlet("/BooksAdd")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//boolean f=false;
		HttpSession session=req.getSession();
		User u=(User)session.getAttribute("userobj");
		System.out.println("user"+u);
		try {
			
		String bookName=req.getParameter("bname");
		String author=req.getParameter("author");
		String price=req.getParameter("price");
		String categories=req.getParameter("btype");
		//System.out.println(categories);
		String status=req.getParameter("bstatus");
		//System.out.println(status);
		Part part=req.getPart("bimg");
		String filename=part.getSubmittedFileName();
		
		if(u.getName()=="admin")
		{
		BookDtls b=new BookDtls(bookName,author,price,categories,status,filename,"admin");
		
		BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		
		boolean f=dao.addBooks(b);
		
		HttpSession session1=req.getSession();
		
		if(f)
		{
			
			String path=getServletContext().getRealPath("")+"book";
			
			//System.out.println(path);

			File file=new File(path);
			
			part.write(path + File.separator + filename);
			
			
			session1.setAttribute("succMsg", "Book Add Sucessfully");
			resp.sendRedirect("admin/add_books.jsp");
		}
		else
		{
			session1.setAttribute("failedMsg", "Something wrong on server");
			resp.sendRedirect("admin/add_books.jsp");
		}
		
		
		}
		
		
		else
		{
            BookDtls b=new BookDtls(bookName,author,price,categories,status,filename,u.getEmail());
			
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			
			boolean f=dao.u_addBooks(b);
			
			//HttpSession session=req.getSession();
			
			if(f)
			{
				
				String path=getServletContext().getRealPath("")+"book";
				
				//System.out.println(path);

				File file=new File(path);
				
				part.write(path + File.separator + filename);
				
				
				//session.setAttribute("succMsg", "Book Add Sucessfully");
				resp.sendRedirect("u_add_book.jsp");
				//out.println("<html><h3>Book added successfully</h3></html>");
				
			}
			else
			{
				//session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("u_add_book.jsp");
				//out.println("<html><h3>Something wrong on server</h3></html>");
			}
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
