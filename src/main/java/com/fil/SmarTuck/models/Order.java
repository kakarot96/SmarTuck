package com.fil.SmarTuck.models;

import java.sql.Date;
import java.sql.Time;

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
@Table (name = "OrderedItem")
public class Order {

	@Id  
	@GeneratedValue(strategy = GenerationType.AUTO)		//for auto increment
    private int sNo;  
    
	@Column (length = 100)
	private String orderId;
	
	
	// write relation
	//@Column (length = 100)
	@ManyToOne (fetch = FetchType.EAGER)
	@JoinColumn (name = "aId")
    private Employee aId; //change type to class
	
	
	//	write relation
	//@Column (length = 100)
	@ManyToOne (fetch = FetchType.EAGER)
	@JoinColumn (name = "iNo")
    private Item iNo;  //change type to class
    
	@Column
	private int qty;
	
	@Column
	private int price;
	
	@Column
	private Date orderDate;
	
	@Column
	private Time orderTime;
	
	@Column
	private Time deliveryTime;
	
	@Column (length = 100)
	private String status;
	
	@Column (precision = 1, scale = 2)
	private double rating;
	
	@Column (length = 500)
    private String remarks;

	
	public Order() {
		super();
	}


	public int getsNo() {
		return sNo;
	}


	public void setsNo(int sNo) {
		this.sNo = sNo;
	}


	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public Employee getaId() {
		return aId;
	}


	public void setaId(Employee aId) {
		this.aId = aId;
	}


	public Item getiNo() {
		return iNo;
	}


	public void setiNo(Item iNo) {
		this.iNo = iNo;
	}


	public int getQty() {
		return qty;
	}


	public void setQty(int qty) {
		this.qty = qty;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public Time getOrderTime() {
		return orderTime;
	}


	public void setOrderTime(Time orderTime) {
		this.orderTime = orderTime;
	}


	public Time getDeliveryTime() {
		return deliveryTime;
	}


	public void setDeliveryTime(Time deliveryTime) {
		this.deliveryTime = deliveryTime;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public double getRating() {
		return rating;
	}


	public void setRating(double rating) {
		this.rating = rating;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	

	
	
}
