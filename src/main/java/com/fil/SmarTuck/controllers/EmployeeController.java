package com.fil.SmarTuck.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fil.SmarTuck.models.Employee;
import com.fil.SmarTuck.models.Item;
import com.fil.SmarTuck.models.Order;
import com.fil.SmarTuck.models.Shop;
import com.fil.SmarTuck.services.EmployeeServiceImplementation;
import com.fil.SmarTuck.services.ItemServiceImplementation;
import com.fil.SmarTuck.services.OrderServiceImplementation;
import com.fil.SmarTuck.services.ShopServiceImplementation;


@Controller 
@SessionAttributes("id")
public class EmployeeController {

	@Autowired  
    private EmployeeServiceImplementation employeeService; 
	@Autowired
	private ShopServiceImplementation shopService;
	@Autowired
	private OrderServiceImplementation orderService;
	@Autowired
	private ItemServiceImplementation itemService;
	
	
	@RequestMapping("/")  
    public String getHomePage(){  
        return "index.jsp";
    }
	
	//  
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView showData(@RequestParam String id,@RequestParam String password,@RequestParam String select,ModelMap model)
	{
		//System.out.println(select);
		
		
		
		
		
		
		
		ModelAndView modelAndView = new ModelAndView();
	// validate employee	
		if(select.equals("employee")){
			if(employeeService.validateEmployee(id, password)){
				List<Shop> shops = shopService.getAllShops();
				
				modelAndView.addObject("id", id);
				
				modelAndView.addObject("shops",shops);
				
		        modelAndView.setViewName("/employee/home.jsp");

		        return modelAndView;
			}
			else{
				model.put("errorMessage", "Invalid User");
			//	System.out.println("invalid user");
				modelAndView.setViewName("index.jsp");
				return modelAndView;
			}	
		}
		
		// Validate Shop
		
		
		else {
			if(shopService.validateShop(id, password)){
				
				List<List<Order>> pendingOrders=orderService.getAllByShopIdAndStatus(id, "pending");
				List<Item> items = shopService.getItemsByShopId(id);
				for (Item item : items) {
					System.out.println(item.toString());
				}
				
				//modelAndView.addObject(id);
				modelAndView.addObject(pendingOrders);
				modelAndView.addObject("id", id);
				
				
		        modelAndView.setViewName("/shop/home.jsp");

		        return modelAndView;
			}
			else{
				model.put("errorMessage", "Invalid User");
			//	System.out.println("invalid user");
				modelAndView.setViewName("index.jsp");
				return modelAndView;
			}
		}
		
		
	}
	
	@RequestMapping("/employee/home")  
    public String getAllShops(){ 
		
		
		
        return  "home"; 
    }
	
    @RequestMapping(value = "/add-employee", method = RequestMethod.POST)  
    public void addEmployee(@RequestBody Employee e){  
        employeeService.addEmployee(e);  
    }
    
    @RequestMapping(value = "/delete-employee", method = RequestMethod.POST)  
    public void deleteEmployee(@RequestBody Employee e){  
        employeeService.deleteEmployee(e);  
    }
    
//    @RequestMapping(value = "/employee/{aId}", method = RequestMethod.GET)  
//    public Optional<Employee> getEmployee(@PathVariable String id){  
//        return employeeService.getEmployeeById(id);  
//    }  
	
	
}
