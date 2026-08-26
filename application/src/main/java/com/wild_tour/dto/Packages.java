package com.wild_tour.dto;

public class Packages {
	
    private int package_id;
    private String name;
    private String image_url;
    private double price;
    private String description;
    
	public int getPackage_id() {
		return package_id;
	}
	public void setPackage_id(int package_id) {
		this.package_id = package_id;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Packages [package_id=" + package_id + ", name=" + name + ", image_url=" + image_url + ", price=" + price
				+ ", description=" + description + "]";
	}
    
    
}
