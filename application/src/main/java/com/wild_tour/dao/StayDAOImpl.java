package com.wild_tour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wild_tour.connection.Connector;
import com.wild_tour.dto.Stay;

public class StayDAOImpl implements StayDAO {
    private Connection con;

    public StayDAOImpl() {
        this.con = Connector.requestConnection();
    }

    @Override
    public boolean insertStay(Stay stay) {
        String sql = "INSERT INTO stay (name, image_url, price_per_night, description) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, stay.getName());
            ps.setString(2, stay.getImage_url());
            ps.setDouble(3, stay.getPrice_per_night());
            ps.setString(4, stay.getDescription());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateStay(Stay stay) {
        String sql = "UPDATE stay SET name = ?, image_url = ?, price_per_night = ?, description = ? WHERE stay_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, stay.getName());
            ps.setString(2, stay.getImage_url());
            ps.setDouble(3, stay.getPrice_per_night());
            ps.setString(4, stay.getDescription());
            ps.setInt(5, stay.getStay_id());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteStay(int stayId) {
        String sql = "DELETE FROM stay WHERE stay_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, stayId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Stay getStay(int stayId) {
        String sql = "SELECT * FROM stay WHERE stay_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, stayId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Stay stay = new Stay();
                stay.setStay_id(rs.getInt("stay_id"));
                stay.setName(rs.getString("name"));
                stay.setImage_url(rs.getString("image_url"));
                stay.setPrice_per_night(rs.getDouble("price_per_night"));
                stay.setDescription(rs.getString("description"));
                return stay;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Stay> getAllStays() {
        ArrayList<Stay> list = new ArrayList<>();
        String sql = "SELECT * FROM stay";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Stay stay = new Stay();
                stay.setStay_id(rs.getInt("stay_id"));
                stay.setName(rs.getString("name"));
                stay.setImage_url(rs.getString("image_url"));
                stay.setPrice_per_night(rs.getDouble("price_per_night"));
                stay.setDescription(rs.getString("description"));
                list.add(stay);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
