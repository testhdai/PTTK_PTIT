package com.company.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.company.dao.BookDao;
import com.company.dao.BookDaoImpl;
import com.company.dao.UserDao;
import com.company.dao.UserDaoImpl;
import com.company.bean.Book;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static BookDao bookDao = new BookDaoImpl();
    private static UserDao userDao = new UserDaoImpl();

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (userDao.isValidUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            List<Book> listBooks = bookDao.selectAllBooks();
            request.setAttribute("listBooks", listBooks);

            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
