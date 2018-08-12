package com.fil.SmarTuck.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fil.SmarTuck.models.Employee;
import com.fil.SmarTuck.models.EmployeeRepository;

@Service  
public class EmployeeServiceImplementation implements EmployeeService{

	@Autowired  
    private EmployeeRepository employeeRepository;  
	
	@Override
    public List<Employee> getAllEmployees(){  
        List<Employee> employeeRecords = new ArrayList<>();  
        employeeRepository.findAll().forEach(e -> employeeRecords.add(e));    //lambda expression
        return employeeRecords;  
    }
    
	@Override
    public Employee getEmployeeById(String aId){  
        return employeeRepository.findById(aId).get();
    }
    
	@Override
    public void addEmployee(Employee e){  
        employeeRepository.save(e);  
    }
    
	@Override
    public void deleteEmployee(Employee e){  
        employeeRepository.delete(e);  
    }  
	
	@Override
    public Boolean validateEmployee(String aId, String password){
		try{
		Employee e= getEmployeeById(aId);
    	//return true;
		//System.out.println("e is "+e);
    	if(e.getPassword().equals(password))
    		return true;}
		catch(Exception e){}
		return false;
		
    	
    }
	
}
