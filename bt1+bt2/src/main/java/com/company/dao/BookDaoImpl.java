package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.company.bean.Book;
import com.company.util.DBUtil;

public class BookDaoImpl implements BookDao {

	@Override
	public List<Book> selectAllBooks() {
		List<Book> books = new ArrayList<>();
		String query = "SELECT * FROM books";

		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				ResultSet resultSet = preparedStatement.executeQuery()) {

			while (resultSet.next()) {
				Book book = new Book();
				book.setId(resultSet.getInt("id"));
				book.setTitle(resultSet.getString("title"));
				book.setAuthor(resultSet.getString("author"));
				book.setPrice(resultSet.getDouble("price"));
				books.add(book);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return books;
	}

	@Override
	public Book selectBook(int id) {
		Book book = null;
		String query = "SELECT * FROM books WHERE id = ?";

		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setInt(1, id);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				if (resultSet.next()) {
					book = new Book();
					book.setId(resultSet.getInt("id"));
					book.setTitle(resultSet.getString("title"));
					book.setAuthor(resultSet.getString("author"));
					book.setPrice(resultSet.getDouble("price"));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return book;
	}

	@Override
	public void insertBook(Book book) {
		String query = "INSERT INTO books (title, author, price) VALUES (?, ?, ?)";

		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setDouble(3, book.getPrice());

			int rowsAffected = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean updateBook(Book book) {
		String query = "UPDATE books SET title = ?, author = ?, price = ? WHERE id = ?";

		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setString(1, book.getTitle());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setDouble(3, book.getPrice());
			preparedStatement.setInt(4, book.getId());

			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteBook(int id) {
		String query = "DELETE FROM books WHERE id = ?";

		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setInt(1, id);
			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Book> searchBooksByTitle(String title) {
		List<Book> books = new ArrayList<>();
		String query = "SELECT * FROM books WHERE title LIKE ?";

		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setString(1, "%" + title + "%");
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Book book = new Book();
				book.setId(resultSet.getInt("id"));
				book.setTitle(resultSet.getString("title"));
				book.setAuthor(resultSet.getString("author"));
				book.setPrice(resultSet.getDouble("price"));
				books.add(book);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return books;
	}

}
