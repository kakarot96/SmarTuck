package com.fil.SmarTuck.services;

import java.util.List;

import com.fil.SmarTuck.models.Employee;

public interface EmployeeService {

	public List<Employee> getAllEmployees();
	
	public Employee getEmployeeById(String aId);
	
	public void addEmployee(Employee e);
	
	public void deleteEmployee(Employee e);
	
	public Boolean validateEmployee(String aId, String password);
	
}
