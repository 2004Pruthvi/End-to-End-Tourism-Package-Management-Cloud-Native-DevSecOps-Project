package com.wild_tour.dao;

import java.util.ArrayList;

import com.wild_tour.dto.Booking;



public interface BookingDAO {
	
	public boolean insertBooking(Booking b);
    public boolean updateBooking(Booking b);
    public boolean deleteBooking(int bookingId);
    public Booking getBooking(int bookingId);
    public ArrayList<Booking> getAllBookings();


}
