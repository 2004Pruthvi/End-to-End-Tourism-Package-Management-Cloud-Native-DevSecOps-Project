package com.wild_tour.dao;

import java.util.ArrayList;

import com.wild_tour.dto.Stay;



public interface StayDAO {
	
	public boolean insertStay(Stay stay);
    public boolean updateStay(Stay stay);
    public boolean deleteStay(int stayId);
    public Stay getStay(int stayId);
    public ArrayList<Stay> getAllStays();


}
