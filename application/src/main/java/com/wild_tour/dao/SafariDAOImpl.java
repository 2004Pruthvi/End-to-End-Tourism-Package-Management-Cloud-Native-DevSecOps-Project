package com.wild_tour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wild_tour.connection.Connector;
import com.wild_tour.dto.Safari;

public class SafariDAOImpl implements SafariDAO {
    private Connection con;

    public SafariDAOImpl() {
        this.con = Connector.requestConnection();
    }

    @Override
    public boolean insertSafari(Safari safari) {
        String sql = "INSERT INTO safari (name, image_url, price_per_seat, description) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, safari.getName());
            ps.setString(2, safari.getImage_url());
            ps.setDouble(3, safari.getPrice_per_seat());
            ps.setString(4, safari.getDescription());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateSafari(Safari safari) {
        String sql = "UPDATE safari SET name = ?, image_url = ?, price_per_seat = ?, description = ? WHERE safari_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, safari.getName());
            ps.setString(2, safari.getImage_url());
            ps.setDouble(3, safari.getPrice_per_seat());
            ps.setString(4, safari.getDescription());
            ps.setInt(5, safari.getSafari_id());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteSafari(int safariId) {
        String sql = "DELETE FROM safari WHERE safari_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, safariId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Safari getSafari(int safariId) {
        String sql = "SELECT * FROM safari WHERE safari_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, safariId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Safari safari = new Safari();
                safari.setSafari_id(rs.getInt("safari_id"));
                safari.setName(rs.getString("name"));
                safari.setImage_url(rs.getString("image_url"));
                safari.setPrice_per_seat(rs.getDouble("price_per_seat"));
                safari.setDescription(rs.getString("description"));
                return safari;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Safari> getAllSafaris() {
        ArrayList<Safari> list = new ArrayList<>();
        String sql = "SELECT * FROM safari";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Safari safari = new Safari();
                safari.setSafari_id(rs.getInt("safari_id"));
                safari.setName(rs.getString("name"));
                safari.setImage_url(rs.getString("image_url"));
                safari.setPrice_per_seat(rs.getDouble("price_per_seat"));
                safari.setDescription(rs.getString("description"));
                list.add(safari);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
