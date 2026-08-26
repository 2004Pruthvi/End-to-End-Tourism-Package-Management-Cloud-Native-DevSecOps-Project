package com.wild_tour.dto;

public class Guide {
	 private int id;
	    private String name;
	    private String bio;
	    private double price;
	    private String image;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getBio() {
			return bio;
		}
		public void setBio(String bio) {
			this.bio = bio;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		@Override
		public String toString() {
			return "Guide [id=" + id + ", name=" + name + ", bio=" + bio + ", price=" + price + ", image=" + image
					+ "]";
		}
	    
	    

}
