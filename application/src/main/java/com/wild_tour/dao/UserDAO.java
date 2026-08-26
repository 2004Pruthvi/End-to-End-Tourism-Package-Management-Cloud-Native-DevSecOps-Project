package com.wild_tour.dao;

import java.util.ArrayList;

import com.wild_tour.dto.User;


public interface UserDAO {
	
	public boolean insertUser(User u); 
	
    public boolean updateUser(User u);
    
    public boolean deleteUser(User u);  
    
    public User getUser(String email, String password);
    
    public User getUser(long phone, String email);
    
    public ArrayList<User> getAllUsers();
   
}
