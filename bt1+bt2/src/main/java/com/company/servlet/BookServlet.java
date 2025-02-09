package com.company.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.company.dao.BookDao;
import com.company.dao.BookDaoImpl;
import com.company.bean.Book;
import java.util.List;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static BookDao bookDao = new BookDaoImpl();

	public BookServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action == null) {
			String search = request.getParameter("search");
			if (search != null && !search.trim().isEmpty()) {
				searchBooks(request, response);
			} else {
				listBooks(request, response);
			}
		} else {
			switch (action) {
			case "new":
				showNewForm(request, response);
				break;
			case "insert":
				insertBook(request, response);
				break;
			case "delete":
				deleteBook(request, response);
				break;
			case "edit":
				showEditForm(request, response);
				break;
			case "update":
				updateBook(request, response);
				break;
			default:
				listBooks(request, response);
				break;
			}
		}
	}

	private void listBooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Book> listBooks = bookDao.selectAllBooks();
		request.setAttribute("listBooks", listBooks);
		request.getRequestDispatcher("welcome.jsp").forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Book existingBook = bookDao.selectBook(id);
		request.setAttribute("book", existingBook);
		request.getRequestDispatcher("editBook.jsp").forward(request, response);
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		bookDao.deleteBook(id);
		response.sendRedirect("BookServlet");
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("bookForm.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action == null) {
			response.sendRedirect("BookServlet");
			return;
		}

		switch (action) {
		case "insert":
			insertBook(request, response);
			break;
		case "update":
			updateBook(request, response);
			break;
		}
	}

	private void insertBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			double price = Double.parseDouble(request.getParameter("price"));

			Book newBook = new Book();
			newBook.setTitle(title);
			newBook.setAuthor(author);
			newBook.setPrice(price);

			bookDao.insertBook(newBook);

			response.sendRedirect("BookServlet");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void updateBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		double price = Double.parseDouble(request.getParameter("price"));

		Book book = new Book();
		book.setId(id);
		book.setTitle(title);
		book.setAuthor(author);
		book.setPrice(price);

		bookDao.updateBook(book);
		response.sendRedirect("BookServlet");
	}

	private void searchBooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchKeyword = request.getParameter("search");
		List<Book> listBooks;

		if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
			listBooks = bookDao.searchBooksByTitle(searchKeyword);
		} else {
			listBooks = bookDao.selectAllBooks();
		}

		request.setAttribute("listBooks", listBooks);
		request.getRequestDispatcher("welcome.jsp").forward(request, response);
	}

}
