package com.fil.SmarTuck.controllers;

import java.util.List;

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

	@RequestMapping("/")
	public String getHomePage() {
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
	public ModelAndView shopHome(@RequestParam String id, @RequestParam String password, @RequestParam String select,
			ModelMap model) {
		ModelAndView modelAndView = new ModelAndView();

		if (shopService.validateShop(id, password)) {

			List<List<Order>> pendingOrders = orderService.getAllByShopIdAndStatus(id, "pending");
			modelAndView.addObject(pendingOrders);
			modelAndView.addObject("id", id);

			modelAndView.setViewName("/shop/home.jsp");

			return modelAndView;
		} else {
			model.put("errorMessage", "Incorrect Password");
			modelAndView.setViewName("login.jsp");
			return modelAndView;
		}

	}
}
