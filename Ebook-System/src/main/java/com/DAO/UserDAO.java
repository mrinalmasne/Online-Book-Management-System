package com.DAO;

import java.util.List;


import com.entity.BookDtls;
import com.entity.User;

public interface UserDAO
{
	public boolean userRegister(User us);
	
	public User login(String email,String password);
	
	public boolean u_addBooks(BookDtls b);
	
	public List<BookDtls> getOrders(int id);
	
	public List<BookDtls> u_getAllBooks(String email);
}
