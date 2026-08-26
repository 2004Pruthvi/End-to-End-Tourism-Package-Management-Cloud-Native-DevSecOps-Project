package com.wild_tour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wild_tour.connection.Connector;
import com.wild_tour.dto.Guide;

public class GuideDAOImpl implements GuideDAO{
	private Connection con;

    public GuideDAOImpl() {
        this.con = Connector.requestConnection();
    }

	@Override
	public boolean insertGuide(Guide g) {
		// TODO Auto-generated method stub
		String query = "INSERT INTO guides (name, bio, price, image) VALUES (?, ?, ?, ?)";
        try {
        	PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, g.getName());
            ps.setString(2, g.getBio());
            ps.setDouble(3, g.getPrice());
            ps.setString(4, g.getImage());
            return ps.executeUpdate() > 0;
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
		return false;
	}

	@Override
	public boolean updateGuide(Guide g) {
		// TODO Auto-generated method stub
		 String query = "UPDATE guides SET name = ?, bio = ?, price = ?, image = ? WHERE id = ?";
	        try {
	        	PreparedStatement ps = con.prepareStatement(query);
	        
	            ps.setString(1, g.getName());
	            ps.setString(2, g.getBio());
	            ps.setDouble(3, g.getPrice());
	            ps.setString(4, g.getImage());
	            ps.setInt(5, g.getId());
	            return ps.executeUpdate() > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return false;
	}

	@Override
	public boolean deleteGuide(int Id) {
		// TODO Auto-generated method stub
		String query = "DELETE FROM guides WHERE id = ?";
        try {
        	PreparedStatement ps = con.prepareStatement(query); 
            ps.setInt(1, Id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
		return false;
	}

	@Override
	public Guide getGuide(int Id) {
		// TODO Auto-generated method stub
		 String query = "SELECT * FROM guides WHERE id = ?";
	        try {
	        	PreparedStatement ps = con.prepareStatement(query) ;
	            ps.setInt(1, Id);
	           ResultSet rs = ps.executeQuery();
	                if (rs.next()) {
	                    Guide g = new Guide();
	                    g.setId(rs.getInt("id"));
	                    g.setName(rs.getString("name"));
	                    g.setBio(rs.getString("bio"));
	                    g.setPrice(rs.getDouble("price"));
	                    g.setImage(rs.getString("image"));
	                    return g;
	                }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }


	@Override
	public ArrayList<Guide> getAllGuides() {
		// TODO Auto-generated method stub
		ArrayList<Guide> list = new ArrayList<>();
        String query = "SELECT * FROM guides";
        try {
        	PreparedStatement ps = con.prepareStatement(query);
       
             ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Guide g = new Guide();
                g.setId(rs.getInt("id"));
                g.setName(rs.getString("name"));
                g.setBio(rs.getString("bio"));
                g.setPrice(rs.getDouble("price"));
                g.setImage(rs.getString("image"));
                list.add(g);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}