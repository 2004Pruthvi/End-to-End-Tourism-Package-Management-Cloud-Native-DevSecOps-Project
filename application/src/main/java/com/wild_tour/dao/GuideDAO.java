package com.wild_tour.dao;

import java.util.ArrayList;
import com.wild_tour.dto.Guide;


public interface GuideDAO {
	public boolean insertGuide(Guide g);
    public boolean updateGuide(Guide g);
    public boolean deleteGuide(int Id);
    public Guide getGuide(int Id);
    public ArrayList<Guide> getAllGuides();


}
