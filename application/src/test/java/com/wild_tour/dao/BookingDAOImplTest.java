package com.wild_tour.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wild_tour.dto.Booking;

import junit.framework.TestCase;

public class BookingDAOImplTest extends TestCase {

    private Booking createBooking() {
        Booking b = new Booking();
        b.setBooking_id(1);
        b.setUser_id(10);
        b.setTourist_name("Pruthvi");
        b.setItem_type("Safari");
        b.setItem_name("Jungle Safari");
        b.setItem_image("safari.jpg");
        b.setNum_persons(2);
        b.setTotal_price(3000.50);
        b.setPayment_mode("UPI");
        b.setStatus("Confirmed");
        return b;
    }

    private Map<String, Object> bookingRow() {
        Map<String, Object> row = new HashMap<String, Object>();
        row.put("booking_id", 1);
        row.put("user_id", 10);
        row.put("tourist_name", "Pruthvi");
        row.put("item_type", "Safari");
        row.put("item_name", "Jungle Safari");
        row.put("item_image", "safari.jpg");
        row.put("num_persons", 2);
        row.put("total_price", 3000.50);
        row.put("payment_mode", "UPI");
        row.put("status", "Confirmed");
        return row;
    }

    public void testInsertBookingSuccess() {
        BookingDAOImpl dao =
            new BookingDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.insertBooking(createBooking()));
    }

    public void testInsertBookingFailure() {
        BookingDAOImpl dao =
            new BookingDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.insertBooking(createBooking()));
    }

    public void testUpdateBookingSuccess() {
        BookingDAOImpl dao =
            new BookingDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.updateBooking(createBooking()));
    }

    public void testDeleteBookingSuccess() {
        BookingDAOImpl dao =
            new BookingDAOImpl(DaoTestSupport.emptyConnection(1));

        assertTrue(dao.deleteBooking(1));
    }

    public void testDeleteBookingFailure() {
        BookingDAOImpl dao =
            new BookingDAOImpl(DaoTestSupport.emptyConnection(0));

        assertFalse(dao.deleteBooking(1));
    }

    public void testGetBookingFound() {
        List<Map<String, Object>> rows =
            Collections.singletonList(bookingRow());

        BookingDAOImpl dao =
            new BookingDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        Booking result = dao.getBooking(1);

        assertNotNull(result);
        assertEquals(1, result.getBooking_id());
        assertEquals(10, result.getUser_id());
        assertEquals("Pruthvi", result.getTourist_name());
        assertEquals("Safari", result.getItem_type());
        assertEquals("Jungle Safari", result.getItem_name());
        assertEquals("safari.jpg", result.getItem_image());
        assertEquals(2, result.getNum_persons());
        assertEquals(3000.50, result.getTotal_price(), 0.001);
        assertEquals("UPI", result.getPayment_mode());
        assertEquals("Confirmed", result.getStatus());
    }

    public void testGetBookingNotFound() {
        BookingDAOImpl dao =
            new BookingDAOImpl(DaoTestSupport.emptyConnection(0));

        assertNull(dao.getBooking(999));
    }

    public void testGetAllBookingsEmpty() {
        BookingDAOImpl dao =
            new BookingDAOImpl(DaoTestSupport.emptyConnection(0));

        ArrayList<Booking> result = dao.getAllBookings();

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    public void testGetAllBookingsPopulated() {
        Map<String, Object> first = bookingRow();

        Map<String, Object> second = new HashMap<String, Object>();
        second.put("booking_id", 2);
        second.put("user_id", 11);
        second.put("tourist_name", "Anil");
        second.put("item_type", "Stay");
        second.put("item_name", "Forest Retreat");
        second.put("item_image", "stay.jpg");
        second.put("num_persons", 1);
        second.put("total_price", 2200.0);
        second.put("payment_mode", "Card");
        second.put("status", "Pending");

        List<Map<String, Object>> rows =
            Arrays.asList(first, second);

        BookingDAOImpl dao =
            new BookingDAOImpl(DaoTestSupport.fakeConnection(0, rows));

        ArrayList<Booking> result = dao.getAllBookings();

        assertEquals(2, result.size());
        assertEquals("Pruthvi", result.get(0).getTourist_name());
        assertEquals("Anil", result.get(1).getTourist_name());
        assertEquals(2, result.get(1).getBooking_id());
    }
}
