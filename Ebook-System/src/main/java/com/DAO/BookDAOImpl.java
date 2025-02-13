package com.DAO;

import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO{

private Connection conn;

public BookDAOImpl(Connection conn) {

super();

this.conn = conn;

}

@Override

public boolean addBooks(BookDtls b) {

boolean f=false;

try {

String sql="insert into book_dtls(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";

PreparedStatement ps=conn.prepareStatement(sql);

ps.setString(1, b.getBookName());

ps.setString(2, b.getAuthor());

ps.setString(3, b.getPrice());

ps.setString(4, b.getBookCategory());

ps.setString(5, b.getStatus());

ps.setString(6, b.getPhotoName());

ps.setString(7, b.getEmail());

int i=ps.executeUpdate();

if(i==1)

{

f=true;

}

}catch(Exception e) {

e.printStackTrace();

}

return f;

}

@Override
public List<BookDtls> getAllBooks() {
	// TODO Auto-generated method stub
	BookDtls b;
	List<BookDtls> list=new ArrayList<BookDtls>();
	
	
	try
	{
		String sql="select * from book_dtls";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) 
		{
			b=new BookDtls();
			//int a=rs.getInt(1);
			//System.out.println(a);
			b.setBookId(rs.getInt(1));
			
			//System.out.println(rs.getString(2));
			b.setBookName(rs.getString(2));
			
			//System.out.println(rs.getString(3));
			b.setAuthor(rs.getString(3));
			
			//System.out.println(rs.getString(4));
			b.setPrice(rs.getString(4));
			
			//System.out.println(rs.getString(5));
			b.setBookCategory(rs.getString(5));
			
			//System.out.println(rs.getString(6));
			b.setStatus(rs.getString(6));
			
			//System.out.println(rs.getString(7));
			b.setPhotoName(rs.getString(7));
			
			//System.out.println(rs.getString(8));
			b.setEmail(rs.getString(8));
			
			
			list.add(b);
			
			//System.out.println(list);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return list;
}

@Override
public BookDtls getBookById(int id) {
	// TODO Auto-generated method stub
	
	BookDtls b = null;
	
	try
	{
		String sql="select * from book_dtls where bookId=?";
		
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			 b=new BookDtls();
			//int a=rs.getInt(1);
			//System.out.println(a);
			b.setBookId(rs.getInt(1));
			
			//System.out.println(rs.getString(2));
			b.setBookName(rs.getString(2));
			
			//System.out.println(rs.getString(3));
			b.setAuthor(rs.getString(3));
			
			//System.out.println(rs.getString(4));
			b.setPrice(rs.getString(4));
			
			//System.out.println(rs.getString(5));
			b.setBookCategory(rs.getString(5));
			
			//System.out.println(rs.getString(6));
			b.setStatus(rs.getString(6));
			
			//System.out.println(rs.getString(7));
			b.setPhotoName(rs.getString(7));
			
			//System.out.println(rs.getString(8));
			b.setEmail(rs.getString(8));
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return b;
}

@Override
public List<BookDtls> getNewBook()
{
	// TODO Auto-generated method stub

	List<BookDtls> list=new ArrayList<BookDtls>();
	
	BookDtls b=null;
	
	try
	{
		String sql="select * from book_dtls  where bookCategory=? and status=?  order by bookId DESC";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1, "New");
		ps.setString(2, "Active");
		
		ResultSet rs=ps.executeQuery();
		
		int i=1;
		while(rs.next() && i<=4)
		{
			b=new BookDtls();
			//int a=rs.getInt(1);
			//System.out.println(a);
			b.setBookId(rs.getInt(1));
			
			//System.out.println(rs.getString(2));
			b.setBookName(rs.getString(2));
			
			//System.out.println(rs.getString(3));
			b.setAuthor(rs.getString(3));
			
			//System.out.println(rs.getString(4));
			b.setPrice(rs.getString(4));
			
			//System.out.println(rs.getString(5));
			b.setBookCategory(rs.getString(5));
			
			//System.out.println(rs.getString(6));
			b.setStatus(rs.getString(6));
			
			//System.out.println(rs.getString(7));
			b.setPhotoName(rs.getString(7));
			
			//System.out.println(rs.getString(8));
			b.setEmail(rs.getString(8));
			
			
			list.add(b);
			i++;
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return list;
}

@Override
public List<BookDtls> getOldBook() {
	// TODO Auto-generated method stub
List<BookDtls> list=new ArrayList<BookDtls>();
	
	BookDtls b=null;
	
	try
	{
		String sql="select * from book_dtls  where bookCategory=? and status=?  order by bookId DESC";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1, "Old");
		ps.setString(2, "Active");
		
		ResultSet rs=ps.executeQuery();
		
		int i=1;
		while(rs.next() && i<=4)
		{
			b=new BookDtls();
			//int a=rs.getInt(1);
			//System.out.println(a);
			b.setBookId(rs.getInt(1));
			
			//System.out.println(rs.getString(2));
			b.setBookName(rs.getString(2));
			
			//System.out.println(rs.getString(3));
			b.setAuthor(rs.getString(3));
			
			//System.out.println(rs.getString(4));
			b.setPrice(rs.getString(4));
			
			//System.out.println(rs.getString(5));
			b.setBookCategory(rs.getString(5));
			
			//System.out.println(rs.getString(6));
			b.setStatus(rs.getString(6));
			
			//System.out.println(rs.getString(7));
			b.setPhotoName(rs.getString(7));
			
			//System.out.println(rs.getString(8));
			b.setEmail(rs.getString(8));
			
			
			list.add(b);
			i++;
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return list;

}

@Override
public boolean updateEditBooks(BookDtls b) {
	// TODO Auto-generated method stub
	
	boolean f=false;
	
	try
	{
		String sql="update book_dtls set bookName=?,author=?,price=?,status=? where bookId=?";
		
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1, b.getBookName());
		ps.setString(2, b.getAuthor());
		ps.setString(3, b.getPrice());
		ps.setString(4,b.getStatus());
		ps.setInt(5, b.getBookId());
		
		int i=ps.executeUpdate();
		
		if(i==1)
			f=true;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return f;
}

@Override
public boolean deleteBook(int id) {
	// TODO Auto-generated method stub
	
	boolean f=false;
	
	try
	{
		String sql="delete from book_dtls where bookId=?";
		
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		int i=ps.executeUpdate();
		
		if(i==1)
			f=true;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return f;
}

@Override

public List<BookDtls> getAllNewBook() {

// TODO Auto-generated method stub

List<BookDtls> list=new ArrayList<BookDtls>();

BookDtls b=null;

try

{

String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";

PreparedStatement ps=conn.prepareStatement(sql);

ps.setString(1, "New");

ps.setString(2, "Active");

ResultSet rs=ps.executeQuery();

while(rs.next())

{

b=new BookDtls();

//int a=rs.getInt(1);

//System.out.println(a);

b.setBookId(rs.getInt(1));

//System.out.println(rs.getString(2));

b.setBookName(rs.getString(2));

//System.out.println(rs.getString(3));

b.setAuthor(rs.getString(3));

//System.out.println(rs.getString(4));

b.setPrice(rs.getString(4));

//System.out.println(rs.getString(5));

b.setBookCategory(rs.getString(5));

//System.out.println(rs.getString(6));

b.setStatus(rs.getString(6));

//System.out.println(rs.getString(7));

b.setPhotoName(rs.getString(7));

//System.out.println(rs.getString(8));

b.setEmail(rs.getString(8));

list.add(b);

}

}

catch(Exception e)

{

e.printStackTrace();

}

return list;

}

@Override

public List<BookDtls> getAllOldBook() {

List<BookDtls> list=new ArrayList<BookDtls>();

BookDtls b=null;

try

{

String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";

PreparedStatement ps=conn.prepareStatement(sql);

ps.setString(1, "Old");

ps.setString(2, "Active");

ResultSet rs=ps.executeQuery();

while(rs.next())

{

b=new BookDtls();

//int a=rs.getInt(1);

//System.out.println(a);

b.setBookId(rs.getInt(1));

//System.out.println(rs.getString(2));

b.setBookName(rs.getString(2));

//System.out.println(rs.getString(3));

b.setAuthor(rs.getString(3));

//System.out.println(rs.getString(4));

b.setPrice(rs.getString(4));

//System.out.println(rs.getString(5));

b.setBookCategory(rs.getString(5));

//System.out.println(rs.getString(6));

b.setStatus(rs.getString(6));

//System.out.println(rs.getString(7));

b.setPhotoName(rs.getString(7));

//System.out.println(rs.getString(8));

b.setEmail(rs.getString(8));

list.add(b);

}

}

catch(Exception e)

{

e.printStackTrace();

}

return list;

}

@Override
public List reports(String d1) {
	// TODO Auto-generated method stub
	
	//Date d1=new SimpleDateFormate("yyyy-MM-dd").parse(request.getParameter("date"));
	
	List list=new ArrayList();

	BookDtls b=null;

	try

	{
     //String sql="select month(d1)";
     //PreparedStatement ps=conn.prepareStatement(sql);
     
		//SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
		
		
	String sql1="select b.bookId,b.bookName ,count(bid)  cnt from book_dtls b,orders o where  b.bookId=o.bid and date='"+d1+" 'group by bid ; ";

	PreparedStatement ps1=conn.prepareStatement(sql1);

	//ps1.set(1, d1);

	//ps.setString(2, "Active");

	ResultSet rs=ps1.executeQuery();

	while(rs.next())

	{

	//b=new BookDtls();

	//int a=rs.getInt(1);

	//System.out.println(a);

	int id=rs.getInt(1);
	list.add(id);

	//System.out.println(rs.getString(2));

	String nm=rs.getString(2);
	list.add(nm);
	//System.out.println(rs.getString(3));
   
	int cnt=rs.getInt(3);
	
	list.add(cnt);

	}

	}

	catch(Exception e)

	{

	e.printStackTrace();

	}

	return list;

}

/*@Override
public List<BookDtls> reports(Date d) {
	// TODO Auto-generated method stub
	return null;
}*/

@Override

public List<BookDtls> getBookBySearch(String ch) {

List<BookDtls> list=new ArrayList<BookDtls>();

BookDtls b=null;

try

{

String sql="select * from book_dtls where bookname like ? or bookCategory like ? and status=?";

PreparedStatement ps=conn.prepareStatement(sql);

ps.setString(1, "%"+ch+"%");

ps.setString(2, "%"+ch+"%");

ps.setString(3, "%"+ch+"%");

ps.setString(2, "Active");

ResultSet rs=ps.executeQuery();

while(rs.next())

{

b=new BookDtls();

b.setBookId(rs.getInt(1));

b.setBookName(rs.getString(2));

b.setAuthor(rs.getString(3));

b.setPrice(rs.getString(4));

b.setBookCategory(rs.getString(5));

b.setStatus(rs.getString(6));

b.setPhotoName(rs.getString(7));

b.setEmail(rs.getString(8));

list.add(b);

}

}catch(Exception e)

{

e.printStackTrace();

}

return list;

}

}