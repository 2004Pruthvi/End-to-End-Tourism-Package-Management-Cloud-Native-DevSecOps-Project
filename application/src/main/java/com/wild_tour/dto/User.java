package com.wild_tour.dto;

public class User {
	    private int userId;
	    private String user_name;
	    private String email;
	    private long phone;
	    private String password;
	    private String address;
	    
	 // Default constructor
	    public User() {
	    }

	    // Parameterized constructor
	    public User(int userId, String user_name, String email, long phone, String password, String address) {
	        this.userId = userId;
	        this.user_name = user_name;
	        this.email = email;
	        this.phone = phone;
	        this.password = password;
	        this.address = address;
	    }

		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public String getUser_name() {
			return user_name;
		}

		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public long getPhone() {
			return phone;
		}

		public void setPhone(long phone) {
			this.phone = phone;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		@Override
		public String toString() {
			return "User [user_name=" + user_name + ", email=" + email + ", phone=" + phone + ", password=" + password
					+ ", address=" + address + "]";
		}
	    
}