<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.company.bean.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Book</title>
</head>
<body>
	<h2>Edit Book</h2>
	<%
	Book book = (Book) request.getAttribute("book");
	if (book != null) {
	%>
	<form action="BookServlet" method="post">
		<input type="hidden" name="action" value="update" /> <input
			type="hidden" name="id" value="<%=book.getId()%>" /> <label>Title:</label>
		<input type="text" name="title" value="<%=book.getTitle()%>" required /><br />
		<label>Author:</label> <input type="text" name="author"
			value="<%=book.getAuthor()%>" required /><br /> <label>Price:</label>
		<input type="text" name="price" value="<%=book.getPrice()%>" required /><br />
		<input type="submit" value="Update Book" />
	</form>
	<a href="BookServlet">Back to List</a>
	<%
	} else {
	%>
	<p>Book not found.</p>
	<%
	}
	%>
</body>
</html>
