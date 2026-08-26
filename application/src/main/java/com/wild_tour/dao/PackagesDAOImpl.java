package com.wild_tour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wild_tour.connection.Connector;
import com.wild_tour.dto.Packages;

public class PackagesDAOImpl implements PackagesDAO {
    private Connection con;

    public PackagesDAOImpl() {
        this.con = Connector.requestConnection();
    }

    @Override
    public boolean insertTourPackage(Packages t) {
        String sql = "INSERT INTO packages (name, image_url, price, description) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, t.getName());
            ps.setString(2, t.getImage_url());
            ps.setDouble(3, t.getPrice());
            ps.setString(4, t.getDescription());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateTourPackage(Packages t) {
        String sql = "UPDATE packages SET name = ?, image_url = ?, price = ?, description = ? WHERE package_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, t.getName());
            ps.setString(2, t.getImage_url());
            ps.setDouble(3, t.getPrice());
            ps.setString(4, t.getDescription());
            ps.setInt(5, t.getPackage_id());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteTourPackage(int packageId) {
        String sql = "DELETE FROM packages WHERE package_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, packageId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Packages getTourPackage(int packageId) {
        String sql = "SELECT * FROM packages WHERE package_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, packageId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Packages t = new Packages();
                t.setPackage_id(rs.getInt("package_id"));
                t.setName(rs.getString("name"));
                t.setImage_url(rs.getString("image_url"));
                t.setPrice(rs.getDouble("price"));
                t.setDescription(rs.getString("description"));
                return t;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Packages> getAllTourPackages() {
        ArrayList<Packages> list = new ArrayList<>();
        String sql = "SELECT * FROM packages";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Packages t = new Packages();
                t.setPackage_id(rs.getInt("package_id"));
                t.setName(rs.getString("name"));
                t.setImage_url(rs.getString("image_url"));
                t.setPrice(rs.getDouble("price"));
                t.setDescription(rs.getString("description"));
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
