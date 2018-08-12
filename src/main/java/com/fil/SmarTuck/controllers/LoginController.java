package com.fil.SmarTuck.controllers;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fil.SmarTuck.models.Order;
import com.fil.SmarTuck.models.Shop;
import com.fil.SmarTuck.services.EmployeeServiceImplementation;
import com.fil.SmarTuck.services.ItemServiceImplementation;
import com.fil.SmarTuck.services.OrderServiceImplementation;
import com.fil.SmarTuck.services.ShopServiceImplementation;

@Controller
public class LoginController {

	@Autowired
	private EmployeeServiceImplementation employeeService;
	@Autowired
	private ShopServiceImplementation shopService;
	@Autowired
	private OrderServiceImplementation orderService;
	@Autowired
	private ItemServiceImplementation itemService;

	public static Logger logger = Logger.getRootLogger();
	
	@RequestMapping("/")
	public String getHomePage() {
		logger.trace("Trace");
		return "login.jsp";
	}

	
	
	@RequestMapping(value = "/employee/home", method = RequestMethod.POST)
	public ModelAndView employeeHome(@RequestParam String id, @RequestParam String password,
			@RequestParam String select, ModelMap model) {
		
		ModelAndView modelAndView = new ModelAndView();
		// validate employee
		
		if (employeeService.validateEmployee(id, password)) {
			List<Shop> shops = shopService.getAllShops();

			modelAndView.addObject("id", id);

			modelAndView.addObject("shops", shops);

			modelAndView.setViewName("/employee/home.jsp");

			return modelAndView;
		} else {
			model.put("errorMessage", "Incorrect Password");
			modelAndView.setViewName("login.jsp");
			return modelAndView;
		}
	}

	// Validate Shop
	@RequestMapping(value = "/shop/home", method = RequestMethod.POST)
	public String shopHome(@RequestParam String id, @RequestParam String password, @RequestParam String select,
			ModelMap model) {

		if (shopService.validateShop(id, password)) {
			List<List<Order>> pendingOrders = orderService.getPendingOrders(id);
			shopService.getShopById(id).setStatus(1);
			List<Integer> orderAmounts=new ArrayList<>(); 
			for (List<Order> list : pendingOrders) {
				orderAmounts.add(orderService.getAmountByOrder(list));
			}
			int shopStatus=shopService.getShopById(id).getStatus();
			model.addAttribute("shopStatus", shopStatus);
			model.addAttribute("orderAmounts", orderAmounts);
			model.addAttribute("pendingOrders",pendingOrders);
			model.addAttribute("id", id);
			
			return "shop/home.jsp";
		} else {
			model.put("errorMessage", "Incorrect Password");
			return "login.jsp";
		}

	}
}
