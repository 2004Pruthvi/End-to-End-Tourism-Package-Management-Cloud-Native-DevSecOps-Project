package com.wild_tour.dao;

import java.util.ArrayList;

import com.wild_tour.dto.Packages;



public interface PackagesDAO {
	
	public boolean insertTourPackage(Packages t);
    public boolean updateTourPackage(Packages t);
    public boolean deleteTourPackage(int packageId);
    public Packages getTourPackage(int packageId);
    public ArrayList<Packages> getAllTourPackages();

}
