package com.wild_tour.dto;

public class Safari {
	private int safari_id;
    private String name;
    private String image_url;
    private double price_per_seat;
    private String description ;
    
	public int getSafari_id() {
		return safari_id;
	}
	public void setSafari_id(int safari_id) {
		this.safari_id = safari_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public double getPrice_per_seat() {
		return price_per_seat;
	}
	public void setPrice_per_seat(double price_per_seat) {
		this.price_per_seat = price_per_seat;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Safari [safari_id=" + safari_id + ", name=" + name + ", image_url=" + image_url + ", price_per_seat="
				+ price_per_seat + ", description=" + description + "]";
	}
   
	
}
