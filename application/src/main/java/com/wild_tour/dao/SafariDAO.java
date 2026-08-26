package com.wild_tour.dao;

import java.util.ArrayList;

import com.wild_tour.dto.Safari;



public interface SafariDAO {
	
    public boolean insertSafari(Safari safari);
    public boolean updateSafari(Safari safari);
    public boolean deleteSafari(int safariId);
    public Safari getSafari(int safariId);
    public ArrayList<Safari> getAllSafaris();


}
