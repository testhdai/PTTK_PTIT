package com.company.dao;
import com.company.bean.User;

public interface UserDao {

	boolean isValidUser(String username, String password);

	boolean addUser(User user);

}
