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
@Table (name = "Employee")
public class Employee {

	@Id  
	@Column(length = 100)
    private String aId;  
    
	@Column(length = 100)
	private String eName;
	
	@Column(length = 100)
    private String password;
	
	@Column(length = 100)
    private String email;
    
	@Column(length = 20)
    private String contact;

//	@Column(length = 100)
//  private String floor;
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="sid")
	private List<Order> orders;
	
	
	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Employee() {
		super();
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	
	@Override
	public String toString() {
		return "Employee [aId=" + aId + ", eName=" + eName + ", password=" + password + ", email=" + email
				+ ", contact=" + contact + "]";
	}
    

    
	
}
