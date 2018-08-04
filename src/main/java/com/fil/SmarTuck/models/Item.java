package com.fil.SmarTuck.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name = "Item")
public class Item 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int iNo;
	
	@ManyToOne (fetch = FetchType.EAGER)
	@JoinColumn(name = "shop_id")
	private Shop shop; 
	
	@Column
	private String category;
	
	@Column
	private String itemName;
	
	@Column
	private int price;
	
	@Column
	private int quantity;
	
	@Column
	private int preparationTime;
	
	@Column
	private double rating;
	
	@Column
	private int counter;


	public Item() {
		super();
	}


	public int getiNo() {
		return iNo;
	}


	public void setiNo(int iNo) {
		this.iNo = iNo;
	}


	public Shop getShop() {
		return shop;
	}


	public void setShop(Shop shop) {
		this.shop = shop;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getPreparationTime() {
		return preparationTime;
	}


	public void setPreparationTime(int preparationTime) {
		this.preparationTime = preparationTime;
	}


	public double getRating() {
		return rating;
	}


	public void setRating(double rating) {
		this.rating = rating;
	}


	public int getCounter() {
		return counter;
	}


	public void setCounter(int counter) {
		this.counter = counter;
	}


	@Override
	public String toString() {
		return "Item [iNo=" + iNo + ", shop=" + shop + ", category=" + category + ", itemName=" + itemName + ", price="
				+ price + ", quantity=" + quantity + ", preparationTime=" + preparationTime + ", rating=" + rating
				+ ", counter=" + counter + "]";
	}


	



}
