<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Form</title>
</head>
<body>

	<h2><%=request.getAttribute("book") == null ? "Add New Book" : "Edit Book"%></h2>
	<form action="BookServlet" method="post">
		<input type="hidden" name="action"
			value="<%=request.getAttribute("book") == null ? "insert" : "update"%>" />
		<input type="hidden" name="id"
			value="<%=request.getAttribute("book") == null ? "" : ((com.company.bean.Book) request.getAttribute("book")).getId()%>" />
		<label>Title:</label> <input type="text" name="title"
			value="<%=request.getAttribute("book") == null ? "" : ((com.company.bean.Book) request.getAttribute("book")).getTitle()%>"
			required /><br> <label>Author:</label> <input type="text"
			name="author"
			value="<%=request.getAttribute("book") == null ? "" : ((com.company.bean.Book) request.getAttribute("book")).getAuthor()%>"
			required /><br> <label>Price:</label> <input type="number"
			step="0.01" name="price"
			value="<%=request.getAttribute("book") == null ? "" : ((com.company.bean.Book) request.getAttribute("book")).getPrice()%>"
			required /><br> <input type="submit"
			value="<%=request.getAttribute("book") == null ? "Add Book" : "Update Book"%>" />
		<a href="BookServlet?action=list">Cancel</a>
	</form>

</body>
</html>
