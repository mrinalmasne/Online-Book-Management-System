package com.DAO;

import java.sql.*;
import java.util.*;

import com.entity.BookDtls;
import com.entity.User;

public class UserDAOImpl implements UserDAO
{
	private Connection conn;
	
	public UserDAOImpl(Connection conn)
	{
		super();
		this.conn=conn;
	}
	
	public boolean userRegister(User us)
	{
		boolean f=false;
		try
		{
			String sql="insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	public User login(String email, String password) {
		User us=null;
		try
		{
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, email);;
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return us;
	}
	
	@Override

	public boolean u_addBooks(BookDtls b) {

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
	public List<BookDtls> getOrders(int id) {
		// TODO Auto-generated method stub
		
		BookDtls b;
		List<BookDtls> list=new ArrayList<BookDtls>();
		
		try
		{
			String sql="select bookName,price,photo from book_dtls where bookId ="+id;
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new BookDtls();
				
				b.setBookName(rs.getString(1));
				
				b.setPrice(rs.getString(2));
				
				b.setPhotoName(rs.getString(3));
				
				list.add(b);
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return null;
	}
	
	@Override
	public List<BookDtls> u_getAllBooks(String email) {
		// TODO Auto-generated method stub
		BookDtls b;
		List<BookDtls> list=new ArrayList<BookDtls>();
		
		
		try
		{
			String sql="select * from book_dtls where email= '"+email+"'";
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
}
