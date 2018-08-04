package com.fil.SmarTuck.controllers;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
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
	public String getHomePage() {
		return "index.jsp";
	}

	//controller for Login validation

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String showData(@RequestParam String id, @RequestParam String password, @RequestParam String select,
			ModelMap model) {	

//		ModelAndView modelAndView = new ModelAndView();
		
		// validate employee
		if (select.equals("employee")) {
			if (employeeService.validateEmployee(id, password)) {
				List<Shop> shops = shopService.getAllShops();

//				modelAndView.addObject("id", id);
//
//				modelAndView.addObject("shops", shops);
				model.addAttribute("id", id);
				model.addAttribute("shops", shops);
//				modelAndView.setViewName("/employee/home.jsp");

//				return modelAndView;
				
				return "/employee/home.jsp";
			} else {
				model.addAttribute("errorMessage", "Invalid User");				 
//				modelAndView.setViewName("index.jsp");
//				return modelAndView;
				 return "index.jsp";
			}
		}

		// Validate Shop

		else {
			if (shopService.validateShop(id, password)) {

				List<List<Order>> placedOrders = orderService.getAllByShopIdAndStatus(id, "placed");
				List<List<Order>> confirmedOrders = orderService.getAllByShopIdAndStatus(id, "placed");
				confirmedOrders.addAll(placedOrders);
				
//				List<Item> items = shopService.getItemsByShopId(id);
//				for (Item item : items) {
//					System.out.println(item.toString());
//				}

//				modelAndView.addObject(pendingOrders);
//				modelAndView.addObject("id", id);
				model.addAttribute("pendingOrders",confirmedOrders);
				model.addAttribute("id",id);
				
//				modelAndView.setViewName("/shop/home.jsp");
//
//				return modelAndView;
				return "/shop/home.jsp";
			} else {
				model.addAttribute("errorMessage", "Invalid User");
				 System.out.println("invalid user");
//				modelAndView.setViewName("index.jsp");
//				return modelAndView;
				 return "index.jsp";
			}
		}

	}

	@RequestMapping(value = "/employee/home", method = RequestMethod.GET)			//in case the user wishes to visit the home page again 
	public String getAllShops(@RequestParam String id, ModelMap model) {
		
		List<Shop> shops = shopService.getAllShops();
		model.addAttribute("id", id);
		model.addAttribute("shops", shops);
		return "/employee/home.jsp";
	}

//	@RequestMapping(value = "/add-employee", method = RequestMethod.POST)		//extra
//	public void addEmployee(@RequestBody Employee e) {
//		employeeService.addEmployee(e);
//	}
//
//	@RequestMapping(value = "/delete-employee", method = RequestMethod.POST)	//extra
//	public void deleteEmployee(@RequestBody Employee e) {
//		employeeService.deleteEmployee(e);
//	}

	
	@RequestMapping(value = "/employee/profile", method = RequestMethod.GET)
	public String viewProfile(@RequestParam String id, ModelMap model) {
		Employee emp = employeeService.getEmployeeById(id);
		model.addAttribute("id", id);
		model.addAttribute("employee",emp);
		return "/employee/profile.jsp";
	}
	
	@RequestMapping(value = "/employee/orderHistory", method = RequestMethod.GET)
	public String viewOrderHistory(@RequestParam String id, ModelMap model) {
		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = orderService.getAllByAId(id);
		model.addAttribute("id", id);
		model.addAttribute("orderHistory",allOrders);
		return "/employee/orderHistory.jsp";
	}
	
	@RequestMapping(value = "/employee/orderSummary", method = RequestMethod.GET)		// needs to be changed
	public String viewOrderSummary(@RequestParam String id, @RequestParam List<Item> items, ModelMap model) {
		List<List<Order>> allOrders = new ArrayList<>();
		allOrders = orderService.getAllByAId(id);
		model.addAttribute("id", id);
		model.addAttribute("orderHistory",allOrders);
		return "/employee/orderSummary.jsp";
	}
	
	@RequestMapping(value = "/employee/orderConfirmation", method = RequestMethod.GET)		
	public String viewOrderConfirmation(@RequestParam String id, @RequestParam List<Order> order, @RequestParam String remarks,ModelMap model) {
		
		String qtyCheck = orderService.checkItemQuantity(order);
		if(!qtyCheck.equals("Following Items are not in sufficient quantity \n")){
			model.addAttribute("id", id);
			return "/shop/menu.jsp";
		}
		Date orderDate = new Date(System.currentTimeMillis());
		Time orderTime =  new Time(System.currentTimeMillis());
		String orderId = orderService.getOrderId(id, orderDate, orderTime);
		orderService.updateOrderId(order, orderId);
		orderService.updateOrderTime(order, orderTime);
		orderService.updateOrderStatus(orderId, "placed");
		orderService.updateRemarks(order, remarks);
		model.addAttribute("id", id);
		model.addAttribute("orderId",orderId);
		return "/employee/orderConfirmation.jsp";
	}
	
	
	@RequestMapping(value = "/employee/orderInformation", method = RequestMethod.GET)		
	public String viewOrderSummary(@RequestParam String id, @RequestParam String orderId, ModelMap model) {
		List<Order> allItems = new ArrayList<>();
		allItems = orderService.getOrderByOrderId(orderId);
		model.addAttribute("id", id);
		model.addAttribute("orderinformation",allItems);
		return "/employee/orderInformation.jsp";
	}
}
