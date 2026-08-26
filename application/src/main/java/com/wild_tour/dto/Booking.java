package com.wild_tour.dto;

	import java.sql.Date;
	import java.sql.Timestamp;

	public class Booking {
	    private int booking_id;
	    private int user_id;
	    private String tourist_name;
	    private String item_type;
	    private String item_name;
	    private String item_image;
	    private int num_persons;
	    private double total_price;
	    private String payment_mode;
	    private String status;

	    private Date booking_date;     // for Safari/Guide
	    private Date from_date;        // for Stay/Package
	    private Date to_date;          // for Stay/Package
	    private Timestamp booked_date; // when the booking was made

	    // Getters and Setters

	    public int getBooking_id() {
	        return booking_id;
	    }

	    public void setBooking_id(int booking_id) {
	        this.booking_id = booking_id;
	    }

	    public int getUser_id() {
	        return user_id;
	    }

	    public void setUser_id(int user_id) {
	        this.user_id = user_id;
	    }

	    public String getTourist_name() {
	        return tourist_name;
	    }

	    public void setTourist_name(String tourist_name) {
	        this.tourist_name = tourist_name;
	    }

	    public String getItem_type() {
	        return item_type;
	    }

	    public void setItem_type(String item_type) {
	        this.item_type = item_type;
	    }

	    public String getItem_name() {
	        return item_name;
	    }

	    public void setItem_name(String item_name) {
	        this.item_name = item_name;
	    }

	    public String getItem_image() {
	        return item_image;
	    }

	    public void setItem_image(String item_image) {
	        this.item_image = item_image;
	    }

	    public int getNum_persons() {
	        return num_persons;
	    }

	    public void setNum_persons(int num_persons) {
	        this.num_persons = num_persons;
	    }

	    public double getTotal_price() {
	        return total_price;
	    }

	    public void setTotal_price(double total_price) {
	        this.total_price = total_price;
	    }

	    public String getPayment_mode() {
	        return payment_mode;
	    }

	    public void setPayment_mode(String payment_mode) {
	        this.payment_mode = payment_mode;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }

	    public Date getBooking_date() {
	        return booking_date;
	    }

	    public void setBooking_date(Date booking_date) {
	        this.booking_date = booking_date;
	    }

	    public Date getFrom_date() {
	        return from_date;
	    }

	    public void setFrom_date(Date from_date) {
	        this.from_date = from_date;
	    }

	    public Date getTo_date() {
	        return to_date;
	    }

	    public void setTo_date(Date to_date) {
	        this.to_date = to_date;
	    }

	    public Timestamp getBooked_date() {
	        return booked_date;
	    }

	    public void setBooked_date(Timestamp booked_date) {
	        this.booked_date = booked_date;
	    }

	    @Override
	    public String toString() {
	        return "Booking [booking_id=" + booking_id + ", user_id=" + user_id + ", tourist_name=" + tourist_name
	                + ", item_type=" + item_type + ", item_name=" + item_name + ", item_image=" + item_image
	                + ", num_persons=" + num_persons + ", total_price=" + total_price + ", payment_mode=" + payment_mode
	                + ", status=" + status + ", booking_date=" + booking_date + ", from_date=" + from_date
	                + ", to_date=" + to_date + ", booked_date=" + booked_date + "]";
	    }
	}


