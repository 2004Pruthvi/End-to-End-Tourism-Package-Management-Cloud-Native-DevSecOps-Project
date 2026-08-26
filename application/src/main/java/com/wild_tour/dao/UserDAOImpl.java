package com.wild_tour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wild_tour.connection.Connector;
import com.wild_tour.dto.User;



public class UserDAOImpl implements UserDAO{
	private Connection con;

    public UserDAOImpl() {
        this.con = Connector.requestConnection();
    }


	@Override
	public boolean insertUser(User u) {
		// TODO Auto-generated method stub
		String query = "INSERT INTO user(user_name, email, password, phone, address) VALUES (?, ?, ?, ?, ?)";
        int result = 0;
        try {
           
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setLong(4, u.getPhone());
            ps.setString(5, u.getAddress());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (result > 0) {
           
            return true;
        } else {
            
            return false;
        }
    }
        

	@Override
	public boolean updateUser(User u) {
		// TODO Auto-generated method stub
		String query = "UPDATE USER SET user_name=?, email=?, phone=?, password=?, address=? WHERE user_id=?";
        int result = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getEmail());
            ps.setString(4, u.getPassword());
            ps.setLong(3, u.getPhone());
            ps.setString(5, u.getAddress());
            ps.setInt(6, u.getUserId());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result > 0) {
            
            return true;
        } else {
            
            return false;
        }
	}

	@Override
	public boolean deleteUser(User u) {
		// TODO Auto-generated method stub
		String query = "DELETE FROM user WHERE useri_d=?";
        int result = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, u.getUserId());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (result > 0) {
            
            return true;
        } else {
           
            return false;
        }
    }

		

	@Override
	public User getUser(String email, String password) {
		// TODO Auto-generated method stub
		User user = null;
        String query = "SELECT * FROM user WHERE email=? AND password=?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getLong("phone"));
                user.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
		
	@Override
	public ArrayList<User> getAllUsers() {
		// TODO Auto-generated method stub
		ArrayList<User> users = new ArrayList<>();
        String query = "SELECT * FROM user";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getLong("phone"));
                user.setAddress(rs.getString("address"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }


	@Override
	public User getUser(long phone, String email) {
		// TODO Auto-generated method stub
		String query ="select * from User where phone=? and email=?";
		User u=null;
		ResultSet rs=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, email );
			rs=ps.executeQuery();
				while(rs.next()) {
					u=new User();
					u.setUserId(rs.getInt("user_id"));
					u.setUser_name(rs.getString("user_name"));
					u.setEmail(rs.getString("email"));
					u.setPhone(rs.getLong("phone"));
					u.setPassword(rs.getString("password"));
					u.setAddress(rs.getString("address"));
				}
			}catch(SQLException e) {
				e.printStackTrace();
		}
		return u;
	}
}
		
