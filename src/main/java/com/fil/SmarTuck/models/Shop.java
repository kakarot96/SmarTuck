package com.fil.SmarTuck.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table (name = "Shop")
public class Shop
{
	@Id
	@Column(name="shop_id")
	private String shopId;
	
	@Column
	private String sName;
	
	@Column
	private String password;
	
	@Column
	private String location;
    
	@Column
	private String contact;
	
	@Column
	private int status;
	
	@OneToMany(fetch=FetchType.EAGER)		// list of items of this shop
	@JoinColumn(name="shop_id")
	List<Item> items; 
	
	
	public Shop() {
		super();
	}
	
		
	public String getShopId() {
		return shopId;
	}


	public void setShopId(String shopId) {
		this.shopId = shopId;
	}


	public String getsName() {
		return sName;
	}


	public void setsName(String sName) {
		this.sName = sName;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getContact() {
		return contact;
	}


	public void setContact(String contact) {
		this.contact = contact;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public List<Item> getItems() {
		return items;
	}


	public void setItems(List<Item> items) {
		this.items = items;
	}
	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "Shop [shopId=" + shopId + ", sName=" + sName + ", location=" + location + ", contact=" + contact
				+ ", status=" + status + "]";
	}
	

}
