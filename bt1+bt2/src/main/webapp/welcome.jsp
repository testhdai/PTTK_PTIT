<h2>Welcome to the Book Management System</h2>
<a href="BookServlet?action=new">Add New Book</a>
<a href="LogoutServlet">Logout</a>

<h3>Search Books</h3>
<form action="BookServlet" method="get">
    <input type="text" name="search" placeholder="Enter book title..." />
    <input type="submit" value="Search" />
</form>

<h3>Book List</h3>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>
    <%@ page import="java.util.List" %>
    <%@ page import="com.company.bean.Book" %>
    <%
        List<Book> listBooks = (List<Book>) request.getAttribute("listBooks");
        if (listBooks != null) {
            for (Book book : listBooks) {
    %>
    <tr>
        <td><%= book.getId() %></td>
        <td><%= book.getTitle() %></td>
        <td><%= book.getAuthor() %></td>
        <td><%= book.getPrice() %></td>
        <td>
            <a href="BookServlet?action=edit&id=<%= book.getId() %>">Edit</a>
            <a href="BookServlet?action=delete&id=<%= book.getId() %>" onclick="return confirm('Xóa sách này nhé?')">Delete</a>
        </td>
    </tr>
    <% } } else { %>
    <tr>
        <td colspan="5">No books available</td>
    </tr>
    <% } %>
</table>
