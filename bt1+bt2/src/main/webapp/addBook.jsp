<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
</head>
<body>
    <h2>Add New Book</h2>
    <form action="BookServlet" method="post">
        <input type="hidden" name="action" value="insert" />
        <label>Title:</label>
        <input type="text" name="title" required /><br/>
        <label>Author:</label>
        <input type="text" name="author" required /><br/>
        <label>Price:</label>
        <input type="text" name="price" required /><br/>
        <input type="submit" value="Add Book" />
    </form>
    <a href="BookServlet">Back to List</a>
</body>
</html>
