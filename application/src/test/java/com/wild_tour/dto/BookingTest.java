package com.wild_tour.dto;

import java.sql.Date;
import java.sql.Timestamp;

import junit.framework.TestCase;

public class BookingTest extends TestCase {

    public void testBookingGettersAndSetters() {
        Booking booking = new Booking();

        Date bookingDate = Date.valueOf("2026-10-10");
        Date fromDate = Date.valueOf("2026-10-15");
        Date toDate = Date.valueOf("2026-10-20");
        Timestamp bookedDate =
            Timestamp.valueOf("2026-09-20 10:30:00");

        booking.setBooking_id(101);
        booking.setUser_id(1);
        booking.setTourist_name("Pruthvi");
        booking.setItem_type("Safari");
        booking.setItem_name("Jungle Safari");
        booking.setItem_image("safari.jpg");
        booking.setNum_persons(2);
        booking.setTotal_price(2500.50);
        booking.setPayment_mode("UPI");
        booking.setStatus("Confirmed");
        booking.setBooking_date(bookingDate);
        booking.setFrom_date(fromDate);
        booking.setTo_date(toDate);
        booking.setBooked_date(bookedDate);

        assertEquals(101, booking.getBooking_id());
        assertEquals(1, booking.getUser_id());
        assertEquals("Pruthvi", booking.getTourist_name());
        assertEquals("Safari", booking.getItem_type());
        assertEquals("Jungle Safari", booking.getItem_name());
        assertEquals("safari.jpg", booking.getItem_image());
        assertEquals(2, booking.getNum_persons());
        assertEquals(2500.50, booking.getTotal_price(), 0.001);
        assertEquals("UPI", booking.getPayment_mode());
        assertEquals("Confirmed", booking.getStatus());
        assertEquals(bookingDate, booking.getBooking_date());
        assertEquals(fromDate, booking.getFrom_date());
        assertEquals(toDate, booking.getTo_date());
        assertEquals(bookedDate, booking.getBooked_date());
    }
}
