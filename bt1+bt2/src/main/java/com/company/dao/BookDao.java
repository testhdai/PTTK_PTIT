package com.company.dao;

import java.util.List;
import com.company.bean.Book;

public interface BookDao {
	void insertBook(Book book);

	Book selectBook(int id);

	List<Book> selectAllBooks();

	boolean deleteBook(int id);

	boolean updateBook(Book book);
	
	List<Book> searchBooksByTitle(String title);
}
