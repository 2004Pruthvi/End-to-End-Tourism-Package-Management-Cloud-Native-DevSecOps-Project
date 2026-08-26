package com.wild_tour.dto;

public class Stay {
	private int stay_id;
    private String name;
    private String image_url;
    private double price_per_night;
    private String description;
    
    
	public int getStay_id() {
		return stay_id;
	}
	public void setStay_id(int stay_id) {
		this.stay_id = stay_id;
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
	public double getPrice_per_night() {
		return price_per_night;
	}
	public void setPrice_per_night(double price_per_night) {
		this.price_per_night = price_per_night;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Stay [stay_id=" + stay_id + ", name=" + name + ", image_url=" + image_url + ", price_per_night="
				+ price_per_night + ", description=" + description + "]";
	}
    
    
    
}
